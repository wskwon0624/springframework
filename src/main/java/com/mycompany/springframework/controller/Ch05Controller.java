package com.mycompany.springframework.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch05")
public class Ch05Controller {
//	@GetMapping("/header")
//	public String header(Model model,
//			@RequestHeader("User-Agent") String userAgent) {
//		log.info("실행");
//
//		if(userAgent.contains("Edg")) {
//			model.addAttribute("browser", "Edg");
//		}else {
//			model.addAttribute("browser", "Chrome");
//		}
//	
//		model.addAttribute("chNum","ch05");
//		return "ch05/header";
//	}
	
	@GetMapping("/header")
	public String header(Model model, HttpServletRequest request) {
		log.info("실행");
		model.addAttribute("chNum","ch05");
		
		String userAgent = request.getHeader("User-Agent");
		if(userAgent.contains("Edg")) {
			model.addAttribute("browser", "Edg");
		}else {
			model.addAttribute("browser", "Chrome");
		}
		
		String clientIp = request.getRemoteAddr();
		model.addAttribute("clientIp", clientIp);
		return "ch05/header";
	}
	
	@GetMapping("/createCookie")
	public String createCookie(HttpServletResponse response) {
		log.info("실행");
		
		Cookie cookie = new Cookie("useremail", "spring@naver.com");
		
		response.addCookie(cookie);
		
		return "redirect:/";
	}
	
	@GetMapping("/readCookie")
	public String readCookie(@CookieValue("useremail") String userEmail, Model model) {
		log.info("실행");
		model.addAttribute("chNum","ch05");
		model.addAttribute("userEmail", userEmail);
		return "ch05/cookie";
	}
}
