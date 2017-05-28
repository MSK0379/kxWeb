//验证学号是否存在
$(function(){
	$("#sid").bind('blur',function(){
		if($("#sid").val()==""){
			
  		}else{
			$.ajax({
				url:'checkSidServlet',
			    type:'post',
			    data:{
			    	uname:$("#sid").val(),
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
