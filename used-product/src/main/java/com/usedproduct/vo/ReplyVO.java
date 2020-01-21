package com.usedproduct.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;
	private int bno;
	private String reply;
	private String replyer;
	private Date replyDate;
	private boolean delete;
	private int gno;
	private int sno;
	private int depth;



/*
 * R_NO NUMBER 						댓글번호
 * T_NO NUMBER						글번호
 * R_CONTENT VARCHAR2(500 BYTE) 	댓글내용
 * R_REPLYER						댓글러
 * R_DATE DATE 						댓글 등록일
 * R_DELETE CHAR(1 BYTE)			댓글 삭제		
 * R_GNO NUMBER 					댓글 그룹번호
 * R_STEP NUMBER 					댓글 스텝번호
 * R_DEPTH NUMBER 					댓글여백
 

 */
}
