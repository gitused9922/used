package com.usedproduct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.usedproduct.vo.ReplyVO;

@Service
public interface ReplyService {

	void writeReply(ReplyVO reply);

	List<ReplyVO> getReplyListByNo(int no);

	void updateReply(ReplyVO reply);

	void deleteReply(int rno);



}
