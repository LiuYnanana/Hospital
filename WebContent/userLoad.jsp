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
</head>
<body>
 <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">

          <div class="masthead clearfix" style="width=100%">
            <div class="inner">
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a href="#">简介</a></li>
                  <li><a href="#">挂号</a></li>
                  <li><a href="#">就医</a></li>
                  <li><a href="#">拿药</a></li>
                  <li><a href="index.jsp">退出</a></li>
                </ul>
              </nav>
            </div>
          </div>

       <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
          <h2>挂号</h2>
          <p>用户可以通过此功能自动生成挂号单</p>
          <p><a class="btn btn-default" href="registrationPage.jsp" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
          <h2>就医</h2>
          <p>用户可以通过此功能自动生成病例单</p>
          <p><a class="btn btn-default" href="patientPage.jsp" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
          <h2>拿药</h2>
          <p>用户可以通过此功能自动生成药品单</p>
          <p><a class="btn btn-default" href="prescriptionPage.jsp" role="button">查看详情 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
      
          <div class="mastfoot">
            <div class="inner">
              <p>Cover template for <a href="http://getbootstrap.com">Bootstrap</a>, by <a href="https://twitter.com/mdo">@LY</a>.</p>
            </div>
          </div>

        </div>

      </div>

    </div>
    
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> 
    <script src="js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>