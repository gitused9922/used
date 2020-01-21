package com.usedproduct.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.usedproduct.service.BoardService;
import com.usedproduct.ui.ThePager2;
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
	
	
	@GetMapping(path = {"list.action" })
	public String list(
			            @RequestParam(defaultValue = "1")int pageNo,
			            @RequestParam(required = false) String searchType,
			            @RequestParam(required = false) String searchKey,
			            HttpServletRequest req, Model model) {
		int pageSize = 6;
		int pagerSize = 3;
		//System.out.println("pageNo" + pageNo);
		HashMap<String, Object> params = new HashMap<>();
		int beginning = (pageNo -1) * pageSize +1;
		params.put("beginning", beginning);
		params.put("end", beginning + pageSize);
		params.put("searchType", searchType);
		params.put("searchKey", searchKey);
		
		List<BoardVO> boards = boardService.findBoardWithpaging(params);
		int boardCount = boardService.fidnBoardcount(params);
		
		ThePager2 pager = new ThePager2(boardCount, pageNo, pageSize, pagerSize, "list.action", req.getQueryString());
		
		model.addAttribute("boards",boards);
		model.addAttribute("pager", pager);
		
		return "board/list";
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
