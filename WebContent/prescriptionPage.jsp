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
				<label class="col-sm-4 control-label">药品名称</label>
				<div class="col-sm-4">
					<select class="form-control" id="input1">	
	               <%  hospitalDao mdD = new hospitalDao();
	                List<medicinal> list= new ArrayList<medicinal>();
	             medicinal md = new medicinal();
	            list = mdD.getAllMedicinal();
	            for(int i = 0; i < list.size();i++) {
					 md = list.get(i);
	             %>	
				    <option><%out.print(md.getMedicinalId() + "(" + md.getMedicinalName() + ")");%></option>
				   <%} %>
				  </select>
				</div>
				<span id="hint1"> </span>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">药品数量</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="username"
						placeholder="请输入药品数量" id="input2">
				</div>
				<span id="hint2"> </span>
			</div>
			

			<div class="form-group" style="margin-top: 5%">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="button" id="btn1" class="btn btn-default" onclick="nullFunction()">拿药</button>
				</div>
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
    	 document.getElementById("hint2").innerHTML = "";
    	 $("#input2").css('borderColor',''); //取消css样式	
    	 
    }
    
    function nullFunction() {
    	clean();
    	var flag = true;
    	if($("#input2").val() == "") {
    		$("#input2").css('borderColor','red');
    		document.getElementById("hint1").innerHTML = "*请填写此字段";
    		flag = false;
    	}
    	
    	if(flag) {

          var data2 = $("#input2").val();
       	  var data1 = $("#input1 option:selected").val();

   		  $.ajax({
   	          url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" %>PrescriptionServlet",//访问的地址
   	          type:"post",
   	          data:{
   	        	  "data1" : data1,
   	        	  "data2" : data2
   	        	  },
   	          dataType:'text',//后台返回的数据格式类型
   	          success:function(data){
   	        	  if(data == "yes") {
                      $("#msg").html("拿药成功！点击确定跳回主菜单！");
                      $('#tip').modal('show');
   				} 

                },
   		});
        	  
    	}
    }
</script>
</html>