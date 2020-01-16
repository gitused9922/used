package com.usedproduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.usedproduct.service.MemberService;
import com.usedproduct.vo.MemberVO;

@Controller
@RequestMapping(path = {"/account/"})
public class AccountController {
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@PostMapping(path = { "/register" })
	public String register(MemberVO member) {
		
		memberService.registerMember(member);
		
		return "redirect:/resources/login.html";
	}
}
