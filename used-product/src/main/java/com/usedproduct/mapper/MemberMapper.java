package com.usedproduct.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.MemberVO;

@Mapper
public interface MemberMapper {
	void insertMember(MemberVO member);

	MemberVO selectMemberByIdAndPasswd(MemberVO member);

	int selectMemberById(String memberId);

}
