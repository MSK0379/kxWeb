package com.JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.jdbc.PreparedStatement;


public class demo extends DateBase{
  
  
     public void insertuser() {
    	 	getConn();
    	    int i = 0;
    	    String sql = "insert into stu (sid,name,password) values(?,?,?)";
    	    PreparedStatement pstmt;
    	    
	        try {
				pstmt = (PreparedStatement) conn.prepareStatement(sql);
				pstmt.setInt(1, 2);
				pstmt.setString(2, "mm");
				pstmt.setString(3, "123");
				i = pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
     }
     public Integer Cuser(String name,String pass) {
 	 	getConn();
 	    String sql = "select *from stu where name=? and password=?";
 	    PreparedStatement pstmt;
 	    int col =0;
	        try {
				pstmt = (PreparedStatement) conn.prepareStatement(sql);
				
				pstmt.setString(1, name);
				pstmt.setString(2, pass);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					col=1;
				}
//				col = rs.getMetaData().getColumnCount();
				
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(col+"+++++++");
			return col;
  }
     public Integer CheckUser(String name){
    	 System.out.println(name);
    	 getConn();
  	    String sql = "select *from stu where name=?";
  	    PreparedStatement pstmt;
  	    int col =0;
 	        try {
 				pstmt = (PreparedStatement) conn.prepareStatement(sql);
 				
 				pstmt.setString(1, name);
 				
 				ResultSet rs = pstmt.executeQuery();
 				if(rs.next()){
 					col=1;
 				}
// 				col = rs.getMetaData().getColumnCount();
 				
 				pstmt.close();
 				conn.close();
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 			System.out.println(col+"-------");
 			return col;
     }
     public static void main(String[] args) {
    	 demo dem=new demo();
    	 System.out.println(dem.Cuser("msk","12345"));
    	 
	}
}