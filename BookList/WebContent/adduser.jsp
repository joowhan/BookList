<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.handong.csee.dao.UserDao"%>
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
	request.setCharacterEncoding("utf-8");
	int i = UserDao.save(u);
	if (i > 0) {
		response.sendRedirect("adduser-success.jsp");
	} else {
		response.sendRedirect("adduser-error.jsp");
	}
	%>
</body>
</html>