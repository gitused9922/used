package com.usedproduct.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.usedproduct.service.BoardService;
import com.usedproduct.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		List<BoardVO> boards = boardService.findBoard();

		model.addAttribute("boards", boards);
		
		return "home";
	}

	@GetMapping(path = { "/detail.action" })
	public String showDetail(int no, Model model
			//,HttpServletRequest req, HttpServletResponse resq
			) {


		BoardVO board = boardService.findBoardNo(no);
		if (board == null) {
			return "redirect:list.action";
		};

//		String noRead = "";
//		Cookie[] cookies = req.getCookies();
//		for( Cookie cookie : cookies ) {
//			if( cookie.getName().equals("no_read")){
//				noRead = cookie.getValue();
//			}
//		}

		// 조회 데이터 저장 
		model.addAttribute("board", board);
		//System.out.println("내용 : "+board.getContent());
		return "board/detail";
	}

	
}
