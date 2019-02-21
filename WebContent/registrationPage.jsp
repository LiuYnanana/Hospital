<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="java.util.*, cn.ly.bean.department, cn.ly.dao.*, cn.ly.bean.*, java.math.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>挂号</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css.map" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css.map" rel="stylesheet">
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
<body class="bootstrap-admin-without-padding" style="background-color:#ECF1F1;">
	<div class="mycenter" style="background-color:#ECF1F1;">

		<form class="form-horizontal" role="form">
		  
			<div class="form-group">
				<label class="col-sm-4 control-label">患者姓名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="username"
						placeholder="请输入患者姓名" id="input1">
				</div>
				<span id="hint1"> </span>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">科室编号</label>
				<div class="col-sm-4">
					<select class="form-control" id="input2">
					<%  hospitalDao dpD = new hospitalDao();
	               List<department> list= new ArrayList<department>();
	               list = dpD.getAllUser();
	               department dp = new department();
	               for(int i = 0; i < list.size();i++) {
						 dp = list.get(i);
	               %>		
				    <option><%out.print(dp.getDepartmentNumber() + "(" + dp.getDepartmentName() + ")");%></option>
				   <%} %>
				  </select>
				</div>
				<span id="hint2"> </span>
			</div>
			<div class="form-group" >
				<label class="col-sm-4 control-label">医生编号</label>
				<div class="col-sm-4">
					<select class="form-control" id="input3">
					<%  hospitalDao dcD = new hospitalDao();
	               List<doctor> list1= new ArrayList<doctor>();
	               list1 = dcD.getAllDoctor();
	               doctor dc = new doctor();
	               for(int i = 0; i < list1.size();i++) {
						 dc = list1.get(i);
	               %>		
				    <option><%out.print(dc.getdoctorNumber() + "(" + dc.getdoctorName() + ")");%></option>
				   <%} %>
				  </select>
				</div>
				<span id="hint3"> </span>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">挂号时间</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="email"
						placeholder="请输入挂号时间" id="input4">
				</div>
				<span id="hint4"> </span>
			</div>

            <div class="form-group">
				<label class="col-sm-4 control-label">挂号费用</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="email"
						placeholder="请输入挂号费用" id="input5">
				</div>
				<span id="hint5"> </span>
			</div>

			<div class="form-group" style="margin-top: 5%">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="button" id="btn1" class="btn btn-default" onclick="nullFunction()">挂号</button>
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
					<a href="userLoad.jsp"	class="btn btn-primary" role="button">确定</a>

				</div>
			</div>
		</div>
	</div>

</body>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script>

    
    function clean() {
    	/*  alert("clean"); */
    	 document.getElementById("hint1").innerHTML = "";
		 document.getElementById("hint5").innerHTML = "";
		 document.getElementById("hint4").innerHTML = "";


    	 $("#input1").css('borderColor',''); //取消css样式	
    	 $("#input4").css('borderColor',''); //取消css样式	
    	 $("#input5").css('borderColor',''); //取消css样式	
    	 
    }
    
    function nullFunction() {
    	clean();
    	var flag = true;
    	if($("#input1").val() == "") {
    		$("#input1").css('borderColor','red');
    		document.getElementById("hint1").innerHTML = "*请填写此字段";
    		flag = false;
    	}
    	if($("#input4").val() == "") {
    		$("#input4").css('borderColor','red');
    		document.getElementById("hint4").innerHTML = "*请填写此字段";
    		flag = false;
    	} 
    	if($("#input5").val() == "") {
    		$("#input5").css('borderColor','red');
    		document.getElementById("hint5").innerHTML = "*请填写此字段";
    		flag = false;
    	} 
    	if(flag) {

          var data1 = $("#input1").val();
       	  var data2 = $("#input2 option:selected").val();
   		  var data3 = $("#input3 option:selected").val();
   		  var data4 = $("#input4").val();
   		  var data5 =  $("#input5").val();
   		
   		  $.ajax({
   	          url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" %>registrationServlet",//访问的地址
   	          type:"post",
   	          data:{
   	        	  "data1" : data1,
   	        	  "data2" : data2,
   	        	  "data3" : data3,
   	        	  "data4" : data4,
   	        	  "data5" : data5
   	        	  },
   	          dataType:'text',//后台返回的数据格式类型
   	          success:function(data){
   	        	  if(data == "yes") {
                      $("#msg").html("挂号成功！点击确定跳回主菜单！");
                      $('#tip').modal('show');
   				} 

                },
   		});
        	  
    	}
    }
</script>
</html>