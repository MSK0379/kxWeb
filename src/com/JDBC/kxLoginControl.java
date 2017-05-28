package com.JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.Student;
import com.mysql.jdbc.PreparedStatement;

public class kxLoginControl extends DateBase{
	//插入信息
	 public int  insertuser(Student stu) {
 	 	getConn();
 	    int i = 0;
 	    String sql = "insert into kxlogin (sname,ssex,sclass,sid,sphone,semail,sintru,sdept1,sdept2,snum) values(?,?,?,?,?,?,?,?,?,?)";
 	    PreparedStatement pstmt;
 	    
	        try {
				pstmt = (PreparedStatement) conn.prepareStatement(sql);
				pstmt.setString(1,stu.getSname());
				pstmt.setString(2, stu.getSsex());
				pstmt.setString(3, stu.getSclass());
				pstmt.setString(4, stu.getSid());
				pstmt.setString(5, stu.getSphone());
				pstmt.setString(6, stu.getSemail());
				pstmt.setString(7, stu.getSintru());
				pstmt.setString(8, stu.getSdept1());
				pstmt.setString(9, stu.getSdept2());
				pstmt.setString(10, stu.getSnum());
				i = pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return i;
  }
	 //验证改用户存在
	 public Integer CheckSid(String sid){
    	 System.out.println(sid+"验证改用户存在");
    	 getConn();
  	    String sql = "select *from kxlogin where sid=?";
  	    PreparedStatement pstmt;
  	    int col =0;
 	        try {
 				pstmt = (PreparedStatement) conn.prepareStatement(sql);
 				
 				pstmt.setString(1, sid);
 				
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
 			System.out.println(col+"返会是否含有");
 			return col;
     }
	 //根据sid查看snum
	 public Student findSnum(String sid){
		 Student stu = new Student();
		 String snum="",sname="";
	   	 getConn();
	  	    String sql = "select snum,sname from kxlogin where sid=?";
	  	    PreparedStatement pstmt;
	  	    int col =0;
	 	        try {
	 				pstmt = (PreparedStatement) conn.prepareStatement(sql);
	 				
	 				pstmt.setString(1, sid);
	 				
	 				ResultSet rs = pstmt.executeQuery();
	 				if(rs.next()){
	 					snum = rs.getString(1);
	 					sname = rs.getString(2);
	 					
	 				}
//	 				col = rs.getMetaData().getColumnCount();
	 				
	 				pstmt.close();
	 				conn.close();
	 			} catch (SQLException e) {
	 				// TODO Auto-generated catch block
	 				e.printStackTrace();
	 			}
	 			if(snum!=""){
	 				 stu.setSnum(snum);
 					 stu.setSname(sname);
	 			}
	 			System.out.println(stu.getSname());
		return stu;
		 
	 }
	 //计算注册学生的序号
	 public String getCountStu(){
		 int num=0;
		 String snum="";
	   	 getConn();
	  	    String sql = "select count(*) from kxlogin ";
	  	    PreparedStatement pstmt;
	  	    int col =0;
	 	        try {
	 				pstmt = (PreparedStatement) conn.prepareStatement(sql);
	 				
	 				ResultSet rs = pstmt.executeQuery();
	 				if(rs.next()){
	 					num = rs.getInt(1);
	 					snum = String.format("%03d", num+1);
	 				}
//	 				col = rs.getMetaData().getColumnCount();
	 				
	 				pstmt.close();
	 				conn.close();
	 			} catch (SQLException e) {
	 				// TODO Auto-generated catch block
	 				e.printStackTrace();
	 			}
		return snum;
		 
	 }
	 public static void main(String[] args) {
		 kxLoginControl kel = new kxLoginControl();
		 Student stu = new Student();
		
		 String i = kel.getCountStu();
		 System.out.println(i);
	}
}
