package com.webServlect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JDBC.kxLoginControl;
import com.bean.Student;

public class kxWebServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public kxWebServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		// 获取表单中参数
		String sname = request.getParameter("sname");
		String ssex = request.getParameter("ssex");
		String sclass = request.getParameter("sclass");
		String sid = request.getParameter("sid");
		String sphone = request.getParameter("sphone");
		String semail = request.getParameter("semail");
		String sintru = request.getParameter("sintru");
		String sdept1 = request.getParameter("sdept1");
		String sdept2 = request.getParameter("sdept2");
		kxLoginControl klc = new kxLoginControl();
		if (klc.findSnum(sid).getSid() !=null) {
			request.setAttribute("error", "你已经报名成功，请勿重复报名");
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
		} else {
			request.setAttribute("error", "");
			String snum = klc.getCountStu();
			Student stu = new Student();
			stu.setSnum(snum);
			stu.setSname(sname);
			stu.setSsex(ssex);
			stu.setSclass(sclass);
			stu.setSid(sid);
			stu.setSphone(sphone);
			stu.setSemail(semail);
			stu.setSintru(sintru);
			stu.setSdept1(sdept1);
			stu.setSdept2(sdept2);

			int flag = klc.insertuser(stu);

			// String num = klc.findSnum(sid);
			request.setAttribute("snum", snum);
			request.setAttribute("sname", sname);
			if (flag != 0) {
				request.getRequestDispatcher("/signin/signSuccess.jsp")
						.forward(request, response);
			} else {
				request.setAttribute("error",
						"报名失败，失败原因有很多，请你再试一次，如果依旧失败，请联系科协相关同学！！");
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
			}
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
