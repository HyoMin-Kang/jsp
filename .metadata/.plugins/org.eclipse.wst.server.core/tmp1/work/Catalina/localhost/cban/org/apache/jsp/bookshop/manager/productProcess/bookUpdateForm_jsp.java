/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.50
 * Generated at: 2018-06-21 16:48:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.bookshop.manager.productProcess;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Timestamp;
import ch14.bookshop.master.ShopBookDBBean;
import ch14.bookshop.master.ShopBookDataBean;

public final class bookUpdateForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

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
    _jspx_imports_classes.add("java.sql.Timestamp");
    _jspx_imports_classes.add("ch14.bookshop.master.ShopBookDBBean");
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

	request.setCharacterEncoding("utf-8");
	String title = "책 수정";
	String managerId ="";
	try{
	   managerId = (String)session.getAttribute("managerId");
	   if(managerId==null || managerId.equals("")){
	      response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{

      out.write('\r');
      out.write('\n');

	int book_id = Integer.parseInt(request.getParameter("book_id"));
	String book_kind = request.getParameter("book_kind");
	try{
		ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
	    ShopBookDataBean book =  bookProcess.getBook(book_id); 

      out.write("\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/_inc/header_inc2.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("title", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf(title ), request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("\t<form method=\"post\" name=\"writeform\" action=\"bookUpdatePro.jsp\"  enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t<div>\r\n");
      out.write("\t\t\t<a href=\"../managerMain.jsp\"> 관리자 메인으로</a>\r\n");
      out.write("\t\t    <a href=\"bookList.jsp?book_kind=");
      out.print(book_kind);
      out.write("\">목록으로</a>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t  <div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"book_kind\" class=\"col-sm-2 col-form-label\">분류</label>\r\n");
      out.write("\t\t\t<div class=\"col-sm-4\">\r\n");
      out.write("\t    \t\t<select class=\"form-control\" id=\"book_kind\" name=\"book_kind\">\r\n");
      out.write("\t    \t\t\t<optgroup label=\"국내도서\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"100\"");
if (book.getBook_kind().equals("100")) {
      out.write("selected");
} 
      out.write(">건강 취미</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"110\"");
if (book.getBook_kind().equals("110")) {
      out.write("selected");
} 
      out.write(">경제 경영</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"120\"");
if (book.getBook_kind().equals("120")) {
      out.write("selected");
} 
      out.write(">문학</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"130\"");
if (book.getBook_kind().equals("130")) {
      out.write("selected");
} 
      out.write(">사회 정치</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"140\"");
if (book.getBook_kind().equals("140")) {
      out.write("selected");
} 
      out.write(">자기계발</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"150\"");
if (book.getBook_kind().equals("150")) {
      out.write("selected");
} 
      out.write(">자연과학</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"160\"");
if (book.getBook_kind().equals("160")) {
      out.write("selected");
} 
      out.write(">참고서</option>\r\n");
      out.write("\t\t\t\t\t</optgroup>\r\n");
      out.write("\t    \t\t\t<optgroup label=\"외국도서\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"200\"");
if (book.getBook_kind().equals("200")) {
      out.write("selected");
} 
      out.write(">문학 소설</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"210\"");
if (book.getBook_kind().equals("210")) {
      out.write("selected");
} 
      out.write(">경제 경영</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"220\"");
if (book.getBook_kind().equals("220")) {
      out.write("selected");
} 
      out.write(">인문 사회</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"230\"");
if (book.getBook_kind().equals("230")) {
      out.write("selected");
} 
      out.write(">예술 대중문화</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"240\"");
if (book.getBook_kind().equals("240")) {
      out.write("selected");
} 
      out.write(">취미 라이프스타일</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"250\"");
if (book.getBook_kind().equals("250")) {
      out.write("selected");
} 
      out.write(">컴퓨터</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"260\"");
if (book.getBook_kind().equals("260")) {
      out.write("selected");
} 
      out.write(">자연과학</option>\r\n");
      out.write("\t\t\t\t\t</optgroup>\r\n");
      out.write("\t    \t\t</select>\r\n");
      out.write("\t  \t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"book_title\" class=\"col-sm-2 col-form-label\">제목</label>\r\n");
      out.write("\t\t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"book_title\" name=\"book_title\" maxlength=\"100\" value=\"");
      out.print(book.getBook_title() );
      out.write("\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"book_id\" value=\"");
      out.print(book_id);
      out.write("\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"book_price\" class=\"col-sm-2 col-form-label\">가격</label>\r\n");
      out.write("\t\t\t<div class=\"input-group col-sm-4\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"book_price\" name=\"book_price\" maxlength=\"11\" value=\"");
      out.print(book.getBook_price() );
      out.write("\">\r\n");
      out.write("\t\t\t\t<div class=\"input-group-append\">\r\n");
      out.write("\t\t        \t<label class=\"input-group-text\" for=\"book_price\">원</label>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"book_count\" class=\"col-sm-2 col-form-label\">수량</label>\r\n");
      out.write("\t\t\t<div class=\"input-group col-sm-4\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"book_count\" name=\"book_count\" maxlength=\"6\" value=\"");
      out.print(book.getBook_count() );
      out.write("\">\r\n");
      out.write("\t\t\t\t<div class=\"input-group-append\">\r\n");
      out.write("\t\t        \t<label class=\"input-group-text\" for=\"book_count\">권</label>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"author\" class=\"col-sm-2 col-form-label\">저자</label>\r\n");
      out.write("\t\t\t<div class=\"col-sm-4\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"author\" name=\"author\" maxlength=\"40\" value=\"");
      out.print(book.getAuthor());
      out.write("\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"publishing_com\" class=\"col-sm-2 col-form-label\">출판사</label>\r\n");
      out.write("\t\t\t<div class=\"col-sm-4\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"publishing_com\" name=\"publishing_com\" maxlength=\"30\" value=\"");
      out.print(book.getPublishing_com() );
      out.write("\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"publishing_year\" class=\"col-sm-2 col-form-label\">출판일</label>\r\n");
      out.write("\t\t\t<div class=\"input-group col-sm-2\">\r\n");
      out.write("\t\t\t\t<select id=\"publishing_year\" name=\"publishing_year\" class=\"form-control\">\r\n");
      out.write("\t\t        ");

		        Timestamp nowTime  = new Timestamp(System.currentTimeMillis());
		        int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
		           for(int i=lastYear;i>=2010;i--){
		        
      out.write("\r\n");
      out.write("\t\t             <option value=\"");
      out.print(i );
      out.write('"');
      out.write(' ');
if (Integer.parseInt(book.getPublishing_date().substring(0,4))==i) {
      out.write("selected");
} 
      out.write('>');
      out.print(i );
      out.write("</option>\r\n");
      out.write("\t\t        ");
} 
      out.write("\r\n");
      out.write("\t\t        </select>\r\n");
      out.write("\t\t        <div class=\"input-group-append\">\r\n");
      out.write("\t\t        \t<label class=\"input-group-text\" for=\"publishing_year\">년</label>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t        </div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"input-group col-sm-2\">\t        \r\n");
      out.write("\t\t        <select id=\"publishing_month\" name=\"publishing_month\" class=\"form-control\">\r\n");
      out.write("\t\t        ");

		           for(int i=1;i<=12;i++){
		        
      out.write("\r\n");
      out.write("\t\t             <option value=\"");
      out.print(i );
      out.write('"');
      out.write(' ');
if (Integer.parseInt(book.getPublishing_date().substring(5,7))==i) {
      out.write("selected");
} 
      out.write('>');
      out.print(i );
      out.write("</option>\r\n");
      out.write("\t\t        ");
} 
      out.write("\r\n");
      out.write("\t\t        </select>\r\n");
      out.write("\t\t\t\t<div class=\"input-group-append\">\r\n");
      out.write("\t\t        \t<label class=\"input-group-text\" for=\"publishing_month\">월</label>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("        \t</div>\r\n");
      out.write("        \t\r\n");
      out.write("\t        <div class=\"input-group col-sm-2\">\r\n");
      out.write("\t\t        <select id=\"publishing_day\" name=\"publishing_day\" class=\"form-control\">\r\n");
      out.write("\t\t        ");

		           for(int i=1;i<=31;i++){
		        
      out.write("\r\n");
      out.write("\t\t             <option value=\"");
      out.print(i );
      out.write('"');
      out.write(' ');
if (Integer.parseInt(book.getPublishing_date().substring(8))==i) {
      out.write("selected");
} 
      out.write('>');
      out.print(i );
      out.write("</option>\r\n");
      out.write("\t\t        ");
} 
      out.write("\r\n");
      out.write("\t\t        </select>\r\n");
      out.write("\t\t\t\t<div class=\"input-group-append\">\r\n");
      out.write("\t\t        \t<label class=\"input-group-text\" for=\"publishing_day\">일</label>\r\n");
      out.write("\t\t        </div>\t    \r\n");
      out.write("\t\t    </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"book_image\" class=\"col-sm-2 col-form-label\">이미지</label>\r\n");
      out.write("\t\t\t<div class=\"col-sm-4\">\r\n");
      out.write("\t\t\t\t<input type=\"file\" class=\"form-control\" id=\"book_image\" name=\"book_image\">");
      out.print(book.getBook_image() );
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"book_content\" class=\"col-sm-2 col-form-label\">내용</label>\r\n");
      out.write("\t\t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t<textarea class=\"form-control\" id=\"book_content\" name=\"book_content\" rows=\"13\" cols=\"40\">");
      out.print(book.getBook_content() );
      out.write("</textarea>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t<label for=\"discount_rate\" class=\"col-sm-2 col-form-label\">할인율</label>\r\n");
      out.write("\t\t\t<div class=\"input-group col-sm-4\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"discount_rate\" name=\"discount_rate\" maxlength=\"4\" value=\"");
      out.print(book.getDiscount_rate() );
      out.write("\">\r\n");
      out.write("\t\t\t\t<div class=\"input-group-append\">\r\n");
      out.write("\t\t        \t<label class=\"input-group-text\" for=\"discount_rate\">%</label>\r\n");
      out.write("\t\t        </div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"form-group\">      \r\n");
      out.write("\t\t\t<input type=\"button\" class=\"btn btn-warning\" value=\"책수정\" onclick=\"updateCheckForm(this.form)\">  \r\n");
      out.write("\t  \t\t<input type=\"reset\" class=\"btn btn-secondary\" value=\"다시작성\">\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>   \r\n");
      out.write("</div>\r\n");

	}catch(Exception e){
		e.printStackTrace();
	}

      out.write("         \r\n");
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