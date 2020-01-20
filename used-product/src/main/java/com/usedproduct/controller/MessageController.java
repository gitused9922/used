package com.usedproduct.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.usedproduct.service.MessageService;
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
	public String sendMessagePage(MessageVO message, HttpServletRequest request, Model model) {
		log.warn("상품번호 : "+ message.getTNo());
		log.warn("상품명 : "+ message.getMsContent());
		log.warn("보낸 사람 : "+ message.getMSender());
		log.warn("받는 사람 : "+ message.getMReceiver());

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");
		model.addAttribute("message", message);
		
		List<MessageVO> listProduct = messageService.selectListProduct(loginUser.getMemberId());
		model.addAttribute("listProduct", listProduct);
		
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