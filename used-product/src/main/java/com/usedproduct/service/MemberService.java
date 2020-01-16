package com.usedproduct.service;

import com.usedproduct.vo.MemberVO;

public interface MemberService {
	
	void registerMember(MemberVO member);
	MemberVO findMemberByEmailAndPasswd(MemberVO member);

}
