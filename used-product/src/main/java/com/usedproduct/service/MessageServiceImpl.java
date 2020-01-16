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
	public List<MessageVO> selectListMember(String receiver) {
		return MessageMapper.selectListMember(receiver);
	}

	@Override
	public List<MessageVO> selectListMessage(String sender, String receiver) {
		return MessageMapper.selectListMessage(sender, receiver);
	}

	@Override
	public MessageVO selectMessage(Integer no) { 
		return MessageMapper.selectMessage(no);
	}

	@Override
	public int selectUnConfirmCnt(String sender, String receiver) {
		return MessageMapper.selectUnConfirmCnt(sender, receiver);
	}

	@Override
	public void updateUnConfirmCnt(String sender, String receiver) {
		MessageMapper.updateUnConfirmCnt(sender, receiver);
	}

}