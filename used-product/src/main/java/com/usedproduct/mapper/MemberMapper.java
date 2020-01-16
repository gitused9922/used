package com.usedproduct.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.MemberVO;

@Mapper
public interface MemberMapper {
	void insertMember(MemberVO member);

	MemberVO selectMemberByEmailAndPasswd(MemberVO member);
}
