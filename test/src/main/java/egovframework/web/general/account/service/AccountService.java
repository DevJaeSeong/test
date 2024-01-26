package egovframework.web.general.account.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.web.general.account.mapper.AccountMapper;
import egovframework.web.general.account.vo.CreateAccountVo;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class AccountService {

	private final PasswordEncoder passwordEncoder;
	private final AccountMapper accountMapper;

	public boolean doCreateAccount(CreateAccountVo createAccountVo) {
		
		try {
			
			String hashedPassword = passwordEncoder.encode(createAccountVo.getPassword());
			createAccountVo.setPassword(hashedPassword);
			int result = accountMapper.insertUser(createAccountVo);
			return result  > 0 ? true : false;
			
		} catch (Exception e) {
			
			log.error("DB 에러.");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * DB에 userId를 조회하여 계정이 이미 있는지 확인.
	 * 
	 * @param userId 조회할 아이디
	 * @return 있다면 true, 없다면 false
	 * @throws Exception
	 */
	public boolean isExistsUserId(String userId) throws Exception {
		
		return accountMapper.isExistsUserId(userId);
	}
}
