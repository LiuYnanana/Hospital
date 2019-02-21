
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*, cn.ly.bean.department, cn.ly.dao.*"
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
        <form class="layui-form" action="MemberEdit">
          
         <% hospitalDao dpD = new hospitalDao();%>
         <%department dp = new department(); %>
         <%dp = dpD.getOneDp((String)request.getParameter("editName"));%>
			
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>科室名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_username" name="departmentname" readonly="readonly" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dp.getDepartmentName()%>">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>科室编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_pass" name="departmentnumber" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input" value="<%=dp.getDepartmentNumber()%>">
              </div>
              <div class="layui-form-mid layui-word-aux">
                
              </div>
          </div>
         <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>科室介绍
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_username" name="departmentdiscription" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=dp.getDepartmentDescription()%>">
              </div>
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