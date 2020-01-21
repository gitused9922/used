package com.usedproduct.service;

import org.springframework.stereotype.Service;

import com.usedproduct.vo.ReplyVO;

@Service
public interface ReplyService {

	void writeReply(ReplyVO reply);

	void writeReReplay(ReplyVO reply);

}
