<%@page import="board.model.ImageBoard"%>
<%@page import="board.model.ImageBoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/inc/lib.jsp"%>
<%
	ImageBoardDAO dao = new ImageBoardDAO();

	request.setCharacterEncoding("utf-8");
	String author = request.getParameter("author");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String board_id = request.getParameter("board_id");
	
	ImageBoard board = new ImageBoard();
	board.setAuthor(author);
	board.setTitle(title);
	board.setContent(content);
	board.setBoard_id(Integer.parseInt(board_id));
	
	int result = dao.update(board);
	
	if(result == 0){
		out.print(getMsgBack("수정 실패"));
	}else{
		out.print(getMsgURL("수정 성공", "/Imageboard/detail.jsp?board_id="+board_id));
	}
%>