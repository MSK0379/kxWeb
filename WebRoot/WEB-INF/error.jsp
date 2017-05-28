<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="no-js">
  <head>
    <base href="<%=basePath%>">
    
    <title>2017年科协报名官网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link href="css/bootstrap.min.css" rel="stylesheet">
	 <link href="css/myStyle.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<style type="text/css">
	a{
		font-family: "楷体";
		font-size: 25px;
		margin: 10 20 10 20;
	}
	</style>

  </head>
  
  <body style="overflow-x:hidden">
  <div class="row" >
  	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid"> 
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<img style="height: 60px;width: 60px;margin: 10px 20px 10px 50px"  src="imgs/logo.png"/>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<li  class="active"><a href="#">网上报名</a></li>
					<li><a href="#">科协简介</a></li>
					<li><a href="#">查询序号</a></li>
				</ul>
			</div>
		</div>
	</div>
<%--页眉--%>
	<div class="jumbotron masthead col-xs-12 col-sm-12 col-md-12" id="overview" style="margin-top: 75px;background-image: url('imgs/yemei.png');">
		<div >
		  <div class=" container">
		    <h2 style="margin-left: 8%">自动化科协</h2>
		    <p class="lead"></p>
		  </div>
		</div>
	</div>
<%--注册成功界面 --%>
	
	<div class=" col-xs-10 col-xs-offset-1 col-sm-8  col-sm-offset-2 col-md-4  col-md-offset-4" >
		<fieldset>
			<legend>页面走丢了：</legend>
			<h3  style="text-align:center">原因可能有很多。不过没关系，请点击下方连接返回注册页面</h3>
			<a href="index.jsp"  style="text-align:center">点我返回注册界面</a>
		</fieldset>
	</div>
  </body>
</html>
