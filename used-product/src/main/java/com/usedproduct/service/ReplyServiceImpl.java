package com.usedproduct.service;

import java.util.List;

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
	public List<ReplyVO> getReplyListByNo(int rno) {
		
		return replyMapper.selectRepliesByNo(rno);
		
		
	}
	@Override
	public void updateReply(ReplyVO reply) {

		replyMapper.updateReply(reply);
		
	}
	@Override
	public void deleteReply(int rno) {

		replyMapper.deleteReply(rno);
	}
	
	
}
