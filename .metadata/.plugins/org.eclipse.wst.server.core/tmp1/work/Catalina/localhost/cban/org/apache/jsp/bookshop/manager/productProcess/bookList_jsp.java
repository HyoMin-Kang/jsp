/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.50
 * Generated at: 2018-06-21 16:30:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.bookshop.manager.productProcess;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ch14.bookshop.master.ShopBookDBBean;
import ch14.bookshop.master.ShopBookDataBean;
import java.util.List;
import java.text.SimpleDateFormat;

public final class bookList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {


    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("ch14.bookshop.master.ShopBookDBBean");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("ch14.bookshop.master.ShopBookDataBean");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	request.setCharacterEncoding("utf-8");
	String title = "등록된 책 목록";
	String managerId ="";
	try{
		managerId = (String)session.getAttribute("managerId");
		if(managerId==null || managerId.equals("")){
	       response.sendRedirect("../logon/managerLoginForm.jsp");
		}else{

      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    List<ShopBookDataBean> bookList = null; 
    int number =0;
    String book_kind="";
    
    book_kind = request.getParameter("book_kind");
 
    ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
    int count = bookProcess.getBookCount();
    
    if (count > 0) {
    	bookList = bookProcess.getBooks(book_kind);
    }

      out.write("\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/_inc/header_inc2.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("title", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf(title ), request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("\r\n");

   String book_kindName="";
if(book_kind.equals("100"))
	book_kindName="건강 취미";
 else if(book_kind.equals("110"))
	book_kindName="경제 경영";  
 else if(book_kind.equals("120"))
	book_kindName="문학";
 else if(book_kind.equals("130"))
	book_kindName="사회 정치";
 else if(book_kind.equals("140"))
	book_kindName="자기계발";
 else if(book_kind.equals("150"))
	book_kindName="자연과학";
 else if(book_kind.equals("160"))
	book_kindName="참고서";
 else if(book_kind.equals("200"))
	book_kindName="문학 소설"; 
 else if(book_kind.equals("110"))
	book_kindName="경제 경영";  
 else if(book_kind.equals("120"))
	book_kindName="인문 사회";
 else if(book_kind.equals("130"))
	book_kindName="예술 대중문화";
 else if(book_kind.equals("140"))
	book_kindName="취미 라이프스타일";
 else if(book_kind.equals("150"))
	book_kindName="컴퓨터";
 else if(book_kind.equals("160"))
	book_kindName="자연과학";
 else if(book_kind.equals("all"))
	book_kindName="전체";
 else if(book_kind.equals("kor"))
	book_kindName="국내 도서";
 else if(book_kind.equals("foreign"))
	book_kindName="외국 도서";

      out.write("\r\n");
      out.write("<a href=\"../managerMain.jsp\"> 관리자 메인으로</a> &nbsp;\r\n");
      out.write("<p>");
      out.print(book_kindName);
      out.write(" 분류의 목록: \r\n");
if(book_kind.equals("all")){
      out.write(" \r\n");
      out.write("    ");
      out.print(count);
      out.write('개');
      out.write('\r');
      out.write('\n');
}else{
      out.write("\r\n");
      out.write("    ");
      out.print(bookList.size() );
      out.write('개');
      out.write('\r');
      out.write('\n');
} 
      out.write("\r\n");
      out.write("</p>\r\n");
      out.write("<table>\r\n");
      out.write("<tr>\r\n");
      out.write("    <td align=\"right\">\r\n");
      out.write("       <a href=\"bookRegisterForm.jsp\">책 등록</a>\r\n");
      out.write("    </td>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");

  if (count == 0) {

      out.write("\r\n");
      out.write("<table>\r\n");
      out.write("<tr>\r\n");
      out.write("   <td align=\"center\">\r\n");
      out.write("           등록된 책이 없습니다.\r\n");
      out.write("   </td>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
} else {
      out.write("\r\n");
      out.write("<table class=\"table\"> \r\n");
      out.write("\t<colgroup>\r\n");
      out.write("\t  \t<col width=\"4%\">\r\n");
      out.write("\t  \t<col width=\"4%\">\r\n");
      out.write("\t  \t<col width=\"*%\">\r\n");
      out.write("\t  \t<col width=\"4%\">\r\n");
      out.write("\t  \t<col width=\"4%\">\r\n");
      out.write("\t  \t<col width=\"8%\">\r\n");
      out.write("\t  \t<col width=\"12%\">\r\n");
      out.write("\t  \t<col width=\"8%\">\r\n");
      out.write("\t  \t<col width=\"6%\">\r\n");
      out.write("\t  \t<col width=\"4%\">\r\n");
      out.write("\t  \t<col width=\"8%\">\r\n");
      out.write("\t  \t<col width=\"4%\">\r\n");
      out.write("\t  \t<col width=\"4%\">\r\n");
      out.write("\t</colgroup>      \r\n");
      out.write("\t\r\n");
      out.write("\t<thead class=\"table-dark\">\r\n");
      out.write("\t    <tr> \r\n");
      out.write("\t      <th scope=\"col\">번호</th> \r\n");
      out.write("\t      <th scope=\"col\">책분류</th> \r\n");
      out.write("\t      <th scope=\"col\">제목</th>\r\n");
      out.write("\t      <th scope=\"col\">가격</th> \r\n");
      out.write("\t      <th scope=\"col\">수량</th> \r\n");
      out.write("\t      <th scope=\"col\">저자</th>\r\n");
      out.write("\t      <th scope=\"col\">출판사</th>\r\n");
      out.write("\t      <th scope=\"col\">출판일</th>\r\n");
      out.write("\t      <th scope=\"col\">책이미지</th>\r\n");
      out.write("\t      <th scope=\"col\">할인율</th>\r\n");
      out.write("\t      <th scope=\"col\">등록일</th>\r\n");
      out.write("\t      <th scope=\"col\">수정</th>\r\n");
      out.write("\t      <th scope=\"col\">삭제</th>         \r\n");
      out.write("\t    </tr>\r\n");
      out.write("    </thead>\r\n");
  
    for (int i = 0 ; i <bookList.size() ; i++) {
      ShopBookDataBean book = 
    		  (ShopBookDataBean)bookList.get(i);

      out.write("\r\n");
      out.write("   <tr>\r\n");
      out.write("      <td>");
      out.print(++number);
      out.write("</td> \r\n");
      out.write("      <td>");
      out.print(book.getBook_kind());
      out.write("</td> \r\n");
      out.write("      <td>\r\n");
      out.write("           ");
      out.print(book.getBook_title());
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(book.getBook_price());
      out.write("</td> \r\n");
      out.write("      <td>\r\n");
      out.write("      ");
 if(book.getBook_count()==0) {
      out.write("\r\n");
      out.write("         <font color=\"red\">");
      out.print("일시품절");
      out.write("</font>\r\n");
      out.write("      ");
 }else{ 
      out.write("\r\n");
      out.write("         ");
      out.print(book.getBook_count());
      out.write("\r\n");
      out.write("      ");
} 
      out.write("\r\n");
      out.write("      </td> \r\n");
      out.write("      <td>");
      out.print(book.getAuthor());
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(book.getPublishing_com());
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(book.getPublishing_date());
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(book.getBook_image());
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(book.getDiscount_rate());
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(sdf.format(book.getReg_date()));
      out.write("</td>\r\n");
      out.write("      <td>\r\n");
      out.write("         <a class=\"btn btn-sm btn-warning\" href=\"bookUpdateForm.jsp?book_id=");
      out.print(book.getBook_id());
      out.write("&book_kind=");
      out.print(book.getBook_kind());
      out.write("\">수정</a></td>\r\n");
      out.write("      <td>\r\n");
      out.write("         <a class=\"btn btn-sm btn-danger\" href=\"bookDeleteForm.jsp?book_id=");
      out.print(book.getBook_id());
      out.write("&book_kind=");
      out.print(book.getBook_kind());
      out.write("\">삭제</a></td>    \r\n");
      out.write("   </tr>\r\n");
}
      out.write("\r\n");
      out.write("</table>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/_inc/footer_inc2.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
 
   }
}catch(Exception e){
   e.printStackTrace();
}

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
