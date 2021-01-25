<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.handong.csee.dao.UserDao"%>
<%	request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="u" class="edu.handong.csee.bean.User"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />

	<%
	System.out.println(u.getTitle());
		UserDao userDao = new UserDao();
	int i = userDao.save(u);
	String msg = "데이터 추가 성공 !";
	if (i == 0)
		msg = "[에러] 데이터 삭제 ";
	%>

	<script>
	alert('<%=msg%>');
		location.href = 'viewusers.jsp';
	</script>
</body>
</html>