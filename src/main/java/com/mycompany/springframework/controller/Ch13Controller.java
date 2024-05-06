package com.mycompany.springframework.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springframework.dto.Ch13Board;
import com.mycompany.springframework.dto.Ch13Pager;
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
	
		if(board.getBattach() != null && !board.getBattach().isEmpty()) {
			board.setBattachoname(board.getBattach().getOriginalFilename());
			board.setBattachtype(board.getBattach().getContentType());
			try {
				board.setBattachdata(board.getBattach().getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		board.setMid("user");
		
		service.writeBoard(board);
		return "redirect:/ch13/boardList";
	};
	
	@GetMapping("/boardList")
	public String boardList(String pageNo, Model model,
			HttpSession session) {
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		session.setAttribute("pageNo", pageNo);
		int intPageNo = Integer.parseInt(pageNo);
	
		int rowsPagintTarget = service.getTotalRows();
		Ch13Pager pager = new Ch13Pager(10, 10, rowsPagintTarget, intPageNo);
		List<Ch13Board> boardList = service.boardList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("boardList", boardList);
		return "ch13/boardList";
	}
	
	@GetMapping("/detailBoard")
	public String detailBoard(int bno, Model model) {
		Ch13Board board = service.getBoard(bno);
		model.addAttribute("board", board);
		return "ch13/detailBoard";
	}
	
	@GetMapping("/attachDownload")
	public void attachDownload(int bno, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Ch13Board board = service.getBoard(bno);
		byte[] data = service.getAttachData(bno);
		
		response.setContentType(board.getBattachtype());
		String fileName = new String(board.getBattachoname().getBytes("UTF-8"),"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
		if(data == null) {
			log.info("null");
		}
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}
	
	@GetMapping("/updateBoardForm")
	public String updateBoardForm(int bno, Model model) {
		Ch13Board board = service.getBoard(bno);
		model.addAttribute("board", board);
		return "ch13/updateBoardForm";
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(Ch13Board board) {
		
		if(board.getBattach() != null && !board.getBattach().isEmpty()) {
			board.setBattachoname(board.getBattach().getOriginalFilename());
			board.setBattachtype(board.getBattach().getContentType());
			try {
				board.setBattachdata(board.getBattach().getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		service.updateBoard(board);
		
		return "redirect:/ch13/detailBoard?bno="+board.getBno();
	}
	
	@GetMapping("/deleteBoard")
	public String deleteBoard(int bno) {
		service.removeBoard(bno);
		return "redirect:/ch13/boardList";
	}
}

