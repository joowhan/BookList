<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		//User u = new User();
		u.setSeq(id);
		UserDao userDao = new UserDao();
		userDao.delete(u);
	}
	response.sendRedirect("viewusers.jsp");
	%>
</body>
</html>