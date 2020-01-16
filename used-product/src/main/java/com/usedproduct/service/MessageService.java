package com.usedproduct.service;

import java.util.List;

import com.usedproduct.vo.MessageVO;

public interface MessageService {
	void insertMessage(MessageVO message);
	
	List<MessageVO> selectListMessage(String user);
}
