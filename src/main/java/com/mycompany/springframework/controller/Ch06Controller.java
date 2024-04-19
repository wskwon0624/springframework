package com.mycompany.springframework.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springframework.dto.Ch06Cart;
import com.mycompany.springframework.dto.Ch06Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch06")
public class Ch06Controller {
	@RequestMapping("/forward")
	public String forward(Model model, HttpServletRequest request) {
		model.addAttribute("chNum", "ch06");
		Ch06Member member = new Ch06Member();
		member.setMid("spring");
		member.setMname("김자바");
		member.setMemail("java@naver.com");
		
		model.addAttribute("member1", member);
		request.setAttribute("member2",member);
		
		return "ch06/forward";
	}
	
	@RequestMapping("/redirect")
	public String redirect(HttpSession session) {
		log.info("run");
		
		List<String> items = new ArrayList<>();
		items.add("상품1");
		items.add("상품2");
		items.add("상품3");
		Ch06Cart cart = new Ch06Cart();
		cart.setItems(items);
		session.setAttribute("cart", cart);
		
		
		return "redirect: session";
	}
	
	@RequestMapping("/session")
	public String session(HttpSession session, Model model) {
		log.info("run");
		model.addAttribute("chNum", "ch06");
//		Ch06Cart cart = (Ch06Cart) session.getAttribute("cart");
//		if(cart != null) {
//			for(String item : cart.getItems()) {
//				log.info(item);
//			}
//		}
		return "ch06/session";
	}
}
