package com.usedproduct.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class MessageVO {
	private Integer msNo; //메세지 번호 MsNo()
	private String msContent; //내용 MsContent
	private Date msDate; //입력 날짜( sysdate ) MsDate
	private Boolean msConfirm; //확인( 0 ) 
	private String mSender; //발신자 MSender
	private Integer tNo; // 글 번호 TNo
	private String mReceiver; //수신자 MReceiver
	private String msTitle; //제목 MsTitle
	
	private String pName; //상품명 PName
}