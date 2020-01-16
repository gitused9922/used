package com.usedproduct.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private Date regDate;
	private Boolean memberState;
}
