package com.usedproduct.controller;

import java.util.List;

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
	public String selectListMember(Model model) {
		//String receiver : 세션 값 사용
		List<MessageVO> memberList = messageService.selectListMember("");
		
		for (MessageVO messageVO : memberList) {
			messageVO.setUnConfirmCnt(messageService.selectUnConfirmCnt(messageVO.getMSender(), ""));
		}
		
		model.addAttribute("memberList", memberList);
		
		return "message/list"; 
	}
	
	@GetMapping(path = {"/listMessage"})
	@ResponseBody
	public List<MessageVO> selectListMessage(String sender) {
		//String receiver : 세션 값 사용
		String receiver = "";
		List<MessageVO> messageList = messageService.selectListMessage(sender, receiver);
		
		return messageList;
	}
	
	@PutMapping(path = {"/updateUnConfirmCnt"}, consumes = "application/json")
	@ResponseBody
	public String updateUnConfirmCnt(@RequestBody String sender) {
		//String receiver : 세션 값 사용
		String receiver = "";
		messageService.updateUnConfirmCnt(sender, receiver);

		return "success";
	}
	
	@PostMapping(path = {"/insertMessage"})
	@ResponseBody
	public MessageVO insertMessage(@RequestBody MessageVO message) {
		messageService.insertMessage(message);
		
		Integer no = message.getMsNo();
		return messageService.selectMessage(no);
	}

}