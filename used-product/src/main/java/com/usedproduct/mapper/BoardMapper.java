package com.usedproduct.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.usedproduct.vo.BoardVO;
import com.usedproduct.vo.CategoryVO;
import com.usedproduct.vo.FileVO;

@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO board);
	List<CategoryVO> selectCategory();
	List<BoardVO> selectBoard();
	BoardVO selectBoardNo(int no);
	//void insertFile(FileVO fileVO);


	
}
