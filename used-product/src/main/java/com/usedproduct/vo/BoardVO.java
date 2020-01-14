package com.usedproduct.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
		
	private int no;
	private boolean state;
	private String name;
	private int price;
	private Date rdate;
	private Date udate;
	private boolean delete;
	
	
	
	/*
	 *  T_NO	NUMBER
		D_STATE	CHAR(1 BYTE)
		P_NAME	VARCHAR2(200 BYTE)
		P_PRICE	NUMBER
		P_RDATE	DATE
		P_UDATE	DATE
		P_DELETE	CHAR(1 BYTE)
		M_ID	VARCHAR2(50 BYTE)
		CG_NAME	VARCHAR2(100 BYTE)
	 * 
	 * */
	
}