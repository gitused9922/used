package com.usedproduct.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.usedproduct.service.ReplyService;
import com.usedproduct.vo.ReplyVO;

@Controller
@RequestMapping(path={"/reply"})
public class ReplyController {

	@Autowired
	@Qualifier("replyService")
	private ReplyService replyService;
	
	@PostMapping("/write")
	@ResponseBody
	public String write(ReplyVO reply, String action) {
			
		if(action.equals("reply")) {
			
			replyService.writeReply(reply);
		} else if (action.equals("re-reply")) {
			replyService.writeReReplay(reply);
						
		}
			return "success";
	}
	
	
}
