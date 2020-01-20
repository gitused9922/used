package com.usedproduct.service;

import java.util.HashMap;
import java.util.List;

import com.usedproduct.mapper.BoardMapper;
import com.usedproduct.vo.BoardVO;
import com.usedproduct.vo.CategoryVO;

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

	@Override
	public List<CategoryVO> findAllCategory() {

		return boardMapper.selectCategory();
	}

	@Override
	public BoardVO findBoardNo(int no) {

		return boardMapper.selectBoardNo(no);
	}

	@Override
	public List<BoardVO> findBoardWithpaging(HashMap<String, Object> params) {
		return boardMapper.selectBoardWithPaging(params);
	}

	@Override
	public int fidnBoardcount(HashMap<String, Object> params) {
		return boardMapper.selectBoardCount(params);
	}

	
	
}
