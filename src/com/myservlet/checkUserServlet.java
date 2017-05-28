package com.myservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JDBC.demo;
import com.bean.Student;

public class checkUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public checkUserServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter pw=response.getWriter();
		String username = request.getParameter("uname");  

       
       demo d = new demo();
       int flag =d.CheckUser(username);
       String resultJson="";
		if(flag==0){
			resultJson="{\"flag\":\"0\"}";
		}else{
			resultJson="{\"flag\":\"1\"}";
		}
		pw.println(resultJson);
		System.out.println(resultJson+"****************");
		pw.flush();
		pw.close();
}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
