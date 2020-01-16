package com.usedproduct.service;

import java.util.List;

import com.usedproduct.vo.BoardVO;
import com.usedproduct.vo.CategoryVO;

public interface BoardService {

	int writeBoard(BoardVO board);

	List<CategoryVO> findAllCategory();



	

}
