<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">患者就医系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a> -->
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          管理员
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="index.jsp">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="Member_list.jsp">科室信息</a>
          
        </li>
        <li class="layui-nav-item layui-nav-itemed">
            <a class="" href="doctorlist.jsp">医生信息</a>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="medicinallist" href="medicinallist.jsp">药品信息</a>
        </li>
         <li class="layui-nav-item layui-nav-itemed">
          <a class="medicinallist" href="showRegistration.jsp">挂号信息</a>
        </li>
         <li class="layui-nav-item layui-nav-itemed">
          <a class="medicinallist" href="showPatient.jsp">病例信息</a>
        </li>
         <li class="layui-nav-item layui-nav-itemed">
          <a class="medicinallist" href="showPrescription.jsp">药品信息</a>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <!-- <div style="padding: 15px;">内容主体区域</div> -->
  