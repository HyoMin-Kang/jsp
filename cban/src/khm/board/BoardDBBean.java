package khm.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import khm.board.BoardDataBean;

public class BoardDBBean {
	
    private static BoardDBBean instance = new BoardDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static BoardDBBean getInstance() {
        return instance;
    }
    
    private BoardDBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/cban");
        return ds.getConnection();
    }
 
    //board테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
    public void insertArticle(BoardDataBean article) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
		    if (num!=0) {  
		      sql="update board set re_step=re_step+1 ";
		      sql += "where ref= ? and re_step> ?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, ref);
			  pstmt.setInt(2, re_step);
			  pstmt.executeUpdate();
			  re_step=re_step+1;
			  re_level=re_level+1;
		     }else{
		  	  ref=number;
			  re_step=0;
			  re_level=0;
		     }	 
            // 쿼리를 작성
            sql = "insert into board(writer,email,category,subject,passwd,reg_date,ref,re_step,re_level,content,file,ip)";
            sql += "values(?,?,?,?,?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, article.getWriter());
            pstmt.setString(2, article.getEmail());
            pstmt.setString(3, article.getCategory());
            pstmt.setString(4, article.getSubject());
            pstmt.setString(5, article.getPasswd());
			pstmt.setTimestamp(6, article.getReg_date());
            pstmt.setInt(7, ref);
            pstmt.setInt(8, re_step);
            pstmt.setInt(9, re_level);
			pstmt.setString(10, article.getContent());
			pstmt.setString(11, article.getFile());
			pstmt.setString(12, article.getIp());
			
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    //검색 결과 게시글의 수를 얻어냄(select문)<=list.jsp에서 사용
	public int getArticleCount(String keyField, String keyWord) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       String sql = null;
       
       int x=0;

       try {
           conn = getConnection();
           
           if(keyWord == null || keyWord.equals("")) {
        	   sql = "select count(*) from board";
        	   pstmt = conn.prepareStatement(sql);
           } else if(keyField.equals("subject_content")) {
        	   sql = "select count(*) from board where subject like ? or content like ?";
        	   pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, "%"+keyWord+"%");
               pstmt.setString(2, "%"+keyWord+"%");
           } else {
        	   sql = "select count(*) from board where "+keyField+" like ?";
        	   pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, "%"+keyWord+"%");
           }
           rs = pstmt.executeQuery();

           if (rs.next()) {
              x= rs.getInt(1);
			}
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
		return x;
   }

	//글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
	public List<BoardDataBean> getArticles(int start, int end, String keyField, String keyWord)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDataBean> articleList=null;
        
        try {
            conn = getConnection();
            
            if(keyField== null && keyWord == null) { //기본값
            	pstmt = conn.prepareStatement("select * from board order by ref desc, re_step asc limit ?,? ");
            	pstmt.setInt(1, start-1);
    			pstmt.setInt(2, end);
            } else {
            	if(keyField.equals("writer")) {
            		pstmt = conn.prepareStatement("select * from board where writer like ? order by ref desc, re_step asc limit ?,?");
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start-1);
	    			pstmt.setInt(3, end);
            	} else if(keyField.equals("subject")) {
            		pstmt = conn.prepareStatement("select * from board where subject like ? order by ref desc, re_step asc limit ?,?");
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start-1);
	    			pstmt.setInt(3, end);
            	} else if(keyField.equals("category")) {
            		pstmt = conn.prepareStatement("select * from board where category like ? order by ref desc, re_step asc limit ?,?");
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start-1);
	    			pstmt.setInt(3, end);
            	} else if(keyField.equals("content")) {
            		pstmt = conn.prepareStatement("select * from board where content like ? order by ref desc, re_step asc limit ?,?");
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start-1);
	    			pstmt.setInt(3, end);
            	} else if(keyField.equals("subject_content")) {
            		pstmt = conn.prepareStatement("select * from board where subject like ? or content like ? order by ref desc, re_step asc limit ?,?");
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setString(2, "%"+keyWord+"%");
					pstmt.setInt(3, start-1);
	    			pstmt.setInt(4, end);
            	}
            }
            
            rs = pstmt.executeQuery();

            if (rs.next()) { //검색 결과 있음
                articleList = new ArrayList<BoardDataBean>(end);
                do{
                  BoardDataBean article= new BoardDataBean();
				  article.setNum(rs.getInt("num"));
				  article.setWriter(rs.getString("writer"));
                  article.setEmail(rs.getString("email"));
                  article.setCategory(rs.getString("category"));
                  article.setSubject(rs.getString("subject"));
                  article.setPasswd(rs.getString("passwd"));
			      article.setReg_date(rs.getTimestamp("reg_date"));
				  article.setReadcount(rs.getInt("readcount"));
                  article.setRef(rs.getInt("ref"));
                  article.setRe_step(rs.getInt("re_step"));
				  article.setRe_level(rs.getInt("re_level"));
                  article.setContent(rs.getString("content"));
                  article.setFile(rs.getString("file"));
			      article.setIp(rs.getString("ip")); 
				  
                  articleList.add(article);
			    }while(rs.next());
			} else { //검색 결과 없음
				
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return articleList;
    }
	
	//글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
	public BoardDataBean getArticle(int num)
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            	"update board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

            pstmt = conn.prepareStatement("select * from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new BoardDataBean();
                article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setCategory(rs.getString("category"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
                article.setFile(rs.getString("file"));
			    article.setIp(rs.getString("ip"));     
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }
    
	//글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
	public BoardDataBean updateGetArticle(int num)
	          throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        BoardDataBean article=null;
	        try {
	            conn = getConnection();

	            pstmt = conn.prepareStatement(
	            	"select * from board where num = ?");
	            pstmt.setInt(1, num);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                article = new BoardDataBean();
	                article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
	                article.setEmail(rs.getString("email"));
	                article.setCategory(rs.getString("category"));
	                article.setSubject(rs.getString("subject"));
	                article.setPasswd(rs.getString("passwd"));
				    article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
	                article.setRef(rs.getInt("ref"));
	                article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
	                article.setContent(rs.getString("content"));
	                article.setFile(rs.getString("file"));
				    article.setIp(rs.getString("ip"));     
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return article;
	    }

  //글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
    public int updateArticle(BoardDataBean article)
            throws Exception {
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs= null;

          String dbpasswd="";
          String sql="";
  		int x=-1;
          try {
              conn = getConnection();
              
  			pstmt = conn.prepareStatement(
              	"select passwd from board where num = ?");
              pstmt.setInt(1, article.getNum());
              rs = pstmt.executeQuery();
              
  			if(rs.next()){
  			  dbpasswd= rs.getString("passwd"); 
  			  if(dbpasswd.equals(article.getPasswd())){
                  sql="update board set writer=?,email=?,category=?,subject=?,passwd=?";
  			    sql+=",content=?,file=? where num=?";
                  pstmt = conn.prepareStatement(sql);

                  pstmt.setString(1, article.getWriter());
                  pstmt.setString(2, article.getEmail());
                  pstmt.setString(3, article.getCategory());
                  pstmt.setString(4, article.getSubject());
                  pstmt.setString(5, article.getPasswd());
                  pstmt.setString(6, article.getContent());
                  pstmt.setString(7,  article.getFile());
                  pstmt.setInt(8, article.getNum());
                  pstmt.executeUpdate();
  				x= 1;
  			  }else{
  				x= 0;
  			  }
  			}
          } catch(Exception ex) {
              ex.printStackTrace();
          } finally {
  			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
              if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
              if (conn != null) try { conn.close(); } catch(SQLException ex) {}
          }
  		return x;
      }
    
    //글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
    public int deleteArticle(int num, String passwd)
        throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement(
            	"select passwd from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from board where num=?");
                    pstmt.setInt(1, num);
                    pstmt.executeUpdate();
					x= 1; //글삭제 성공
				}else
					x= 0; //비밀번호 틀림
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }

}