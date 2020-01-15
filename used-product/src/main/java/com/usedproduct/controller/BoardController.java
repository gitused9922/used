package com.usedproduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usedproduct.service.BoardService;
import com.usedproduct.vo.BoardVO;

import lombok.extern.log4j.Log4j;

/**
 * 중고상품 게시판
 */
@Controller
@RequestMapping(path = { "/board" })
@Log4j
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

	@GetMapping(path = { "/write.action" })
	public String showWriteForm() { // 글쓰기 화면 보기

		return "board/write";
	}

	@PostMapping("/write.action")
	public String write(BoardVO board, RedirectAttributes attr) {

		// 글번호 시퀀스 만들어야함
		int newBoardNo = boardService.writeBoard(board);
		log.warn("NEW BOARD NO : " + newBoardNo);
		attr.addAttribute("newBno", newBoardNo);
		

		return "redirect:write.action";
	}

}
