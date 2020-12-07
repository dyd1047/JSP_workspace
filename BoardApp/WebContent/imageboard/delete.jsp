<%@page import="java.io.File"%>
<%@page import="board.model.ImageBoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/inc/lib.jsp" %>
<%
	String board_id = request.getParameter("board_id");
	String filename = request.getParameter("filename");
	
	//파일 삭제(파일을 다룰 수 있는 클래스 : java.io.file)
	File file = new File("D:/User/yong/LN/workspace/athome/workspace-HTML/javaee_workspace/BoardApp/WebContent/data/"+filename);
	if(file.delete()){
		ImageBoardDAO dao = new ImageBoardDAO();
		int result = dao.delete(Integer.parseInt(board_id)); //db삭제
		out.print(getMsgURL("삭제 성공", "/imageboard/list.jsp"));
	}else{
		out.print(getMsgBack("삭제 실패"));
	}
	
%>
