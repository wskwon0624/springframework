package com.mycompany.springframework.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch01")
public class Ch01Controller {
	private static final Logger LOGGER= LoggerFactory.getLogger(Ch01Controller.class);
	@RequestMapping("/content")
	public String content(String chNum, Model model) {
		LOGGER.info("content() run");
		
		model.addAttribute("chNum", chNum);
		return "ch01/content";
	}
}
