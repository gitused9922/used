package com.usedproduct.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class MessageVO {
	private Integer msNo; //메세지 번호
	private String msContent; //내용
	private Date msDate; //입력 날짜( sysdate )
	//private Boolean msConfirm; //확인( 0 ) 
	private String mSender; //발신자
	private Integer tNo; // 글 번호
	private String mReceiver; //수신자
	private String msTitle; //제목
	
	private String pName; //상품명
}