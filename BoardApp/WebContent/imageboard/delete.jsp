<%@page import="board.model.ImageBoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/inc/lib.jsp" %>
<%
	ImageBoardDAO dao = new ImageBoardDAO();

	String board_id = request.getParameter("board_id");
	int result = dao.delete(Integer.parseInt(board_id));
	if(result == 0){
		out.print(getMsgBack("삭제 실패"));
	}else{
		out.print(getMsgURL("삭제 성공", "/imageboard/list.jsp"));
	}
	
%>
