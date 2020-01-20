package com.usedproduct.service;

import java.util.List;

import com.usedproduct.vo.MessageVO;

public interface MessageService {
	List<MessageVO> selectListProduct(String receiver);
	
	void insertMessage(MessageVO message);
}
