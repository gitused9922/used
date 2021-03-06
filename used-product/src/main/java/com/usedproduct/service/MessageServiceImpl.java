package com.usedproduct.service;

import java.util.HashMap;
import java.util.List;

import com.usedproduct.mapper.MessageMapper;
import com.usedproduct.vo.MessageVO;
import com.usedproduct.vo.StatisticsVO;

import lombok.Setter;

public class MessageServiceImpl implements MessageService {

	@Setter
	private MessageMapper MessageMapper; 

	@Override
	public void insertMessage(MessageVO message) {
		MessageMapper.insertMessage(message);
	}
	
	@Override
	public List<MessageVO> selectListMessage(HashMap<String, Object> params) {
		return MessageMapper.selectListMessage(params);
	}

	@Override
	public int selectListMessageCount(HashMap<String, Object> params) {
		return MessageMapper.selectListMessageCount(params);
	}

	@Override
	public MessageVO selectMessage(int no) {
		return MessageMapper.selectMessage(no);
	}

	@Override
	public void updateMessage(int no) {
		MessageMapper.updateMessage(no);
	}

	@Override
	public void deleteMessage(int no) {
		MessageMapper.deleteMessage(no);
	}

	@Override
	public int selectTotalMember() {
		return MessageMapper.selectTotalMember();
	}

	@Override
	public List<StatisticsVO> selectListAreaMember() {
		return MessageMapper.selectListAreaMember();
	}

	@Override
	public int selectTotalProduct() {
		return MessageMapper.selectTotalProduct();
	}

	@Override
	public List<StatisticsVO> selectListAreaProduct() {
		return MessageMapper.selectListAreaProduct();
	}

}