<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String error= (String)request.getAttribute("error");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		$(function(){
  			$("#username").bind('blur',function(){
  	  			if($("#username").val()==""){
  	  				$("#sp").html("<font color='red'>用户名不能位空</font>");
  	  	  		}else{
	  				$.ajax({
	  					url:'checkUserServlet',
	  				    type:'post',
	  				    data:{
	  				    	uname:$("#username").val(),
	  				    	time:new Date().getTime(),
	  				    	cache:false
	  				    },
	  				    	dataType:"json",
	  				  // dataType:"text",
	  				  //设置为text格式时  需要通过eval函数将字符串转换为json格式数据
	  				   success:function(results){
	  				    	//var r=eval("("+results+")");
	  				    	var r=results;
	  				    	if(r.flag=="1"){
	  				    		$("#sp").html("<font color='green'>√</font>");
	  				    	}else{
	  				    		$("#sp").html("<font color='red'>x</font>");
	  				    		$("#username").val("");
	  				    	}
	  				    },
	  				    error:function(){
	  				    	alert("服务器连接失败");
	  				    }
	  				});
  				}
  			});
  		});
	</script>
  </head>
  
  <body>
   	<form action="kxServlet" method="post" >
   		<table border="1px" align="center" cellpadding="0" >
   		<tr>
   			<td>用户名:<input type="text" id="username" name="username"/></td>
   			<td><span id="sp"></span></td>
   		</tr>
   		<tr>
   			<td>密　码:<input type="password" name="password"/></td>
   		</tr>
   		<tr>
   			<td>　　 <input type="submit" values="登陆"/>　　　 <input type="reset" values="重置"/></td>
   		</tr>
   		</table>
   		<%=error %>
   	
   	</form>
  </body>
</html>
