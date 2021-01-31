<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.File"%>
<%@ page import ="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
	
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
	
	u.setTitle(title);
	u.setWriter(writer);
	u.setContent(content);
	u.setImage(filename);


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