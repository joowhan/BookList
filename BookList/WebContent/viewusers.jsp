<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="edu.handong.csee.dao.UserDao,edu.handong.csee.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>


	<h1>List of Books</h1>

	<%
	
	List<User> list = UserDao.getAllRecords();
	request.setAttribute("list", list);
	%>
<div class="table-responsive-sm">
	<table style="width:70%"  class="table table-hover"id="list">
		<tr class="table table-sm">
			<th>No.</th>
			<th>Title</th>
			<th>Author</th>
			<th>Comment</th>
			<th><a class="btn btn-success" href="adduserform.jsp">Add New Post</a></th>
		
		</tr>
		<c:forEach items="${list}" var="u">
			<tr class="table table-sm">
				<td>${u.getSeq()}</td>
				<td>${u.getTitle()}</td>
				<td>${u.getWriter()}</td>
				<td>${u.getContent()}</td>

				<td><a class="btn btn-light" href="editform.jsp?id=${u.getSeq()}">Edit</a>
					<a class="btn btn-danger" href="deleteuser.jsp?id=${u.getSeq()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
	<br />
</body>
</html>