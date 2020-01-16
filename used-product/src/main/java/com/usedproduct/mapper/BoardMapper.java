package com.usedproduct.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.BoardVO;

@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO board);

	List<BoardVO> selectBoard();

	
}
