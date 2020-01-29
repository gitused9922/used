package com.usedproduct.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.ReplyVO;

@Mapper
public interface ReplyMapper {

	public void insertReply(ReplyVO reply);

	public List<ReplyVO> selectRepliesByNo(int no);

	public void updateReply(ReplyVO reply);

	public void deleteReply(int rno);

	public void updateSno(ReplyVO parent);

	public void insertReply2(ReplyVO reply);

	public ReplyVO selectReplyByRno(int rno);

}
