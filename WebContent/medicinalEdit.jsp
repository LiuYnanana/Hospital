
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
        <form class="layui-form" action="editmedicinalServlet">
          
        <% hospitalDao mdD = new hospitalDao();%>
        <%medicinal md = new medicinal(); %>
        <%md = mdD.getOnemd((String)request.getParameter("editId"));%>
    
          <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input1" name="mdId" readonly="readonly" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=md.getMedicinalId()%>">
              </div>
              <span id="hint1"></span>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input2" name="mdName" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=md.getMedicinalName()%>">
              </div>
              <span id="hint2"></span>
          </div>
          <div class="layui-form-item" >
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品数量
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input3" name="mdNumber" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input" value="<%=md.getMedicinalNumber()%>">
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
                  <input type="text" id="input4" name="mdPrice" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=md.getMedicinalPrice()%>">
              </div>
              <span id="hint4"></span>
          </div>
             <div class="layui-form-item">
              <label class="layui-form-label" style="padding:9px">
                  <span class="x-red">*</span>药品描述
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="input5" name="mdDescription" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input" value="<%=md.getMedicinalDescription()%>">
              </div>
              <span id="hint5"></span>
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