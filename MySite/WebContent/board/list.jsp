<%@page import="board.model.MybatisBoardDAO"%>
<%@page import="common.board.Pager"%>
<%@page import="board.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="board.model.BoardDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	MybatisBoardDAO dao = new MybatisBoardDAO();
	Pager pager = new Pager();
	List<Board> list = dao.selectAll();
	pager.init(request, list); //페이지 처리에 대한 초기화
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}
a{
	text-decoration: none;
	color: black;
}
a:hover{
	text-decoration: underline;
}
</style>
</head>
<body>

<table>
  <tr>
    <th>No</th>
    <th>이미지</th>
    <th>제목</th>
    <th>작성자</th>
    <th>등록일</th>
    <th>조회수</th>
  </tr>
  <%
  int num=pager.getNum();
  int curPos=pager.getCurPos();
  %>
  <%for(int i = 1; i <= pager.getPageSize(); i++) {%>
  <%if(num<1)break; %>
  <%Board board = list.get(curPos++); %>
  <tr>
    <td><%=num-- %></td>
    <%if(board.getFilename()==null){ %>
    <td>이미지 없음</td>
    <%}else{ %>
    <td><img src="/data/<%=board.getFilename() %>" style="width: 50px; height: 50px;"></td>
    <%} %>
    <td><a href="/board/detail.jsp?board_id=<%=board.getBoard_id()%>"><%=board.getTitle() %></a></td>
    <td><%=board.getWriter() %></td>
    <td><%=board.getRegdate() %></td>
    <td><%=board.getHit() %></td>
  <tr>
  <%} %>
	<td colspan="6" style="text-align:center;">
		<a href="list.jsp?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
			<%for(int i = pager.getFirstPage(); i <= pager.getLastPage(); i++){ %>
			<%if(i>pager.getTotalPage())break; //총 페이지수를 넘어서면.. %>
			<a <%if(pager.getCurrentPage()==i){ %> class="pageNum" <%} %> href="list.jsp?currentPage=<%=i%>">[<%=i %>]</a>
			<%} %>
			<a href="list.jsp?currentPage=<%=pager.getLastPage()+1%>">▶</a>
	</td>  
  </tr>
  <tr>
	<td colspan="6">
		<button onClick="location.href='regist_form.jsp'">글등록</button>
	</td>  
  </tr>
</table>

</body>
</html>
