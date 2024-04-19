package com.mycompany.springframework.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springframework.dto.Ch04LoginForm;
import com.mycompany.springframework.dto.Ch04LoginFormValidator;
import com.mycompany.springframework.dto.Ch04SignupForm;
import com.mycompany.springframework.dto.Ch04SignupFormValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch04")
public class Ch04Controller {
	@GetMapping("/loginForm")
	public String loginForm(Model model) {
		model.addAttribute("chNum", "ch04");
		return "ch04/loginForm";
	}
	
	@InitBinder("ch04LoginForm")
	public void ch04LoginFormValidator(WebDataBinder binder) {
		binder.setValidator(new Ch04LoginFormValidator());
	}
	
	@RequestMapping("/login")
	public String login(@Valid Ch04LoginForm loginForm, Errors errors, Model model) {
		log.info("run");
		if(errors.hasErrors()) {
			model.addAttribute("chNum", "ch04");
			return "ch04/loginForm";
		}
		
		
		return "redirect:/";
	}
	
	@GetMapping("/signupForm")
	public String signupForm(Model model) {
		model.addAttribute("chNum", "ch04");
		return "ch04/signupForm";
	}
	
	@InitBinder("ch04SignupForm")
	public void ch04SignupFormValidator(WebDataBinder binder) {
		binder.setValidator(new Ch04SignupFormValidator());
	}
	
	@RequestMapping("/signup")
	public String signup(@Valid Ch04SignupForm signupForm, Errors errors, Model model) {
		log.info("run");
		if(errors.hasErrors()) {
			model.addAttribute("chNum", "ch04");
			return "ch04/signupForm";
		}
		
		
		return "redirect:/";
	}
}
