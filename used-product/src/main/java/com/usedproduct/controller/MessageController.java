package com.usedproduct.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.usedproduct.service.MessageService;
import com.usedproduct.ui.ThePager2;
import com.usedproduct.vo.MemberVO;
import com.usedproduct.vo.MessageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(path = { "/message" })
public class MessageController {
	
	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;
	
//	@GetMapping(path = {"/chattingRoom"})
//	public String chattingRoom() {
//		return "message/chattingRoom";
//	}
	
	@PostMapping(path = {"/sendMessage"})
	@ResponseBody
	public void sendMessage(MessageVO message, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");
		message.setMSender(loginUser.getMemberId());
		message.setMsContent(message.getMsContent().replace("\r\n","<br>"));
		
		messageService.insertMessage(message);
	}

	@GetMapping(path = {"/messagePage"})
	public String messagePage(
			MessageVO message, 
			Model model,
			@RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(required = false) String searchType,
            @RequestParam(required = false) String searchKey,
            @RequestParam(defaultValue = "R") String messageType,
            @RequestParam(required = false) String sDate,
            @RequestParam(required = false) String eDate,
            HttpServletRequest req) {
		
		int pageSize = 5;
		int pagerSize = 5;
		HashMap<String, Object> params = new HashMap<>();
		int beginning = (pageNo -1) * pageSize +1;
		HttpSession session = req.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");
		params.put("user", loginUser.getMemberId());
		params.put("beginning", beginning);
		params.put("end", beginning + pageSize);
		params.put("searchType", searchType);
		params.put("searchKey", searchKey);
		params.put("messageType", messageType);
		params.put("sDate", sDate);
		params.put("eDate", eDate);
		for (String key : params.keySet()) {
			log.warn("key : "+ key + ", value : " + params.get(key));
		}
		
		List<MessageVO> messages = messageService.selectListMessage(params);
		int messageCount = messageService.selectListMessageCount(params);
		ThePager2 pager = new ThePager2(messageCount, pageNo, pageSize, pagerSize, "messagePage", req.getQueryString());
		
		model.addAttribute("messages", messages);
		model.addAttribute("pager", pager);
		
		return "message/messagePage";
	}
	
	@GetMapping(path = {"/showMessage"}) 
	@ResponseBody
	public MessageVO showMessage(int no, HttpServletRequest request) {
		return messageService.selectMessage(no);
	}
	
	@PostMapping(path = {"/confirmMessage"})
	@ResponseBody
	public void confirmMessage(int no, HttpServletRequest request) {
		messageService.updateMessage(no);
	}
	
	@PostMapping(path = {"/deleteMessage"})
	@ResponseBody
	public void deleteMessage(int no, HttpServletRequest request) {
		messageService.deleteMessage(no);
	}

}