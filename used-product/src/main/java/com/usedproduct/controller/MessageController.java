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
	
	@GetMapping(path = {"/listMember"})
	public String selectListMember(MessageVO message, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");		
		String receiver = loginUser.getMemberId();
		message.setMReceiver(receiver);
		
		//VALUES(seq_t_ms_sequence.nextval, #{msContent }, sysdate, #{mSender }, #{tNo }, #{mReceiver })
		System.out.println("상품번호 : "+ message.getTNo());
		System.out.println("상품명 : "+ message.getMsContent());
		System.out.println("보낸 사람 : "+ message.getMSender());
		
		System.out.println("받는 사람 : "+ message.getMReceiver()); //세션
		
		int tNo = -1;
		tNo = message.getTNo();
		if(tNo != -1) {
			messageService.insertMessage(message);
		}
		
		List<MessageVO> memberList = messageService.selectListMember(receiver);

		for (MessageVO messageVO : memberList) {
			messageVO.setUnConfirmCnt(messageService.selectUnConfirmCnt(messageVO.getMSender(), receiver));
		}

		model.addAttribute("memberList", memberList);
		model.addAttribute("message", message);
		//model.addAttribute("mSender", receiver);
		
		return "message/list"; 
	}
	
	@GetMapping(path = {"/listMessage"})
	@ResponseBody
	public List<MessageVO> selectListMessage(String sender, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");		
		String receiver = loginUser.getMemberId();
		
		System.out.println("sender" + sender);
		System.out.println("receiver" + receiver);
		List<MessageVO> messageList = messageService.selectListMessage(sender, receiver);
		
		return messageList;
	}
	
	@PutMapping(path = {"/updateUnConfirmCnt"}, consumes = "application/json")
	@ResponseBody
	public String updateUnConfirmCnt(@RequestBody String sender, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");		
		String receiver = loginUser.getMemberId();
		
		messageService.updateUnConfirmCnt(sender, receiver);

		return "success";
	}
	
	@PostMapping(path = {"/insertMessage"})
	@ResponseBody
	public MessageVO insertMessage(MessageVO message, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");		
		String receiver = loginUser.getMemberId();
		
		message.setMSender(receiver);
//		System.out.println("content : " + message.getMsContent());
//		System.out.println("receiver : " +message.getMReceiver());
//		System.out.println("tNo : " + message.getTNo());
		
		messageService.insertMessage(message);
		
		Integer no = message.getMsNo();
		return messageService.selectMessage(no);
	}

}