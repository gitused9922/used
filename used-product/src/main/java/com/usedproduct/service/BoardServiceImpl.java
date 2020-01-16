package com.usedproduct.service;

import java.util.List;

import com.usedproduct.mapper.BoardMapper;
import com.usedproduct.vo.BoardVO;

import lombok.Setter;

public class BoardServiceImpl implements BoardService {
	
	@Setter
	private BoardMapper boardMapper;
	
	@Override
	public int writeBoard(BoardVO board) {
		boardMapper.insertBoard(board);
		return board.getNo();
	}
	
	
	@Override
	public List<BoardVO> findBoard() {
		
		return boardMapper.selectBoard();
	
	}


	
	
}
