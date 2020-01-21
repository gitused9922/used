package com.usedproduct.service;

import com.usedproduct.common.Util;
import com.usedproduct.mapper.MemberMapper;
import com.usedproduct.vo.MemberVO;

import lombok.Setter;

public class MemberServiceImpl implements MemberService{
	
	@Setter
	MemberMapper memberMapper;

	@Override
	public void registerMember(MemberVO member) {
		// TODO Auto-generated method stub
//		System.out.println("print from service"+member);
		String plainPw = member.getMemberPw();
		String hashedPw = Util.getHashedString(plainPw, "SHA-256");
		member.setMemberPw(hashedPw);
		memberMapper.insertMember(member);
		
	}

	@Override
	public MemberVO findMemberByIdAndPasswd(MemberVO member) {
		// TODO Auto-generated method stub
		member.setMemberPw(Util.getHashedString(member.getMemberPw(), "SHA-256"));
		return memberMapper.selectMemberByIdAndPasswd(member);
	}

	@Override
	public int idCheck(String memberId) {
		// TODO Auto-generated method stub

		return memberMapper.selectMemberById(memberId);
	}


}
