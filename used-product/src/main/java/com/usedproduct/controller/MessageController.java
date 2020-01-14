package com.usedproduct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping(path = {"/list"})
	public String list(Model model) {
		//String user : 세션 값 사용
		List<MessageVO> messageList = messageService.selectListMessage("");
		
		System.out.println("messageList : "+messageList.size());
		model.addAttribute("messageList", messageList);
		
		return "message/list";
	}
	
	@PostMapping(path = {"/insertMessage"})
	@ResponseBody
	public String insertMessage(MessageVO message) {
		System.out.println(message);
		messageService.insertMessage(message);
		return "success";
	}
}





























