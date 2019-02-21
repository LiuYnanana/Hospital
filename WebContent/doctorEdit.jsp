
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*, cn.ly.bean.*, cn.ly.dao.*"
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

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<%@ include file="dataIndex.jsp" %>
 <div class="x-body layui-anim layui-anim-up">
        <form class="layui-form" action="editDoctorServlet">
          
        <% hospitalDao dcD = new hospitalDao();%>
        <%doctor dc = new doctor(); %>
        <%dc = dcD.getOneDc((String)request.getParameter("editNumber"));%>
    
	     <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input1" name="dcNumber" readonly="readonly" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorNumber()%>">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input2" name="dcName" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorName()%>">
              </div>
              <span id="hint2"></span>
          </div>
          
          <div class="layui-form-item" >
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生性别
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input3" name="dcSex" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorSex()%>">
              </div>
              <span id="hint3"></span>
              <div class="layui-form-mid layui-word-aux">
                
              </div>
          </div>
          
         <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生年龄
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input4" name="dcAge" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorAge()%>">
              </div>
              <span id="hint4"></span>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生出生日期
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input5" name="dcBirthday" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorBirthday()%>">
              </div>
              <span id="hint5"></span>
          </div>
          
             <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生婚姻状况
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input6" name="dcMarriage" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorMarriage()%>">
              </div>
              <span id="hint6"></span>
          </div>
          
             <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生学历
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input7" name="dcEducation" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorEducation()%>">
              </div>
              <span id="hint7"></span>
          </div>
          
             <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>医生职业
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input8" name="dcCareer" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getdoctorCareer()%>">
              </div>
              <span id="hint8"></span>
          </div>
        
          <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>是否为专家
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input9" name="dcExpert" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dc.getExpert()%>">
              </div>
              <span id="hint9"></span>
          </div>
         
        
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              
              <button type="submit" class="layui-btn">更新</button>
          </div>
      </form>
    </div>
</body>
</html>					