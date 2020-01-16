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
		
	}

	@Override
	public MemberVO findMemberByEmailAndPasswd(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

}
