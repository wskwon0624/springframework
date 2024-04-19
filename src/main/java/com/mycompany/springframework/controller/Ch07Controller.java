package com.mycompany.springframework.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.springframework.dto.Ch07Board;
import com.mycompany.springframework.dto.Ch07JoinForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch07")
public class Ch07Controller {
	@GetMapping("/request1")
	public ModelAndView request1(Model model) {
		List<Ch07Board> boardList = new ArrayList<>();
		for(int i=1; i<=10; i++) {
			boardList.add(new Ch07Board(i,"제목"+i,"봄날"+i,"작성자"+i, 0, new Date()));
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("chNum", "ch07");
		modelAndView.addObject("boardList", boardList);
		modelAndView.setViewName("ch07/requestData");
		return modelAndView;
	}
	
	@ModelAttribute("jobList")
	public List<String> getJobList(){
		List<String> jobList = new ArrayList<>();
		jobList.add("개발자");
		jobList.add("디자이너");
		jobList.add("엔지니어");
		
		return jobList;
	}
	
	@ModelAttribute("cityList")
	public List<String> getCityList(){
		List<String> cityList = new ArrayList<>();
		cityList.add("서울");
		cityList.add("부산");
		cityList.add("제주");
		
		return cityList;
	}
	
	@GetMapping("/request2")
	public String request2(Model model) {
		model.addAttribute("chNum","ch07");
		
		Ch07JoinForm jf = new Ch07JoinForm();
		jf.setMname("겨울");
		jf.setMid("윈터");
		jf.setMpassword("winter");
		jf.setMjob("엔지니어");
		jf.setMcity("제주");
		model.addAttribute("joinForm", jf);
		return "ch07/joinForm";
	}
	
	@PostMapping("/request2")
	public String postRequest2(Model model, @ModelAttribute("joinForm") Ch07JoinForm joinForm) {
		model.addAttribute("chNum","ch07");
		
		return "ch07/memberInfo";
	}

	@RequestMapping("/sessionLoginForm")
	public String sessionLoginForm(Model model) {
		log.info("run");
		model.addAttribute("chNum","ch07");
		return "ch07/loginForm";
	}
	
	@RequestMapping("/sessionLogin")
	public String sessionLogin(Model model, HttpSession session) {
		log.info("run");
		session.setAttribute("login", "success");
		return "redirect: sessionLoginForm";
	}
	
	@RequestMapping("/sessionLogout")
	public String sessionLogout(Model model, HttpSession session) {
		log.info("run");
		session.removeAttribute("login");
		return "redirect: sessionLoginForm";
	}
	
	@GetMapping("/application")
	public String application(Model model, HttpServletRequest request) {
		model.addAttribute("chNum","ch07");
		
		ServletContext application = request.getServletContext();
		Integer counter = (Integer)application.getAttribute("counter");
		
		if(counter == null) {
			application.setAttribute("counter", 1);
		}else {
			log.info("hi");
			application.setAttribute("counter", ++counter);
		}
		
		return "ch07/applicationData";
	}
	
}
