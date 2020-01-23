package com.usedproduct.service;

import java.util.HashMap;
import java.util.List;

import com.usedproduct.vo.MessageVO;

public interface MessageService { 
	void insertMessage(MessageVO message);
	
	List<MessageVO> selectListMessage(HashMap<String, Object> params);
	
	int selectListMessageCount(HashMap<String, Object> params);
	
	MessageVO selectMessage(int no);
	
	void updateMessage(int no);
	
	void deleteMessage(int no);
}
