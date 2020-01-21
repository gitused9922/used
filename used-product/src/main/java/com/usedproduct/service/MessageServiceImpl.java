package com.usedproduct.service;

import java.util.HashMap;
import java.util.List;

import com.usedproduct.mapper.MessageMapper;
import com.usedproduct.vo.MessageVO;

import lombok.Setter;

public class MessageServiceImpl implements MessageService {

	@Setter
	private MessageMapper MessageMapper;
	
	@Override
	public List<MessageVO> selectListMessageSender(HashMap<String, Object> params) {
		return MessageMapper.selectListMessageSender(params);
	}
	
	@Override
	public int selectMessageCount(HashMap<String, Object> params) {
		return MessageMapper.selectMessageCount(params);
	}

	@Override
	public void insertMessage(MessageVO message) {
		MessageMapper.insertMessage(message);
	}

}