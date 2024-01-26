package egovframework.web.general.account.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.config.security.vo.UserVo;
import egovframework.web.general.account.service.AccountService;
import egovframework.web.general.account.vo.CreateAccountVo;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/general")
@AllArgsConstructor
public class AccountController {

	private final AccountService accountService;
	
	/**
	 * 회원가입 화면.
	 */
	@GetMapping("/createAccount")
	public String createAccount() {
		
		return "general/createAccount";
	}
	
	/**
	 * 회원등록 수행.
	 * 
	 * @param createAccountVo 회원 등록할 데이터.
	 * @return 성공여부 JSON
	 */
	@PostMapping("createAccountConfirm")
	@ResponseBody
	public Object createAccountConfirm(@Valid @RequestBody CreateAccountVo createAccountVo, 
									   BindingResult bindingResult) {
		
		// 유효성 검사 실패시
		if (bindingResult.hasErrors()) {
			
	        List<FieldError> errors = bindingResult.getFieldErrors();
	        Map<String, String> errorMap = new HashMap<>();
	        
	        for (FieldError error : errors) {
	        	
	            errorMap.put(error.getField(), error.getDefaultMessage());
	        }
	        
	        return ResponseEntity.badRequest().body(errorMap);
		}
		
		Map<String, String> sendResult;
		
		if (accountService.doCreateAccount(createAccountVo))
			sendResult = Map.of("result", "success");
		else
			sendResult = Map.of("result", "fail");
		
		return sendResult;
	}
	
	@GetMapping("/login")
	public String login(HttpSession session, Model model) {
		
		String errorMsg = (String) session.getAttribute("errorMsg");
		
		if (errorMsg != null) { 
			
			model.addAttribute("errorMsg", errorMsg); 
			session.removeAttribute("errorMsg");
		}
		
		return "general/login";
	}
	
	@PostMapping("/checkDuplicateId")
	@ResponseBody
	public Object checkDuplicateId(@RequestBody UserVo userVo) {
		
		Map<String, String> result;
		
		try {
			
			if (accountService.isExistsUserId(userVo.getUserId()))
				{ result = Map.of("result", "exists"); }
			else
				{ result = Map.of("result", "not_exists"); }
			
		} catch (Exception e) {
			
			result = Map.of("result", "error");
		}
		
		return result;
	}
	
}
