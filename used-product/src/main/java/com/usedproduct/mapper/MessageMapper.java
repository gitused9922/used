package com.usedproduct.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.MessageVO;

@Mapper
public interface MessageMapper {	
	void insertMessage(MessageVO message);

	List<MessageVO> selectListMember(String receiver);

	List<MessageVO> selectListMessage(String sender, String receiver);
	
	MessageVO selectMessage(Integer no);
	
	int selectUnConfirmCnt(String sender, String receiver);
	
	void updateUnConfirmCnt(String sender, String receiver);
}