package ch14.bookshop.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import ch13.board.BoardDataBean;

public class CommentDBBean {
	
	private static CommentDBBean instance = new CommentDBBean();
	   
    public static CommentDBBean getInstance() {
    	return instance;
    }
   
    private CommentDBBean() {}
   
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/cban");
        return ds.getConnection();
    }

    public void insertComment(CommentDataBean comment) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;

		String sql="";
		
		try {
			conn = getConnection();
			
			sql = "insert into comment(ref, writer, content, star, reg_date)";
			sql += "values(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getRef());
			pstmt.setString(2,  comment.getWriter());
			pstmt.setString(3, comment.getContent());
			pstmt.setInt(4,  comment.getStar());
			pstmt.setTimestamp(5, comment.getReg_date());
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null)
            	try { conn.close(); } catch(SQLException ex) {}
		}
    }
    
    public int getCommentCount(int ref) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="";

        int x=0;
        try {
            conn = getConnection();
            
            sql = "select count(*) from comment where ref=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, ref);
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
    
    public double avgStar(int ref) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="";

        double x=0;
        try {
            conn = getConnection();
            
            sql = "select round(avg(star),1) from comment where ref=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, ref);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                x= rs.getDouble(1);
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
    
    public List<CommentDataBean> getComments(int ref, String order) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       String sql = "";
       List<CommentDataBean> commentList = null;
       
       try {
           conn = getConnection();
           if(order.equals("newest")) {
	           sql = "select * from comment where ref = ? order by num desc ";
	    	   pstmt = conn.prepareStatement(sql);
	           pstmt.setInt(1, ref);
           } else if(order.equals("highest")) {
        	   sql = "select * from comment where ref = ? order by star desc ";
	    	   pstmt = conn.prepareStatement(sql);
	           pstmt.setInt(1, ref);
           } else if(order.equals("lowest")) {
        	   sql = "select * from comment where ref = ? order by star asc ";
	    	   pstmt = conn.prepareStatement(sql);
	           pstmt.setInt(1, ref);
           }
           rs = pstmt.executeQuery();

               if (rs.next()) {
            	   commentList = new ArrayList<CommentDataBean>();
            	   do {
                	   CommentDataBean comment= new CommentDataBean();
                	   comment.setNum(rs.getInt("num"));
                	   comment.setRef(rs.getInt("ref"));
                	   comment.setWriter(rs.getString("writer"));
                	   comment.setContent(rs.getString("content"));
                	   comment.setStar(rs.getInt("star"));
                	   comment.setReg_date(rs.getTimestamp("reg_date"));
                	   commentList.add(comment);
   			    	}while(rs.next());
   				}
           } catch(Exception ex) {
               ex.printStackTrace();
           } finally {
               if (rs != null) try { rs.close(); } catch(SQLException ex) {}
               if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
               if (conn != null) try { conn.close(); } catch(SQLException ex) {}
           }
   		return commentList;
       }
    
    public CommentDataBean getComment(int num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        CommentDataBean comment=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select * from comment where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	comment = new CommentDataBean();
            	comment.setNum(rs.getInt("num"));
            	comment.setRef(rs.getInt("ref"));
            	comment.setWriter(rs.getString("writer"));
            	comment.setContent(rs.getString("content"));
            	comment.setStar(rs.getInt("star"));
            	comment.setReg_date(rs.getTimestamp("reg_date"));
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return comment;
    }
    
    public int deleteComment(int num, String id) throws Exception {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs= null;
            String dbwriter="";
            int x=-1;
            try {
    			conn = getConnection();

                pstmt = conn.prepareStatement("select writer from comment where num=?");
                pstmt.setInt(1, num);
                rs = pstmt.executeQuery();
                
    			if(rs.next()){
    				dbwriter= rs.getString("writer"); 
    				if(dbwriter.equals(id)){
    					pstmt = conn.prepareStatement("delete from comment where num=?");
                        pstmt.setInt(1, num);
                        pstmt.executeUpdate();
    					x= 1; //글삭제 성공
    				}else
    					x= 0; //글삭제 실패
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
    
    public int updateComment(CommentDataBean comment) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String sql="";
        int x = -1;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select * from comment where num=?");
            pstmt.setInt(1, comment.getNum());
            rs = pstmt.executeQuery();
            
			if(rs.next()){
	            sql = "update comment set content=?, star=? where num=?";
	            pstmt = conn.prepareStatement(sql);
	
	            pstmt.setString(1, comment.getContent());
	            pstmt.setInt(2, comment.getStar());
                pstmt.setInt(3, comment.getNum());
	            pstmt.executeUpdate();
				x= 1;
			} else {
				x=0;
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