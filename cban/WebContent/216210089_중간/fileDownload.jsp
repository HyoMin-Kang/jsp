<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="java.io.File"%>
 <%@page import="java.io.*"%>

<%
	String fileName = request.getParameter("fileName"); //파일명 값 가져오기
	String uploadPath = "/upload"; //파일이 저장돼 있는 폴더명, 상대경로
	String realPath = getServletContext().getRealPath("/upload"); //실제 파일이 저장되어 있는 폴더 경로
	String filePath = realPath + "\\" + fileName; //다운 받을 파일의 전체 경로, ex)D:\\upload\\image.jpg

	try {
		//다운받을 파일 불러오기
		File file = new File(filePath);
	
		//page의 ContentType등을 동적으로 바꾸기
		response.reset();
		response.setContentType("application/octet-stream");
		
		//한글 인코딩
		String encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
		//파일 링크 클릭 시 다운로드 저장 화면 출력
		response.setHeader("Content-Disposition", "attachment; filename = " + encoding);
		//파일 세부 정보를 읽어오기 위해 inputStream 열기
		FileInputStream in = new FileInputStream(file);
		
		//파일 세부 정보를 저장하는 파일에 써주기
		out.clear();
		out=pageContext.pushBody();
		
		byte[] bytes = new byte[5*1024*1024]; //저장된 파일을 읽어와 저장할 버퍼 임시로 생성
		OutputStream os = response.getOutputStream();
				while(true) {
			int red = in.read(bytes, 0, bytes.length);
			if(red < 0) break;
			os.write(bytes, 0, red);
		}
		os.flush();
		os.close();
		in.close();
	} catch(Exception e) { e.printStackTrace();	}
%>

