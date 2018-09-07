<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String title = "Book Shopping Mall";
%>

<jsp:include page="../module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

    <main role="main" class="container">
      <div class="row">
        <div class="col-md-8 blog-main">
          <h3 class="pb-3 mb-4 font-italic border-bottom">
            신간소개
          </h3>

          <div class="blog-post">
            <jsp:include page="introList.jsp" flush="false" /> 
          </div><!-- /.blog-post -->

        </div><!-- /.blog-main -->
		<jsp:include page="../module/side.jsp" flush="false" /> <!-- aside -->
      </div><!-- /.row -->

    </main><!-- /.container -->

<jsp:include page="../module/footer.jsp" flush="false"/>