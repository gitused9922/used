package com.usedproduct.service;

import org.springframework.stereotype.Service;

import com.usedproduct.mapper.ReplyMapper;
import com.usedproduct.vo.ReplyVO;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Setter
	private ReplyMapper replyMapper;
	@Override
	public void writeReply(ReplyVO reply) {
		
		replyMapper.insertReply(reply);
		
	}
	@Override
	public void writeReReplay(ReplyVO reply) {
		// TODO Auto-generated method stub
		
	}
	
}
