package com.webServlect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JDBC.kxLoginControl;
import com.bean.Student;

public class searchSnum extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public searchSnum() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8"); 
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter pw=response.getWriter();
		String sid = request.getParameter("sid");  

		kxLoginControl klc = new kxLoginControl();
       if(sid!=""){
	       Student stu =klc.findSnum(sid);
	       if(stu.getSnum()!=""){
	    	   request.setAttribute("snum", stu.getSnum());
	    	   request.setAttribute("sname", stu.getSname());
	       }else{
	    	   request.setAttribute("error", "未查询到您的报名信息，请确保您已经报名成功！");
	       }
       } else{
    	   request.setAttribute("error", "请输入您的学号");
       }
       request.getRequestDispatcher("/signin/searchSnum.jsp").forward(request,response);
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
