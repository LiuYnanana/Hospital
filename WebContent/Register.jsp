<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css.map" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css.map" rel="stylesheet">
<script src="js/jparticles.js"></script>
    <!-- 引入粒子特效 -->
 <script src="js/particle.js"></script>
<style>
.mycenter {
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	height: 380px;
	width: 500px;
	padding: 2%;
	background: white;
	border-radius: 10px;
}
</style>
</head>
<body class="bootstrap-admin-without-padding"  style="background-color:#ECF1F1" >
	
	<div class="mycenter" style="background-color:#ECF1F1;" >

		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-4 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="username"
						placeholder="请输入用户名" id="input1" oninput="judgeOneUser()">
				</div>
				<span id="hint1"> </span>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="password"
						placeholder="请输入密码" id="input2">
				</div>
				<span id="hint2"> </span>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">手机号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="phone"
						placeholder="请输入手机号" id="input3">
				</div>
				<span id="hint3"> </span>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">邮箱</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="email"
						placeholder="请输入邮箱" id="input4">
				</div>
				<span id="hint4"> </span>
			</div>

			<div class="form-group" style="margin-top: 5%">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="button" id="btn1" class="btn btn-default" onclick="nullFunction()">注册</button>
				</div>
			</div>
			
			<div class="col-sm-offset-4 col-sm-10" style="visibility:hidden;">
					<!-- <button id="btn2" class="btn btn-default" data-target="#tip">注册</button> -->
					 <a id="btn2" class="btn btn-lg btn-default" data-toggle="modal" data-target="#tip">登录</a>
			</div>

		</form>
	</div>

	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel" id="tip">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
				</div>
				<div class="modal-body" id="msg"></div>
				<div class="modal-footer">
					<a href="index.jsp"	class="btn btn-primary" role="button">确定</a>

				</div>
			</div>
		</div>
	</div>

</body>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
        // 使用 new JParticles.特效名 创建特效
        new JParticles.particle('#demo');
    </script>
<script>
    function judgeOneUser() {
	    var username = document.getElementById("input1").value;
	    $.ajax({
	      url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" %>Register",//访问的地址
          type:"post",
          data:{
        	  "username" : username,
        	  },
          dataType:'text',//后台返回的数据格式类型
          success:function(data){
        	  
        	  if(data == "click") {	
        		 /*  alert("click"); */
        		  $("#input1").css('borderColor','red');
        		  $("#input2").attr("disabled",true);
        		  $("#input3").attr("disabled",true);
        		  $("#input4").attr("disabled",true);
        		  document.getElementById("hint1").innerHTML = "*用户名已存在";
        		
        	  } else {
        		/*   alert("no"); */
        		  document.getElementById("hint1").innerHTML = "";
             	  $("#input1").css('borderColor',''); //取消css样式	  
             	  $('#input2').attr("disabled",false);
             	  $('#input3').attr("disabled",false);
             	  $('#input4').attr("disabled",false);
        	  }
         },
	});
	}
    
    function clean() {
    	/*  alert("clean"); */
    	 document.getElementById("hint1").innerHTML = "";
		 document.getElementById("hint2").innerHTML = "";
		 document.getElementById("hint3").innerHTML = "";
		 document.getElementById("hint4").innerHTML = "";


    	 $("#input1").css('borderColor',''); //取消css样式	
    	 $("#input2").css('borderColor',''); //取消css样式	
    	 $("#input3").css('borderColor',''); //取消css样式	
    	 $("#input4").css('borderColor',''); //取消css样式	
    	 
    }
    
    function nullFunction() {
    	clean();
    	var flag = true;
    	if($("#input1").val() == "") {
    		$("#input1").css('borderColor','red');
    		document.getElementById("hint1").innerHTML = "*请填写此字段";
    		flag = false;
    	}
    	if($("#input2").val() == "") {
    		$("#input2").css('borderColor','red');
    		document.getElementById("hint2").innerHTML = "*请填写此字段";
    		flag = false;
    	} 
    	if($("#input3").val() == "") {
    		$("#input3").css('borderColor','red');
    		document.getElementById("hint3").innerHTML = "*请填写此字段";
    		flag = false;
    	} 
    	if($("#input4").val() == "") {
    		$("#input4").css('borderColor','red');
    		document.getElementById("hint4").innerHTML = "*请填写此字段";
    		flag = false;
    	} 
    	if(flag) {

          var username = $("#input1").val();
       	  var password = $("#input2").val();
   		  var phone = $("#input3").val();
   		  var email = $("#input4").val();
   		
   		  $.ajax({
   	          url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" %>Register",//访问的地址
   	          type:"post",
   	          data:{
   	        	  "username" : username,
   	        	  "password" : password,
   	        	  "phone" : phone,
   	        	  "email" : email,
   	        	  },
   	          dataType:'text',//后台返回的数据格式类型
   	          success:function(data){
   	        	  if(data == "yes") {
                      $("#msg").html("注册成功！");
                      $('#tip').modal('show');
   				} 

                },
   		});
        	  
    	}
    }
</script>
</html>