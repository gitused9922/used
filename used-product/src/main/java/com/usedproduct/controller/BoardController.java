package com.usedproduct.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usedproduct.service.BoardService;
import com.usedproduct.ui.ThePager2;
import com.usedproduct.vo.BoardVO;
import com.usedproduct.vo.CategoryVO;

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
	public String showWriteForm(Model model) { // 글쓰기 화면 보기
		List<CategoryVO> category = boardService.findAllCategory();
		model.addAttribute("category", category);
		//System.out.println(category);
		return "board/write";
	}

	@PostMapping(path = { "/write.action" })
	public String write(BoardVO board, RedirectAttributes attr, HttpServletRequest req  ) {
			

		int newBoardNo = boardService.writeBoard(board);
		// log.warn("NEW BOARD NO : " + newBoardNo);
		attr.addAttribute("newBno", newBoardNo);

		return "redirect:list.action";
	}

	@GetMapping(path = { "/list2.action" })
	public String list(Model model) {

		List<BoardVO> boards = boardService.findBoard();

		model.addAttribute("boards", boards);

		return "board/list";
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

	// 파일업로드다운로드
	@RequestMapping(path = "/galleryimageupload")
	public String imageUpload(MultipartFile Filedata, String callback, String callback_func, HttpServletRequest req)
			throws Exception {

		String return1 = callback;
		String return2 = "?callback_func=" + callback_func;
		String return3 = "";
		String fileName = "";

		if (Filedata != null) {

			fileName = Filedata.getOriginalFilename();
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			// 파일 기본경로
			String defaultPath = req.getServletContext().getRealPath("/");
			// 파일 기본경로 _ 상세경로
			String path = defaultPath + "resources" + File.separator + "upload" + File.separator;

			File file = new File(path);

			// 디렉토리 존재하지 않을경우 디렉토리 생성
			if (!file.exists()) {
				file.mkdirs();
			}

			// 서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
			String realname = UUID.randomUUID().toString() + "." + ext;
			///////////////// 서버에 파일쓰기 /////////////////
			Filedata.transferTo(new File(path + realname));

			return3 += "&bNewLine=true&sFileName=" + fileName + "&sFileURL=/used-product/resources/upload/" + realname;
		} else {
			return3 += "&errstr=error";
		}

		return "redirect:" + return1 + return2 + return3;
	}

	@RequestMapping(path = "/galleryimageupload2")
	@ResponseBody
	public String imageUpload2(HttpServletRequest req) throws Exception {
		String sFileInfo = "";
		// 파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴
		String name = req.getHeader("file-name");
		String ext = name.substring(name.lastIndexOf(".") + 1);
		// 파일 기본경로
		String defaultPath = req.getServletContext().getRealPath("/");
		// 파일 기본경로 _ 상세경로
		String path = defaultPath + "upload" + File.separator;
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		String realname = UUID.randomUUID().toString() + "." + ext;
		InputStream is = req.getInputStream();
		OutputStream os = new FileOutputStream(path + realname);
		int numRead;
		// 파일쓰기
		byte b[] = new byte[Integer.parseInt(req.getHeader("file-size"))];
		while ((numRead = is.read(b, 0, b.length)) != -1) {
			os.write(b, 0, numRead);
		}
		if (is != null) {
			is.close();
		}
		os.flush();
		os.close();
		sFileInfo += "&bNewLine=true&sFileName=" + name + "&sFileURL=" + "/used-product/upload/" + realname;

		return sFileInfo;

	}

}
