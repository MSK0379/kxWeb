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
	 <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
	 <link href="<%=basePath%>css/myStyle.css" rel="stylesheet">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<%--	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>--%>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<style type="text/css">
	a{
		font-family: "楷体";
		font-size: 25px;
		margin: 10 20 10 20;
	}
	option{
	font-family: "宋体";
		font-size: 25px;
	}
	</style>
	<script type="text/javascript">
	//验证学号是否存在
	
	$(function(){
		$("#sid").bind('blur',function(){
			if($("#sid").val()==""){
				
				
				$("#sp").html("<font color='red'>学号不能为空</font>");
	  		}else{
	  			var reg = /^316+\d{7}$/;
	  			var sid = $("#sid").val();
	  			if(!reg.test(sid)){
	  				$("#sp").html("<font color='red'>学号不合法，请填写您的真实学号</font>");
			  	}else{
					$.ajax({
						url:'checkSidServlet',
					    type:'post',
					    data:{
					    	sid:$("#sid").val(),
					    	time:new Date().getTime(),
					    	cache:false
					    },
					    	dataType:"json",
					  // dataType:"text",
					  //设置为text格式时  需要通过eval函数将字符串转换为json格式数据
					   success:function(results){
					    	//var r=eval("("+results+")");
					    	var r=results;
					    	if(r.flag=="0"){
					    		$("#sp").html("<font color='green'></font>");
					    	}else{
					    		$("#sp").html("<font color='red'>该学号已经被注册</font>");
					    		$("#sid").val("");
					    	}
					    },
					    error:function(){
					    	alert("服务器连接失败,请重试请尝试一次，如果仍然报错，请联系科协同学");
					    }
					});
	  				}//正则表达式结尾
				}//不为空
			});
		});
		
	</script>

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
					<li><a href="signin/searchSnum.jsp">查询序号</a></li>
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
<%--表单	--%>
	<div class=" col-xs-10 col-xs-offset-1 col-sm-8  col-sm-offset-2 col-md-4  col-md-offset-4" >
		<form id="test" action="kxWebServlet" method="post">
		<div><c:if test="${not empty error}"> 
				<h3 style="text-align: center;">${error}</h3>
			</c:if> </div>
			 <fieldset>
			 	<legend>基本信息</legend>
			     	<div class="form-row">
			            <div class="field-label"><label>姓名</label>:</div>
			            <div class="field-widget"><input name="sname" class="required" minlength="2" 	maxlength="5" title="请输入你的名字" required /></div>
			        </div>
			     
   				 <div class="form-row">
			            <div class="field-label"><label>性别</label>:</div>
			            <div class="field-widget">
				            <label><input name="ssex" type="radio" value="男" required/>男</label> 
							<label><input style="margin-left: 40px"  name="ssex" type="radio" value="女"/>女</label> 
						</div>
						
			        </div>
			         <div class="form-row">
			            <div class="field-label"><label>班级</label>:</div>
			            <div class="field-widget"><input name="sclass" type="text" class="required"  title="请输入你的班级" required/></div>
			        </div>
			        <div class="form-row">
			            <div class="field-label"><label>学号</label>:</div>
			            <div class="field-widget"><input id="sid" name=sid type="text" class="required" minlength="10" maxlength="10" title="请输入你的学号" required onclick="onclick()"/></div>
			        </div>
			          <div class="form-row">
			            <div class="field-label"><label></label></div>
			            <div class="field-widget"><span id="sp"></div>
			        </div>
			        
			        
			        <div class="form-row">
			            <div class="field-label"><label>手机号</label>:</div>
			            <div class="field-widget"><input id="sphone" name="sphone" type="text" class="required isTel" minlength="11" maxlength="11" title="请输入你的手机号" required onblur="onblurs()"/><span id="sp"></span></div>
			        </div>
			               <div class="form-row">
			            <div class="field-label"><label>邮箱</label>:</div>
			            <div class="field-widget"><input name="semail" type="email" name="email" required class="required" title="请输入你的邮箱" /></div>
			        </div>
			        <div class="form-row">
			            <div class="field-label"><label >自我介绍 </label>:</div>
			            <div class="field-widget"><textarea name="sintru" class="required"></textarea></div>
			        </div>
			   
			 <!-- 部门介绍模态框实现-->
			  <div class="form-row" style="text-align:center; width:100%">
			  
			  <div><button type="button" class="btn  btn-warning" data-toggle="modal" data-target=".bs-example-modal-lg">
			  	
        				<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>点我了解部门详情</button></div>	
			</div>
				<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				    <div class="modal-header">
       					 <h4 class="modal-title" id="exampleModalLabel">自动化科协部门简介</h4>
   				   </div>
   				    <div class="modal-body">
   				    <div class="departmentInfo col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-md-6  col-md-offset-3" id="departmentInfo">
					
							<h3>秘书部：</h3>
						<p>
							1．	起草活动策划案，负责活动签到及总结；<br>
							2．	负责科协成员的各项考核；<br>
							3．	负责科协各类文件的收集、分类和存档；<br>
							4．	负责科协实验室及各项活动的值班安排。<br>
						</p>
							<h3>实验管理部：</h3>
						<p>
							1．	负责科协的物资采购、调用及管理；<br>
							2．	管理科协各实验室的所有元件、工具和设备；<br>
							3．	负责实验室规章制度的制定与实施；<br>
							4．	负责所有作品相关文档的管理。<br>
						</p>
							<h3>宣传策划部：</h3>
						<p>
							1．	负责活动的海报、视频、展架、展板等宣传用品的设计与制作，负责科协场地的布置；<br>
							2．	负责活动照片的拍摄及活动新闻稿的撰写；<br>
							3．	开发、管理、运营科协官方网站；<br>
							4．	负责科协报纸、期刊的创作与发行。<br>
						</p>
							<h3>竞赛组织部: </h3>
						<p>
							1．	负责我院“新星杯”、“理奥杯”及校科技节等科技竞赛的相关操作事物，包括作品收集、管理及组织作品评审；<br>
							2．	积极联系、组织我院学生参加国家、省市大型竞赛活动；<br>
							3．	负责教授讲坛、青年教师讲座、科协公开课及各类比赛培训工作的相关事宜；<br>
							4．	联系和审批活动场地、活动用品，并负责处理各类突发情况。<br>
						</p>
							<h3>对外交流部：</h3>
						<p>
							1．	负责我院与校内其他科技社团、学术机构的沟通与合作；<br>
							2．	负责科协与校外研究性学术机构及商业性机构的技术交流；<br>
							3．	负责科协微信平台的运营；<br>
							4．	负责科协对外形象的推广、优化工作。<br>
						</p>
							<h3 style="color:red">注意</h3>
						<p>
							请选择两个感兴趣的部门，该选择并非最终结果。<br>
							分各部门只是方便管理与细化分工，不影响培训、比赛等其他事务。<br>
						</p>
						</div>

				      </div>
				       <div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">我了解了，关闭窗口</button>
        				</div>
				    </div>
				  </div>	
				</div>
						        
		<div class="form-row">
            <div class="field-label" ><label>选择期望部门</label>:</div>
	            <div class="field-widget">
	                <select id="dept1" name="sdept1" class="validate-selection" title="选择希望加入的部门(必选)" required >
	                    <option>请选择部门（必选）</option>
	                    <option>宣传策划部</option>
	                    <option>竞赛组织部</option>
	                    <option>秘书部</option>
	                    <option>对外交流部</option>
	                    <option>实验管理部</option>
	                </select>
	            </div>
         </div>
         <div class="form-row">
         	<div class="field-label" ><label>选择期望部门</label>:</div>  
        	<div class="field-widget">
            	<select id="dept1" name="sdept2" class="validate-selection" title="选择希望加入的部门（可不选）" >
                   <option>请选择部门（可不选）</option>
                   <option>宣传策划部</option>
                   <option>竞赛组织部</option>
                   <option>秘书部</option>
                   <option>对外交流部</option>
                   <option>实验管理部</option>
              	</select>
          	</div>
         </div>
         
         <div class="form-row" style="text-align:center; width:100%;margin-top: 40px" >
	         <div  >
	         	<input type="submit" class="submit" value="提交" >
			   	<input type="reset"  class="reset" value="重置" style="margin-left: 40px;">
			  </div>
		</div>
		</fieldset>
		  
    	</form>
	</div>
		 
		<div class="footer  col-xs-12 col-sm-8  col-sm-offset-2 col-md-6  col-md-offset-3" style="text-align: center">
		
			<div>联系地址：曲江：教十-613 金花：教五：地-12<br></div>
			
			<div>Copyright @自动化与信息工程学院    学生科协与技术协会 . All Rights Reserved.</div>
	    </div>
	 </div>
  </body>
</html>
