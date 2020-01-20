package com.usedproduct.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class MessageVO {
	private Integer msNo;
	private Integer tNo;
	private String mSender;
	private String mReceiver;
	private String msContent;
	private Date msDate;
	private Boolean msConfirm;
	private Character msType;
	private int unConfirmCnt;

}