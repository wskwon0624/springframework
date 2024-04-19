package com.mycompany.springframework.controller;

import java.util.Date;

import org.json.JSONObject;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.springframework.dto.Ch03Dto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch03")
public class Ch03Controller {
	@RequestMapping("/receiveData")
	public String getMethodData(String param1, String param2, String param3, String param4, String param5, Model model) {
		log.info("run");
		model.addAttribute("chNum","ch03");
		model.addAttribute("param1", param1);
		model.addAttribute("param2", param2);
		model.addAttribute("param3", param3);
		model.addAttribute("param4", param4);
		model.addAttribute("param5", param5);
		
		return "ch03/receiveData";
	}
	
	@GetMapping("/postMethodForm")
	public String postMethodForm(Model model) {
		model.addAttribute("chNum","ch03");
		log.info("run");
		return "ch03/postMethodForm";
	}
	
	@RequestMapping("/requestParamAnnotaion")
	public String requestParamAnnotaion(@RequestParam("param1") String arg1, 
			@RequestParam("param2") String arg2, 
			@RequestParam("param3") String arg3, 
			@RequestParam("param4") String arg4, 
			@RequestParam("param5") String arg5, 
			Model model) {
		log.info("run");
		model.addAttribute("chNum","ch03");
		model.addAttribute("param1", arg1);
		model.addAttribute("param2", arg2);
		model.addAttribute("param3", arg3);
		model.addAttribute("param4", arg4);
		model.addAttribute("param5", arg5);
		
		return "ch03/requestParamData";
	}
	
	@RequestMapping("/requestParamAnnotaionRequired")
	public String requestParamAnnotaionRequired(
			@RequestParam(required=true) String param1, 
			@RequestParam(required=true) String param2, 
			String param3, 
			String param4, 
			String param5, 
			Model model) {
		log.info("run");
		model.addAttribute("chNum","ch03");
		model.addAttribute("param1", param1);
		model.addAttribute("param2", param2);
		model.addAttribute("param3", param3);
		model.addAttribute("param4", param4);
		model.addAttribute("param5", param5);
		
		return "ch03/requestParamData";
	}
	
	@RequestMapping("/requestParamAnnotaionDefaultValue")
	public String requestParamAnnotaionDefaultValue(
		    String param1, 
			String param2, 
			String param3, 
			String param4, 
			String param5,
			@RequestParam(defaultValue="default")String param6,
			Model model) {
		log.info("run");
		model.addAttribute("chNum","ch03");
		model.addAttribute("param1", param1);
		model.addAttribute("param2", param2);
		model.addAttribute("param3", param3);
		model.addAttribute("param4", param4);
		model.addAttribute("param5", param5);
		model.addAttribute("param6", param6);
		return "ch03/requestParamData";
	}
	
	@RequestMapping("/typeChange")
	public String typeChange(
		    String param1, 
			int param2, 
			double param3, 
			boolean param4, 
			@DateTimeFormat(pattern="yyyy-MM-dd") Date param5,
			@RequestParam(defaultValue="0") int param6,
			Model model) {
		log.info("run");
		model.addAttribute("chNum","ch03");
		model.addAttribute("param1", param1);
		model.addAttribute("param2", param2);
		model.addAttribute("param3", param3);
		model.addAttribute("param4", param4);
		model.addAttribute("param5", param5);
		model.addAttribute("param6", param6);
		return "ch03/requestParamData";
	}
	
	@RequestMapping("/getDto")
	public String getDto(@ModelAttribute("dto")Ch03Dto dto, Model model) {
		
		log.info("run");
		model.addAttribute("chNum","ch03");
		
		return "ch03/getDto";
	}
	
	@RequestMapping("/ajax")
	public String ajax(Model model) {
		
		log.info("run");
		model.addAttribute("chNum","ch03");
		
		return "ch03/ajax";
	}
	
	@PostMapping(value="/getAjaxParams",produces="application/json; charset=UTF-8")
	@ResponseBody()
	public String getAjaxParams(Ch03Dto dto) {
		JSONObject jo = new JSONObject();
		jo.put("param1", dto.getParam1());
		jo.put("param2", dto.getParam2());
		jo.put("param3", dto.getParam3());
		jo.put("param4", dto.isParam4());
		jo.put("param5", dto.getParam5());
		
		return jo.toString();
	};
}
