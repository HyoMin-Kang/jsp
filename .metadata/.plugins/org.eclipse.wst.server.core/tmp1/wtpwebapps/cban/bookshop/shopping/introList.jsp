<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import = "ch14.bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%
  ShopBookDataBean bookLists[] = null;
  int number =0;
  String book_kindName="";
  
  ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
  for(int i=10; i<=16;i++){
	  bookLists = bookProcess.getBooks(i+"0",3);
     
	if(bookLists[0].getBook_kind().equals("100")){
		book_kindName="건강 취미";
	}else if(bookLists[0].getBook_kind().equals("110")){
		book_kindName="경제 경영";  
    }else if(bookLists[0].getBook_kind().equals("120")){
		book_kindName="문학";
    }else if(bookLists[0].getBook_kind().equals("130")){
		book_kindName="사회 정치";  
   	}else if(bookLists[0].getBook_kind().equals("140")){
		book_kindName="자기계발";
  	 }else if(bookLists[0].getBook_kind().equals("150")){
		book_kindName="자연과학";  
 	 }else if(bookLists[0].getBook_kind().equals("160")){
      	book_kindName="참고서";
  	}else if(bookLists[0].getBook_kind().equals("200")){
		book_kindName="문학 소설";  
 	}else if(bookLists[0].getBook_kind().equals("210")){
		book_kindName="경제 경영";
 	}else if(bookLists[0].getBook_kind().equals("220")){
		book_kindName="인문 사회";  
	}else if(bookLists[0].getBook_kind().equals("230")){
		book_kindName="예술 대중문화";
	}else if(bookLists[0].getBook_kind().equals("240")){
	      book_kindName="취미 라이프스타일";  
   }else if(bookLists[0].getBook_kind().equals("250")){
	      book_kindName="컴퓨터";
   }else if(bookLists[0].getBook_kind().equals("260")){
	      book_kindName="자연과학";
   }
%>
  <br><b><%=book_kindName%> 분류의 신간목록: 
  <a href="list.jsp?book_kind=<%=bookLists[0].getBook_kind()%>">더보기</a>
  </b>
<%             
  for(int j=0;j<bookLists.length;j++){
	  if(bookLists[j] == null) continue;
%>
    <table > 
      <tr> 
        <td rowspan="4">
          <a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
             <img src="/cban/imageFile/<%=bookLists[j].getBook_image()%>" border="0" width="60" height="90"></a></td> 
       <td>
       		<b><a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
              <%=bookLists[j].getBook_title() %></a></b>
        </td> 
       <td rowspan="4">
          <%if(bookLists[j].getBook_count()==0){ %>
              <b>일시품절</b>
          <%}else{ %>
               &nbsp;
          <%} %>
       </td>
     </tr>        
     <tr> 
       <td>출판사 : <%=bookLists[j].getPublishing_com()%></td> 
     </tr>
     <tr> 
       <td>저자 : <%=bookLists[j].getAuthor()%></td>
     </tr>
     <tr> 
       <td>정가 :<%=NumberFormat.getInstance().format(bookLists[j].getBook_price())%>원<br>
                판매가 : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(bookLists[j].getBook_price()*((double)(100-bookLists[j].getDiscount_rate())/100)))%>
            </font></b>원</td> 
     </tr> 
     </table>
     <hr>
<%
  }
}
  for(int i=10; i<=16;i++){
	  bookLists = bookProcess.getBooks(i+"0",3);
     
	if(bookLists[0].getBook_kind().equals("100")){
		book_kindName="건강 취미";
	}else if(bookLists[0].getBook_kind().equals("110")){
		book_kindName="경제 경영";  
    }else if(bookLists[0].getBook_kind().equals("120")){
		book_kindName="문학";
    }else if(bookLists[0].getBook_kind().equals("130")){
		book_kindName="사회 정치";  
   	}else if(bookLists[0].getBook_kind().equals("140")){
		book_kindName="자기계발";
  	 }else if(bookLists[0].getBook_kind().equals("150")){
		book_kindName="자연과학";  
 	 }else if(bookLists[0].getBook_kind().equals("160")){
      	book_kindName="참고서";
  	}
%>
  <br><b><%=book_kindName%> 분류의 신간목록: 
  <a href="list.jsp?book_kind=<%=bookLists[0].getBook_kind()%>">더보기</a>
  </b>
<%             
  for(int j=0;j<bookLists.length;j++){
	  if(bookLists[j] == null) continue;
%>
    <table > 
      <tr> 
        <td rowspan="4">
          <a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
             <img src="/cban/imageFile/<%=bookLists[j].getBook_image()%>" border="0" width="60" height="90"></a></td> 
       <td>
       		<b><a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
              <%=bookLists[j].getBook_title() %></a></b>
        </td> 
       <td rowspan="4">
          <%if(bookLists[j].getBook_count()==0){ %>
              <b>일시품절</b>
          <%}else{ %>
               &nbsp;
          <%} %>
       </td>
     </tr>        
     <tr> 
       <td>출판사 : <%=bookLists[j].getPublishing_com()%></td> 
     </tr>
     <tr> 
       <td>저자 : <%=bookLists[j].getAuthor()%></td>
     </tr>
     <tr> 
       <td>정가 :<%=NumberFormat.getInstance().format(bookLists[j].getBook_price())%>원<br>
                판매가 : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(bookLists[j].getBook_price()*((double)(100-bookLists[j].getDiscount_rate())/100)))%>
            </font></b>원</td> 
     </tr> 
     </table>
     <hr>
<%
  }
}
  
  for(int i=20; i<=26;i++){
	  bookLists = bookProcess.getBooks(i+"0",3);
     
	if(bookLists[0].getBook_kind().equals("200")){
		book_kindName="문학 소설";  
 	}else if(bookLists[0].getBook_kind().equals("210")){
		book_kindName="경제 경영";
 	}else if(bookLists[0].getBook_kind().equals("220")){
		book_kindName="인문 사회";  
	}else if(bookLists[0].getBook_kind().equals("230")){
		book_kindName="예술 대중문화";
	}else if(bookLists[0].getBook_kind().equals("240")){
	      book_kindName="취미 라이프스타일";  
   }else if(bookLists[0].getBook_kind().equals("250")){
	      book_kindName="컴퓨터";
   }else if(bookLists[0].getBook_kind().equals("260")){
	      book_kindName="자연과학";
   }
%>
  <br><b><%=book_kindName%> 분류의 신간목록: 
  <a href="list.jsp?book_kind=<%=bookLists[0].getBook_kind()%>">더보기</a>
  </b>
<%             
  for(int j=0;j<bookLists.length;j++){
	  if(bookLists[j] == null) continue;
%>
    <table > 
      <tr> 
        <td rowspan="4">
          <a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
             <img src="/cban/imageFile/<%=bookLists[j].getBook_image()%>" border="0" width="60" height="90"></a></td> 
       <td>
       		<b><a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
              <%=bookLists[j].getBook_title() %></a></b>
        </td> 
       <td rowspan="4">
          <%if(bookLists[j].getBook_count()==0){ %>
              <b>일시품절</b>
          <%}else{ %>
               &nbsp;
          <%} %>
       </td>
     </tr>        
     <tr> 
       <td>출판사 : <%=bookLists[j].getPublishing_com()%></td> 
     </tr>
     <tr> 
       <td>저자 : <%=bookLists[j].getAuthor()%></td>
     </tr>
     <tr> 
       <td>정가 :<%=NumberFormat.getInstance().format(bookLists[j].getBook_price())%>원<br>
                판매가 : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(bookLists[j].getBook_price()*((double)(100-bookLists[j].getDiscount_rate())/100)))%>
            </font></b>원</td> 
     </tr> 
     </table>
     <hr>
<%
  }
}
%>