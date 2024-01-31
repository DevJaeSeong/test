package egovframework.web.admin.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminHomeController {

	@GetMapping("/main")
	public String main() {
		
		log.debug("테스트");
		
		return "admin/main";
	}
}
