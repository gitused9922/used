package com.usedproduct.service;

import com.usedproduct.mapper.MemberMapper;
import com.usedproduct.vo.MemberVO;

import lombok.Setter;

public class MemberServiceImpl implements MemberService{
	
	@Setter
	MemberMapper memberMapper;

	@Override
	public void registerMember(MemberVO member) {
		// TODO Auto-generated method stub
		System.out.println("print from service"+member);
		memberMapper.insertMember(member);
		
	}

	@Override
	public MemberVO findMemberByIdAndPasswd(MemberVO member) {
		// TODO Auto-generated method stub
		return memberMapper.selectMemberByIdAndPasswd(member);
	}


}
