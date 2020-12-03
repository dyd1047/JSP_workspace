<%@page import="board.model.NoticeDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="db.DBManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ include file="/inc/lib.jsp"%>
<%
request.setCharacterEncoding("utf-8");
String notice_id = request.getParameter("notice_id");
NoticeDAO noticeDAO = new NoticeDAO();
int result = noticeDAO.delete(Integer.parseInt(notice_id));
//삭제 후 완료 메세지 보여주고 list.jsp를 요청
if(result == 0){
	out.print(getMsgBack("삭제 실패"));
}else{
	out.print(getMsgURL("삭제 성공", "/board/list.jsp"));
}
%>