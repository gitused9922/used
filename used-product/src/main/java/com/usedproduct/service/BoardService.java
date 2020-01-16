package com.usedproduct.service;

import java.util.List;

import com.usedproduct.vo.BoardVO;

public interface BoardService {

	int writeBoard(BoardVO board);

	List<BoardVO> findBoard();

}
