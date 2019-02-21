<%@ page language="java" import="java.util.*, cn.ly.bean.department, cn.ly.dao.*" contentType="text/html; charset=utf-8"
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

<div class="layui-anim layui-anim-up">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	
		<xblock>
		<a href="member-add.jsp">
		</a>
		
		<span class="x-right" style="line-height: 40px">共有数据：1 条</span> </xblock>
		
		<table class="layui-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>科室名称</th>
					<th>科室介绍</th>
					<th>科室编号</th>
				</tr>
			</thead>
			<tbody>
				   
					  
				<tr>          
                     <% hospitalDao dpD = new hospitalDao();%>
                     <%department dp = new department(); %>
                     <%dp = dpD.getOneDp((String)session.getAttribute("oneDp"));%>
                     <% session.removeAttribute("oneDp");%>
			   	    <td> 1</td> 
			   	   
					<td><%out.print(dp.getDepartmentName()); %>  </td>
					<td><%out.print(dp.getDepartmentDescription());%></td>
					<td><%out.print(dp.getDepartmentNumber());%></td> 

				</tr>
		
			</tbody>
		</table>
		
</div>
   
</body>
</html>
