package com.JDBC;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.SQLException; 
public class DateBase {
	   
	    public static final String url = "jdbc:mysql://127.0.0.1/mysql?useUnicode=true&characterEncoding=UTF-8";  
	    public static final String driver = "com.mysql.jdbc.Driver";  
	    public static final String username = "root";  
	    public static final String password = "msk";
	    
	    public Connection conn=null;
	    public Connection getConn() {	       
	        try {
	            Class.forName(driver); //classLoader,���ض�Ӧ����
	            conn = (Connection) DriverManager.getConnection(url, username, password);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return conn;
	    }
	  
//	    public Connection conn = null;  
//	    public PreparedStatement pst = null;  
//	  
//	    public DateBase(String sql) {  
//	        try {  
//	            Class.forName(name);//ָ����������  
//	            conn = DriverManager.getConnection(url, user, password);//��ȡ����  
//	            pst = conn.prepareStatement(sql);//׼��ִ�����  
//	        } catch (Exception e) {  
//	            e.printStackTrace();  
//	        }  
//	    }  
//	  
//	    public void close() {  
//	        try {  
//	            this.conn.close();  
//	            this.pst.close();  
//	        } catch (SQLException e) {  
//	            e.printStackTrace();  
//	        }  
//	    }  
}
