package com.usedproduct.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.usedproduct.vo.BoardVO;
import com.usedproduct.vo.CategoryVO;
import com.usedproduct.vo.FileVO;

public interface BoardService {

	int writeBoard(BoardVO board);


	List<CategoryVO> findAllCategory();
	List<BoardVO> findBoard();


	BoardVO findBoardNo(int no);

	//int writeFile(FileVO fileVO);



}
