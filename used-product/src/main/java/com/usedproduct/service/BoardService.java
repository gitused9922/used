package com.usedproduct.service;

import java.util.HashMap;
import java.util.List;

import com.usedproduct.vo.BoardVO;
import com.usedproduct.vo.CategoryVO;

public interface BoardService {

	int writeBoard(BoardVO board);
	List<CategoryVO> findAllCategory();
	List<BoardVO> findBoard();
	BoardVO findBoardNo(int no);
	List<BoardVO> findBoardWithpaging(HashMap<String, Object> params);
	int fidnBoardcount(HashMap<String, Object> params);
	void deleteBoard(int no);
	void updateBoard(BoardVO board);


}
