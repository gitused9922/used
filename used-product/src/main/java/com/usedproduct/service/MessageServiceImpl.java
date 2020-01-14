package com.usedproduct.service;

import java.util.List;

import com.usedproduct.mapper.MessageMapper;
import com.usedproduct.vo.MessageVO;

import lombok.Setter;

public class MessageServiceImpl implements MessageService {

	@Setter
	private MessageMapper MessageMapper;
	
	@Override
	public void insertMessage(MessageVO message) {
		MessageMapper.insertMessage(message);
	}

	@Override
	public List<MessageVO> selectListMessage(String user) {
		return MessageMapper.selectListMessage(user);
	}
}