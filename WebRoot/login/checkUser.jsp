<%@ page language="java" import="java.util.*,com.JDBC.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	//获取用户名
	String username=request.getParameter("username");
	//获取密码
	String password=request.getParameter("password");
	demo ul=new demo();
	int flag = ul.Cuser(username,password);
	if(flag!=0){
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}else{
		request.setAttribute("error","用户名或密码错误！！");
		request.getRequestDispatcher("/login/login.jsp").forward(request,response);
	}

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
