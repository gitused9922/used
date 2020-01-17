package com.usedproduct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
//		System.out.println(member.getSiteNo());
		
		memberService.registerMember(member);
		
		return "redirect:/resources/login.html";
	}
	
	@PostMapping(path = { "/login" })
	public String login(MemberVO member, HttpSession session) {
		MemberVO foundMember = memberService.findMemberByIdAndPasswd(member);
		System.out.println(member);
		System.out.println(foundMember);
		if(foundMember == null) {
			return "redirect:/resources/login.html";
		} else {
			session.setAttribute("loginuser",foundMember);
			return "redirect:/";
		}
	}
	
	@GetMapping(path = { "/logout" })
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");
		return "redirect:/";
	}
}
