<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="edu.handong.csee.dao.UserDao,edu.handong.csee.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>List of Books</h1>

	<%
		request.setCharacterEncoding("utf-8");
	List<User> list = UserDao.getAllRecords();
	request.setAttribute("list", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Title</th>
			<th>Author</th>
			<th>Comment</th>
			<th><a href="adduserform.jsp">Add New Post</a></th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getSeq()}</td>
				<td>${u.getTitle()}</td>
				<td>${u.getWriter()}</td>
				<td>${u.getContent()}</td>

				<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
				<td><a href="deleteuser.jsp?id=${u.getSeq()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
</body>
</html>