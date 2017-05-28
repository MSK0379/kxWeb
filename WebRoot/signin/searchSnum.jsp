<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<li><a href="index.jsp">网上报名</a></li>
					<li><a href="#">科协简介</a></li>
					<li class="active"><li><a href="signin/searchSnum.jsp">查询序号</a></li>
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
		<form id="test" action="searchSnum" method="post">
			<legend>查询报名序号</legend>
			 <div class="form-row">
	            <div class="field-label"><label>请输入你的学号</label>:</div>
	            <div class="field-widget"><input id="sid" name=sid type="text" class="required" minlength="10" maxlength="10" title="请输入你的学号" required"/></div>
	        </div>
	          <div class="form-row" style="text-align:center; width:100%">
			  
			  <div><button type="submit" class="btn btn-success" style="margin: 10px 40px 10px 40px;width: 200px">查询</button></div>	
			</div>
			<div class="form-row" style="width: 100%">
			<c:if test="${empty snum}"> 
			 
				<h3>${error}</h3>
			</c:if> 
			<c:if test="${not empty snum}"> 
			 
				<h3>
				${sname} 同学你好，你的序号为:<br></h3>
				<h1 style="text-align:center">${snum}</h1><br>
				<h3 style="text-align:right">，请牢记。</h3>
			</c:if> 
			</div>
		</form>
		</fieldset>
	</div>
		<div class="footer  col-xs-12 col-sm-8  col-sm-offset-2 col-md-6  col-md-offset-3 " style="text-align: center">
		
			<div>联系地址：曲江：教十-613 金花：教五：地-12<br></div>
			
			<div>Copyright @自动化与信息工程学院    学生科协与技术协会 . All Rights Reserved.</div>
	    </div>
	</div>
  </body>
</html>
