package com.mycompany.springframework.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springframework.dao.mybatis.Ch13BoardDao;
import com.mycompany.springframework.dto.Ch13Board;
import com.mycompany.springframework.service.Ch13Service;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch13")
public class Ch13Controller {
	@Autowired
	private Ch13Service service;
	
	@GetMapping("/writeBoardForm")
	public String writeBoardForm(Model model) {
		model.addAttribute("chNum", "ch13");
		return "ch13/writeBoardForm";
	}
	
	@PostMapping("/writeBoard")
	public String writeBoard(Ch13Board board) {
		board.setMid("user");
		log.info(board.getBtitle() + " ");
		
		service.writeBoard(board);
		return "redirect:/";
	};
}
