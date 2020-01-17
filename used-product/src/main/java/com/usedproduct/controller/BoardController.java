package com.usedproduct.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usedproduct.service.BoardService;
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
		System.out.println(category);
		return "board/write";
	}

	@PostMapping("/write.action")
	public String write(BoardVO board, RedirectAttributes attr) {
		
		System.out.println(board.getNo());
		System.out.println(board.getCgName());
		log.warn(board.getNo());
		// 글번호 시퀀스 만들어야함
		int newBoardNo = boardService.writeBoard(board);
		log.warn("NEW BOARD NO : " + newBoardNo);
		attr.addAttribute("newBno", newBoardNo);
		

		return "redirect:write.action";
	}
	
	
	@GetMapping(path = {"/list" })
	public String list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<BoardVO> boards = boardService.findBoard();
		
		model.addAttribute("boards", boards);
		model.addAttribute("loginuser", session.getAttribute("loginuser"));

		return "board/list";
	}
	
	
	@RequestMapping(path = "/galleryimageupload")
	public String imageUpload(MultipartFile Filedata, String callback, String callback_func, HttpServletRequest req) throws Exception {
		
		String return1 = callback;
		String return2 = "?callback_func=" + callback_func;
		String return3 = "";
		String fileName = "";
		
		if (Filedata != null) {
					
			fileName = Filedata.getOriginalFilename();
            String ext = fileName.substring(fileName.lastIndexOf(".")+1);
            //파일 기본경로
            String defaultPath = req.getServletContext().getRealPath("/");
            //파일 기본경로 _ 상세경로
            String path = defaultPath + "resources" + File.separator + "upload" + File.separator;
             
            File file = new File(path);
             
            //디렉토리 존재하지 않을경우 디렉토리 생성
            if(!file.exists()) {
                file.mkdirs();
            }
            
            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
            String realname = UUID.randomUUID().toString() + "." + ext;
            ///////////////// 서버에 파일쓰기 ///////////////// 
            Filedata.transferTo(new File(path + realname));

            return3 += "&bNewLine=true&sFileName="+fileName+"&sFileURL=/used-product/resources/upload/"+realname;
        }else {
            return3 += "&errstr=error";
        }
		
		return "redirect:" + return1+return2+return3;
	}
	
	@RequestMapping(path = "/galleryimageupload2")
	@ResponseBody
	public String imageUpload2(HttpServletRequest req) throws Exception {
		String sFileInfo = "";
		//파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴 
		String name = req.getHeader("file-name");
		String ext = name.substring(name.lastIndexOf(".")+1);
		//파일 기본경로
		String defaultPath = req.getServletContext().getRealPath("/");
		//파일 기본경로 _ 상세경로
		String path = defaultPath + "upload" + File.separator;
		File file = new File(path);
		if(!file.exists()) {
		    file.mkdirs();
		}
		String realname = UUID.randomUUID().toString() + "." + ext;
		InputStream is = req.getInputStream();
		OutputStream os=new FileOutputStream(path + realname);
		int numRead;
		// 파일쓰기
		byte b[] = new byte[Integer.parseInt(req.getHeader("file-size"))];
		while((numRead = is.read(b,0,b.length)) != -1){
		    os.write(b,0,numRead);
		}
		if(is != null) {
		    is.close();
		}
		os.flush();
		os.close();
		sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL="+"/used-product/upload/"+realname;
		
		return sFileInfo;
		
	}
	

}
