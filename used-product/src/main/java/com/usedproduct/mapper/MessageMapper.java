package com.usedproduct.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.MessageVO;

@Mapper
public interface MessageMapper {	
	List<MessageVO> selectListProduct(String receiver);
	
	void insertMessage(MessageVO message);
}