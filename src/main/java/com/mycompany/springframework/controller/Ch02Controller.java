package com.mycompany.springframework.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.springframework.dto.Ch02FileInfo;
import com.mycompany.springframework.interceptor.Auth;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch02")

public class Ch02Controller {
	@GetMapping("/getMethod")
	public String getMethod(String chNum, String bkind, String bno, Model model) {
		log.info("getMethod() run");
		log.info(chNum);
		log.info(bkind);
		log.info(bno);
		
		model.addAttribute("chNum", chNum);
		return "/ch02/getMethod";
	}
	
	@RequestMapping(value="/getMethodAjax", method=RequestMethod.GET)
	public String getMethodAjax(String bkind, String bno, Model model) {
		log.info("getMethodAjax() run");
		log.info(bkind);
		log.info(bno);
		
		return "/ch02/getMethodAjax";
	}
	
	@RequestMapping("/postMethod")
	public String postMethod(String chNum, String mid, String mpassword, Model model) {
		log.info("postMethod() run");
		log.info(chNum);
		log.info(mid);
		log.info(mpassword);
		
		model.addAttribute("chNum", chNum);
		return "/ch02/postMethod";
	}
	
	@PostMapping("/postMethodAjax")
	public void postMethodAjax(String mid, String mpassword, HttpServletResponse response) throws IOException {
		log.info("postMethodAjax() run");
		log.info(mid);
		log.info(mpassword);
		
		Map<String, String> map = new HashMap<>();
		map.put("spring", "12345");
		map.put("winter","109876");
		
		JSONObject data = new JSONObject();
		if(map.containsKey(mid)){
			if(map.get(mid).equals(mpassword)) {
				data.put("result", "success");
			}else {
				data.put("result", "fail");
				data.put("reason", "wrongMpassword");
			}
		}else {
			data.put("result", "fail");
			data.put("reason", "wrongMid");
		}
		
		PrintWriter pw = response.getWriter();
		response.setContentType("application/json; charset=UTF-8;");
		pw.println(data.toString());
		pw.flush();
		pw.close();
	}
	
	@GetMapping("/modelAndView")
	public ModelAndView modelAndView(String chNum) {
		log.info("modelAndView run()");
		ModelAndView mav = new ModelAndView();
		mav.addObject("chNum", chNum);
		mav.addObject("company", "맘스터치");
		mav.addObject("userName", "슈퍼사이버거");
		mav.setViewName("ch02/modelAndView");
		return mav;
	}
	
	@GetMapping("/voidReturn")
	public void voidReturn(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = "photo1.jpg";
		String urlPath = "/resources/image/photos/photo1.jpg";
		String fileSystemPath = request.getServletContext().getRealPath(urlPath);
		log.info(fileSystemPath);
		
		String contentType = request.getServletContext().getMimeType(fileName);
		log.info(contentType);
		
		InputStream is = new FileInputStream(fileSystemPath);
		
		response.setContentType(contentType);
		
		OutputStream os = response.getOutputStream();
		
//		byte[] bytes = new byte[1024];
//		while(true) {
//			int readNum = is.read(bytes);
//			if(readNum == -1) {
//				break;
//			}
//			os.write(bytes,0,readNum);
//		}
		
		FileCopyUtils.copy(is,os);
		
		os.flush();
		is.close();
		os.close();
		return;
	}
	
	@GetMapping("/objectreturn")
	public String objectReturn(String chNum, Model model) {
		model.addAttribute("chNum", chNum);
		return "ch02/objectReturn";
	}
	
	@GetMapping(value="/objectreturnjson1",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String objectReturnJson1(String chNum, Model model) {
		log.info("json 1");
		JSONObject jo = new JSONObject();
		jo.put("fileName", "photo1.jpg");
		
		return jo.toString();
	}
	
	@GetMapping(value="/objectreturnjson2",produces="application/json; charset=UTF-8")
	@ResponseBody
	public Ch02FileInfo objectReturnJson2(String chNum, Model model) {
		log.info("json 2");
		Ch02FileInfo fileInfo = new Ch02FileInfo();
		fileInfo.setFileName("photo2.jpg");
		fileInfo.setInfo("beautiful picture");
		return fileInfo;
	}
	
	@GetMapping("/freeAuth")
	public String freeAuth(String chNum, Model model) {
		log.info("freeAuth run");
		model.addAttribute("chNum",chNum);
		return "ch02/freeAuth";
	}
	
	@GetMapping("/onlyAuth")
	@Auth
	public String onlyAuth(String chNum, Model model) {
		log.info("onlyAuth run");
		model.addAttribute("chNum",chNum);
		return "ch02/onlyAuth";
	}
}
