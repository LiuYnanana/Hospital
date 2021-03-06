<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="utf-8">
	<title>后台登录-X-admin2.0</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

 
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.css.map" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css.map" rel="stylesheet">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
 
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    
</head>
<%@ include file="dataIndex.jsp" %>
 <div class="x-body layui-anim layui-anim-up">
        <form class="layui-form" action="Member_add">
           
          <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input1" name="departmentdiscription" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" oninput="judgeNull()">
              </div>
              <span id="hint1"></span>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input2" name="dcNumber" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" oninput="judgeOneDp()">
              </div>
              <span id="hint2"></span>
          </div>
          <div class="layui-form-item" >
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品数量
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input3" name="departmentnumber" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input" oninput="judgeNull()">
              </div>
              <span id="hint3"></span>
              <div class="layui-form-mid layui-word-aux">
                
              </div>
          </div>
         <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品价格
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input4" name="departmentdiscription" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" oninput="judgeNull()">
              </div>
              <span id="hint4"></span>
          </div>
             <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品描述
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input5" name="departmentdiscription" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" oninput="judgeNull()">
              </div>
              <span id="hint5"></span>
          </div>
             
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button type="button" class="layui-btn" id="ensure" onclick="nullFunction()">增加</button>

          </div>
      </form>
    </div>
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
					<a href="medicinallist.jsp"	class="btn btn-primary" role="button">确定</a>

				</div>
			</div>
		</div>
	</div> 
  </div>

<script>
function judgeNull() {
	for(var i = 1; i < 6; i++) {
		var s = "#input" + i;
		if($(s).val() != "") $(s).css('borderColor','');  
	}
}

function judgeOneDp() {
	    var mdId= $("#input1").val();

	    if(mdId != "") {
	    	 $("#input1").css('borderColor','');   
	    }
	    $.ajax({
	      url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" %>addMedicinalServlet",//访问的地址
          type:"post",
          data:{
        	  "mdId" : mdId
        	  },
          dataType:'text',//后台返回的数据格式类型
          success:function(data) {
        	  
        	  if(data == "exist") {	
        		  $("#input1").css('borderColor','red');
        		  $("hint1").html("*该药品编号已存在");
        		  for(var i = 2; i < 6; i++) {
        			var s = "#input" + i;
        			$(s).attr("disabled",true);
        		  }
        		
        	  } else {
        		  document.getElementById("hint1").innerHTML = "";
             	  $("#input1").css('borderColor',''); //取消css样式	
             	  for(var i = 2; i < 6; i++) {
         			var s = "#input" + i;
         			$(s).attr("disabled",false);
         		  }
        	  }
         },
	});
}

function clean() {
	 for(var i = 1; i < 6; i++) {
		var s = "hint" + i;
		var s1 = "#input" + i;
		 document.getElementById(s).innerHTML = "";
		 $(s).css('borderColor',''); //取消css样式	
	 } 
}

function nullFunction() {
	clean();
	var flag = true;
	
	for(var i = 1; i < 6; i++) {
		var s = "#input" + i;
		var s1 = "hint" + i;
		if($(s).val() == "") {
			$(s).css('borderColor','red');
			document.getElementById(s1).innerHTML = "*请填写此字段";
			flag = false;
		}
	}
	
	if(flag) {
         var mdId = $("#input1").val();
   	     var mdName = $("#input2").val();
		 var mdNumber = $("#input3").val();
		 var mdPrice = $("#input4").val();
		 var mdDescription = $("#input5").val();
	
		  $.ajax({
	          url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" %>addMedicinalServlet",//访问的地址
	          type:"post",
	          data:{
	        	  "mdId" : mdId,
	        	  "mdName" : mdName, 
	        	  "mdNumber" : mdNumber, 
	        	  "mdPrice" : mdPrice,
	        	  "mdDescription" : mdDescription
	        	  },
	          dataType:'text',//后台返回的数据格式类型
	          success:function(data){

	        	  if(data == "yes") {
	        		  
                  $("#msg").html("添加成功！");
                  $('#tip').modal('show');
				} 

            },
		});
    	  
	}
}
	
</script>
</body>
</html>