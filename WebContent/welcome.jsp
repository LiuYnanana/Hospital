<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!--<meta charset="ISO-8859-1">  -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>患者就医系统</title>

    <!-- Bootstrap core CSS -->
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="cover.css" rel="stylesheet">
	
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
	<script src="./bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
		.mycenter
        {
            margin-top: 100px;
            margin-left: auto;
            margin-right: auto;
            height: 380px;
            width: 500px;
            padding: 5%;
            padding-left: 5%;
            padding-right: 5%;
            background:white;
            border-radius:10px;
        }
        .mycenter mysign
        {
            width: 440px;
        }
        .mycenter input, checkbox, button
        {
            margin-top: 2%;
            margin-left: 10%;
            margin-right: 10%;
        }
        .mycheckbox
        {
            margin-top: 10px;
            margin-left: 37%;
            margin-bottom: 10px;
            height: 10px;
        }    
    </style>
</head>
<body>
 <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          

          <div class="inner cover">
            <h1 class="cover-heading">欢迎进入患者就医系统</h1>
            
          </div>

          <div class="mastfoot">
            <div class="inner">
              <p>Cover template for <a href="http://getbootstrap.com">Bootstrap</a>, by <a href="https://twitter.com/mdo">@LY</a>.</p>
            </div>
          </div>

        </div>

      </div>

    </div>
   <!--  <div class="modal fade" id="login">
    
    <div class="mycenter">
        <div class="mysign">
            <div class="col-lg-11 text-center">
                <h2 style="color:black">  登录</h2>
            </div>
            <form action="Login">
            <div class="col-lg-10">
                <input type="text" class="form-control" id="input1" name="username" placeholder="请输入账户名" required
                    autofocus />
            </div>
            <div class="col-lg-10">
                <input type="password" class="form-control" id="input2" name="password" placeholder="请输入密码" required
                    autofocus />
            </div>
            <div class="col-lg-10"  style="margin-left:29px;margin-top:5px;">
            <div  style="display:none;margin-bottom:8px" class="alert alert-danger" role="alert" id="msg"></div>
            </div>
            
            <div class="col-lg-10">
                <button type="button" id="btn1" class="btn btn-success col-lg-12"> 登录</button>
            </div>
            
             <div class="col-lg-10">
             <a href="Register.jsp">
               <button type="button" id="btn2" class="btn btn-success col-lg-12"> 注册</button>
               </a>
            </div>
            </form>
        </div>
    </div>

    </div> -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <!-- <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>  -->
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <script>
$(document).ready(function(){
  $("#btn1").click(function(){
	  var username = $("#input1").val();
	  var password = $("#input2").val();
	  $.ajax({
		  
          url:"http://localhost:8080/test1/Login",//访问的地址
          type:"post",
          data:{
        	  "username" : username,
        	  "password" : password,
        	  },
          dataType:'text',//后台返回的数据格式类型
          success:function(data){
        	  if(data == "yes") {
        		  window.location.href="http://localhost:8080/test1/Register.jsp";
        	  }
        	  else {
        		  $("#msg").show();
        		  $("#msg").html("用户名密码错误！");
        	  }
      }
  });
});
});
</script>
</body>
</html>