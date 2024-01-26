package egovframework.web.general.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/general")
public class HomeController {

	@GetMapping("/main")
	public String main() {
		
		return "general/main";
	}
}
