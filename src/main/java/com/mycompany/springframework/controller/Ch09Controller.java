package com.mycompany.springframework.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.springframework.dto.Ch09FileUploadForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch09")
public class Ch09Controller {
	@RequestMapping("/fileUploadForm")
	public String fileUploadForm(Model model) {
		model.addAttribute("chNum", "ch09");
		return "ch09/fileUploadForm";
	}
	
/*	@PostMapping("/fileUpload")
	public String fileUpload(String title, String desc,MultipartFile attach) throws IllegalStateException, IOException {
		log.info(title + " " + desc);
		log.info(attach.getOriginalFilename());
		log.info(attach.getContentType());
		log.info(attach.getSize()+"");
		
		File destDir = new File("C:/Temp/uploadFiles");
		if(!destDir.exists()) destDir.mkdirs();
		File destFile = new File(destDir, new Date().getTime()+"-" + attach.getOriginalFilename());
		attach.transferTo(destFile);
		return "redirect:/ch09/fileUploadForm";
	}*/
	
	@PostMapping("/fileUpload")
	public String fileUpload(Ch09FileUploadForm dto) throws IllegalStateException, IOException {

		File destDir = new File("C:/Temp/uploadFiles");
		if(!destDir.exists()) destDir.mkdirs();
		File destFile = new File(destDir, new Date().getTime()+"-" + dto.getAttach().getOriginalFilename());
		dto.getAttach().transferTo(destFile);
		return "redirect:/ch09/fileUploadForm";
	}
	
	@PostMapping(value="/fileUploadAjax",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String fileUploadAjax(Ch09FileUploadForm dto) throws IllegalStateException, IOException {
		File destDir = new File("C:/Temp/uploadFiles");
		if(!destDir.exists()) destDir.mkdirs();
		String fileName = new Date().getTime()+"-" + dto.getAttach().getOriginalFilename();
		File destFile = new File(destDir, fileName);
		dto.getAttach().transferTo(destFile);

		
		JSONObject jo = new JSONObject();
		jo.put("result", "success");
		jo.put("originalFileName", dto.getAttach().getOriginalFilename());
		jo.put("savedFileName", fileName);
		return jo.toString();
	}
	
	@GetMapping("/downloadFileList")
	public String downloadFileList(Model model) {
		model.addAttribute("chNum", "ch09");
		File destDir = new File("C:/Temp/uploadFiles");
		String[] fileNames = destDir.list();
		model.addAttribute("fileNames",fileNames);
		
		
		return "ch09/downloadFileList";
	}
	
	@GetMapping("/downloadFile")
	public void downloadFile(String fileName,HttpServletRequest request,HttpServletResponse response) throws IOException {
		log.info("run");
		String filePath = "C:/Temp/uploadFiles/" + fileName;
		String fileType = request.getServletContext().getMimeType(fileName);
		fileName = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		
		response.setContentType(fileType);
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
		
		OutputStream os = response.getOutputStream();
		Path path = Paths.get(filePath);
		Files.copy(path, os);
		os.flush();
		os.close();
		return;
	}
	
}
