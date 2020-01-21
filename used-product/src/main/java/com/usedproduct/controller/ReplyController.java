package com.usedproduct.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
			
		action.equals("reply");
			
			replyService.writeReply(reply);
		
			return "success";
	}
	
	@GetMapping(path= {"/list-by/{no}"})
	public String listByNo(@PathVariable int no, Model model) {
	
	List<ReplyVO> replies = replyService.getReplyListByNo(no);
	
	model.addAttribute("replies", replies);
	
	return "board/reply-list";
	}
}
