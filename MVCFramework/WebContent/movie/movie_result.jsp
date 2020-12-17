<%@ page contentType="text/html;charset=utf-8"%>
<%
	//service 메서드 영역 고양이가 d이 jsp로부터 생성한 서블릿 클래스에는
	//각종 예외가 throws 처리되어있기 때문에, jsp스크립틀릿 영역에서는
	//예외처리를 강요하지 않았던 것이다..
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>
당신이 선택한 영화에 대한 분석결과 <p>
<%=session.getAttribute("msg") %>
</body>
</html>