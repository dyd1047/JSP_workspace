//코멘트 게시판의 리스트 요청을 처리하는 컨트롤러,
//이 컨트롤러는 서블릿은 아니다, 단지 서블릿으로 전달받은 
package com.model2.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.board.model.BoardDAO;
import com.model2.controller.Controller;

public class ListController implements Controller{
	BoardDAO boardDAO = new BoardDAO();

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("코멘트 게시판 목록 요청을 처리합니다.");
		//3단계: 알맞는 로직 객체에 일 시키기
		List list = boardDAO.selectAll();
		
		//4단계: 저장할 것이 있기 때문에 request에 저장
//		HttpSession session = request.getSession();
		request.setAttribute("boardList", list);
	}

	public String getResultView() {
		return "/view/board/list";
	}

	public boolean isForward() {
		return true; //저장할 것이 있으므로, 요청은 유지되어야 함. 요청을 유지하려면 포워딩 해야함..
	}

}
