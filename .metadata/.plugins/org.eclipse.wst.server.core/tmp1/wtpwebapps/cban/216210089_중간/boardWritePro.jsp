<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "khm.board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<% request.setCharacterEncoding("utf-8");%>
<%
	String fileName = ""; //서버에 저장된 파일 이름
	String uploadPath = getServletContext().getRealPath("/upload"); //파일을 저장할 서버의 경로
	int maxSize = 5*1024*1024; //5MB
	
	MultipartRequest multi = null;
	
	try {
		//파일업로드 (request, 파일 저장경로, 용량, 인코딩타입, 중복 파일명에 대한 기본 정책)
		multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	
		//파일 정보 가져와 출력
		Enumeration <?> files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			fileName = multi.getFilesystemName(name);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

	<jsp:useBean id="article" scope="page" class="khm.board.BoardDataBean">
	  <jsp:setProperty name="article" property="*"/>
	</jsp:useBean>

<%
	int num = Integer.parseInt(multi.getParameter("num"));
	String writer = multi.getParameter("writer");
	String email = multi.getParameter("email");
	String category = multi.getParameter("category");
	String subject = multi.getParameter("subject");
	String passwd = multi.getParameter("passwd");
	int ref = Integer.parseInt(multi.getParameter("ref"));
	int re_step = Integer.parseInt(multi.getParameter("re_step"));
	int re_level = Integer.parseInt(multi.getParameter("re_level"));
	String content = multi.getParameter("content");	

	article.setNum(num);
	article.setWriter(writer);
	article.setEmail(email);
	article.setCategory(category);
	article.setSubject(subject);
	article.setPasswd(passwd);
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	article.setRef(ref);
	article.setRe_step(re_step);
	article.setRe_level(re_level);
	article.setContent(content);
	article.setFile(fileName);
	article.setIp(request.getRemoteAddr());

    BoardDBBean dbPro = BoardDBBean.getInstance();
    dbPro.insertArticle(article); 

    response.sendRedirect("board.jsp");
%>