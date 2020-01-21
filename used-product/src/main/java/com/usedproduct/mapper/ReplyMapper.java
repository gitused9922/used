package com.usedproduct.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.ReplyVO;

@Mapper
public interface ReplyMapper {

	public void insertReply(ReplyVO reply);

}
