package com.usedproduct.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.MessageVO;

@Mapper
public interface MessageMapper {	
	void insertMessage(MessageVO message);
	
	List<MessageVO> selectListMessage(String user);
}