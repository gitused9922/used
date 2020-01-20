package com.usedproduct.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.BoardVO;
import com.usedproduct.vo.CategoryVO;

@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO board);
	List<CategoryVO> selectCategory();
	List<BoardVO> selectBoard();
	BoardVO selectBoardNo(int no);



	
}
