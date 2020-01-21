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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping(path = {"/chattingRoom"})
	public String chattingRoom() {
		return "message/chattingRoom";
	}
	
	@GetMapping(path = {"/sendMessagePage"})
	public String sendMessagePage(
			MessageVO message, 
			Model model,
			@RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(required = false) String searchType,
            @RequestParam(required = false) String searchKey,
            HttpServletRequest req) {
		log.warn("상품번호 : " + message.getTNo());
		log.warn("상품명 : " + message.getMsContent());
		log.warn("받는 사람 : " + message.getMReceiver());
		model.addAttribute("message", message);
		
		int pageSize = 1;
		int pagerSize = 3;
		HashMap<String, Object> params = new HashMap<>();
		int beginning = (pageNo -1) * pageSize +1;
		HttpSession session = req.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");
		params.put("receiver", loginUser.getMemberId());
		params.put("beginning", beginning);
		params.put("end", beginning + pageSize);
		params.put("searchType", searchType);
		params.put("searchKey", searchKey);
//		for (String key : params.keySet()) {
//			System.out.println("key : "+ key + ", value : " + params.get(key));
//		}
		
		List<MessageVO> Senders = messageService.selectListMessageSender(params);
		int messageCount = messageService.selectMessageCount(params);
		ThePager2 pager = new ThePager2(messageCount, pageNo, pageSize, pagerSize, "sendMessagePage", req.getQueryString());
		
		model.addAttribute("Senders", Senders);
		model.addAttribute("pager", pager);
		
		return "message/sendMessagePage";
	}
	
	@PostMapping(path = {"/sendMessage"})
	@ResponseBody
	public String sendMessage(MessageVO message, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");
		message.setMSender(loginUser.getMemberId());
		message.setMsContent(message.getMsContent().replace("\r\n","<br>"));
		
		messageService.insertMessage(message);
		return "success";
	}
	
}