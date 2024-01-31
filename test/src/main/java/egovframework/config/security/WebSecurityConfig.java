package egovframework.config.security;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.SessionManagementFilter;

import egovframework.config.filter.CustomFilter;
import egovframework.config.filter.RequestPrintFilter;
import egovframework.config.security.mapper.SecurityMapper;
import egovframework.config.security.vo.UserDetailVo;
import egovframework.config.security.vo.UserVo;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Spring Security 설정 클래스.
 */
@EnableWebSecurity(debug = false)
@AllArgsConstructor
@Slf4j
public class WebSecurityConfig {
	
	private final SecurityMapper securityMapper;
	private final Executor executor;

	@Bean
	WebSecurityCustomizer webSecurityCustomizer() {
		
		return (web) -> web.ignoring().requestMatchers("/static/**");
	}
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		
		http.addFilterAfter(new RequestPrintFilter(executor), SessionManagementFilter.class)
			.addFilterAfter(new CustomFilter(), RequestPrintFilter.class);
		
		http.exceptionHandling((exceptionHandlingCustomizer) -> exceptionHandlingCustomizer
				
			.authenticationEntryPoint((request, response, authException) -> {
				
				log.debug("인증 에러 발생: {}", authException.getMessage());
				response.sendRedirect("/general/main");
			})
			.accessDeniedHandler((request, response, accessDeniedException) -> {
				
				log.debug("인증 에러 발생: {}", accessDeniedException.getMessage());
				response.sendRedirect("/general/main");
			})
		);
		
		http.authorizeHttpRequests((requests) -> requests
				
			.requestMatchers("/", "/general/**").permitAll()
			.requestMatchers("/admin/**").hasRole("ADMIN")
			.anyRequest().authenticated()
		);
		
		http.formLogin((form) -> form
				
			.loginPage("/login")
			.loginProcessingUrl("/loginConfirm")
			.permitAll()
			.usernameParameter("userId")
		    .passwordParameter("password")
			.successHandler((request, response, authentication) -> {
				
				try {
					
					UserDetailVo userDetailVo = securityMapper.getUserDetailById(authentication.getName());
					
					UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) authentication;
					token.setDetails(userDetailVo);
					
				} catch (Exception e) {
					
					log.error("인증정보에 userDetailVo 추가하려던 도중 에러 발생.");
					e.printStackTrace();
				}
				
				String redirectPath = "/general/main";
				List<? extends GrantedAuthority> grantedAuthorities = (List<? extends GrantedAuthority>) authentication.getAuthorities();
				
				for (GrantedAuthority grantedAuthority : grantedAuthorities) {
					
					if ("ROLE_ADMIN".equals(grantedAuthority.getAuthority())) { 
						
						redirectPath = "/admin/main"; 
						break; 
					}
				}
				
				response.sendRedirect(redirectPath);
			})
			.failureHandler((request, response, exception) -> {
				
				log.debug("로그인 실패: [{}] {}",exception.getStackTrace()[0] ,exception.getMessage());
				
				String errorMsg;
				
				if (exception instanceof UsernameNotFoundException) 
					{ errorMsg = "아이디 또는 비밀번호가 잘못되었습니다."; } 
				
				else if (exception instanceof BadCredentialsException) 
					{ errorMsg = "아이디 또는 비밀번호가 잘못되었습니다."; } 
				
				else 
					{ errorMsg = "로그인에 실패하였습니다.."; }
				
				
				HttpSession session = request.getSession();
				session.setAttribute("errorMsg", errorMsg);
				
				response.sendRedirect("/general/login");
			})
		);
		
		http.logout((logout) -> logout
			
			.logoutUrl("/logoutConfirm")
			.permitAll()
			.logoutSuccessHandler((request, response, authentication) -> {
				
				response.sendRedirect("/general/main");
			})
		);
		
		/*
		http.csrf((csrfCustomizer) -> csrfCustomizer
				
			.ignoringRequestMatchers("/logoutConfirm")
		);
		*/
		
		return http.build();
	}
	
	@Bean
	PasswordEncoder passwordEncoder() {
		
		return new BCryptPasswordEncoder(14);
	}
	
	@Bean
	UserDetailsService userDetailsService() {
		
		return new UserDetailsService() {
			
			@Override
			public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
				
				UserVo userVo = null;
				
				try {
					
					userVo = securityMapper.getUserByIdForLogin(username);
					
				} catch (Exception e) {
					
					log.error("DB 에러 발생");
					e.printStackTrace();
				}
				
				if (userVo == null) { 
					
					throw new UsernameNotFoundException("DB에서 해당 아이디를 조회하지 못함."); 
				}
				
				
				return User.builder()
							   .username(userVo.getUserId())
							   .password(userVo.getPassword())
							   .disabled(userVo.isDisabled())
							   .accountExpired(userVo.isAccountExpired())
							   .credentialsExpired(userVo.isCredentialsExpired())
							   .accountLocked(userVo.isAccountLocked())
							   .authorities(getAuthorities(userVo.getAuthorityId()))
						   .build();
			}
			
			private Collection<? extends GrantedAuthority> getAuthorities(String AuthorityId) {

				List<GrantedAuthority> authorities;
				
				if (AuthorityId != null) {
					
					switch (AuthorityId) {
					
						case "1001"	: authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_ADMIN")); break;
						default		: authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_ANONYMOUS")); break;
					}
					
				} else {
					
					authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_ANONYMOUS"));
				}
				
				return authorities;
			}
		};
	}
	
	@Bean
	AuthenticationProvider authenticationProvider() {
		
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        
        daoAuthenticationProvider.setUserDetailsService(userDetailsService());
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
        
        return daoAuthenticationProvider;		
	}
}
