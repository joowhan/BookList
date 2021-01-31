<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	
	String filename = "";
	int sizeLimit = 15 * 1024 * 1024;
	String realPath = request.getServletContext().getRealPath("upload");
	System.out.println(realPath);
	File dir = new File(realPath);
		if (!dir.exists())
			dir.mkdirs();
	MultipartRequest multpartRequest = null;
	multpartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	String title = multpartRequest.getParameter("title");
	String writer = multpartRequest.getParameter("writer");
	String content = multpartRequest.getParameter("content");
	filename = multpartRequest.getFilesystemName("image");
	String seq = multpartRequest.getParameter("seq");
	int num = Integer.parseInt(seq);
	u.setTitle(title);
	u.setWriter(writer);
	u.setContent(content);
	u.setImage(filename);
	u.setSeq(num);

	UserDao userDao = new UserDao();
	int i = userDao.update(u);
	response.sendRedirect("viewusers.jsp");
	%>
</body>
</html>