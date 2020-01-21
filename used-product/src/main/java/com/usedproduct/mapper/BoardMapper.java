package com.usedproduct.mapper;

import java.util.HashMap;
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
	List<BoardVO> selectBoardWithPaging(HashMap<String, Object> params);
	int selectBoardCount(HashMap<String, Object> params);
	void deleteBoard(int no);
	void updateBoard(BoardVO board);
	
}
