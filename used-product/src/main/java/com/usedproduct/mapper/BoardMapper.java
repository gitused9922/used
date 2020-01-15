package com.usedproduct.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.BoardVO;

@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO board);



	
}
