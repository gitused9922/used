package com.usedproduct.service;

import java.util.List;

import com.usedproduct.vo.MessageVO;

public interface MessageService {
	void insertMessage(MessageVO message);  
	
	List<MessageVO> selectListMember(String receiver);
	
	List<MessageVO> selectListMessage(String sender, String receiver);
	
	MessageVO selectMessage(Integer no);
	
	int selectUnConfirmCnt(String sender, String receiver);
	
	void updateUnConfirmCnt(String sender, String receiver);
}
