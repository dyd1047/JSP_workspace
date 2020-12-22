package com.springmvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model2.board.model.BoardDAO;
import com.model2.domain.Board;

public class DetailController implements Controller{
	BoardDAO boardDAO = new BoardDAO();

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//3단계: 일시키기
		String board_id = request.getParameter("board_id");
		Board board = boardDAO.select(Integer.parseInt(board_id));
		
		//4단계: 저장하기
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDetail", board);
		mav.setViewName("board/detail");
				
		return null;
	}

}
