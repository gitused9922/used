package com.usedproduct.service;

import java.util.HashMap;
import java.util.List;

import com.usedproduct.vo.MessageVO;

public interface MessageService {
	List<MessageVO> selectListMessageSender(HashMap<String, Object> params);
	
	int selectMessageCount(HashMap<String, Object> params);
	
	void insertMessage(MessageVO message);
}
