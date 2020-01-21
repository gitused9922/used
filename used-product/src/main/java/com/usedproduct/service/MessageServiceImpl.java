package com.usedproduct.service;

import java.util.List;

import com.usedproduct.mapper.MessageMapper;
import com.usedproduct.vo.MessageVO;

import lombok.Setter;

public class MessageServiceImpl implements MessageService {

	@Setter
	private MessageMapper MessageMapper; 
	
	@Override
	public List<MessageVO> selectListProduct(String receiver) {
		return MessageMapper.selectListProduct(receiver);
	}

	@Override
	public void insertMessage(MessageVO message) {
		MessageMapper.insertMessage(message);
	}

}