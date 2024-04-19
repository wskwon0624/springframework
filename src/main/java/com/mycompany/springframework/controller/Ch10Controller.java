package com.mycompany.springframework.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springframework.exception.Ch10CustomException;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch10")
public class Ch10Controller {
	@GetMapping("/handlingException1")
	public String handlingException1(String data) {
		log.info("run");
		try {
			if(data.equals("java")){
				//NullPointerException 발생  가능
				
			}
		} catch(NullPointerException e) {
			return "ch10/error500_null";
		}
		return "redirect:/";
	}
	
	@GetMapping("/handlingException2")
	public String handlingException2(String data) {
		log.info("run");
		if(data.equals("java")){}
				
		return "redirect:/";
	}
	
	@GetMapping("/handlingException3")
	public String handlingException3() throws Ch10CustomException {
		if(true) {
			throw new Ch10CustomException("그냥 오류");
		}	
		return "redirect:/";
	}
	
	@GetMapping("/handlingException4")
	public String handlingException4() throws IOException{
		if(true) {
			throw new IOException();
		}	
		return "redirect:/";
	}
}
