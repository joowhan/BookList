<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.handong.csee.dao.UserDao,edu.handong.csee.bean.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
	User u = UserDao.getRecordById(Integer.parseInt(id));
	%>

	<h1>Edit Form</h1>
	<form action="edituser.jsp" method="post">
		<input type="hidden" name="seq" value="<%=u.getSeq()%>" />
		<table>
			<tr>
				<td>Title :</td>
				<td><input type="text" name="title" value="<%=u.getTitle()%>" /></td>
			</tr>
			<tr>
				<td>Author :</td>
				<td><input type="text" name="writer"
					value="<%=u.getWriter()%>" /></td>
			</tr>
			<tr>
				<td>Content:</td>
				<td><td><textarea cols="50" rows="5" name="content"><%=u.getContent()%></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit User" /></td>
			</tr>
		</table>
	</form>
</body>
</html>