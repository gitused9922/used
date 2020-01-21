package com.usedproduct.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.MessageVO;

@Mapper
public interface MessageMapper {	
	List<MessageVO> selectListMessageSender(HashMap<String, Object> params);
	
	int selectMessageCount(HashMap<String, Object> params);
	
	void insertMessage(MessageVO message);
}