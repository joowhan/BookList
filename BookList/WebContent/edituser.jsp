<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="edu.handong.csee.dao.UserDao"%>
	<jsp:useBean id="u" class="edu.handong.csee.bean.User"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
	<%
	UserDao userDao = new UserDao();
	int i = userDao.update(u);
	response.sendRedirect("viewusers.jsp");
	%>
</body>
</html>