package egovframework.web.admin.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

	@GetMapping("/main")
	public String main() {
		
		
		
		return "admin/main";
	}
}
