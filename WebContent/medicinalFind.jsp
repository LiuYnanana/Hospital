<%@ page language="java" import="java.util.*, cn.ly.bean.*, cn.ly.dao.*" contentType="text/html; charset=utf-8"
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
		<a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	
		<xblock>
		<span class="x-right" style="line-height: 40px">共有数据：1 条</span> </xblock>
		
		<table class="layui-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>药品编号</th>
					<th>药品名称</th>
					<th>药品数量</th>
					<th>药品价格</th>
					<th>药品描述</th>
				</tr>
			</thead>
			<tbody>
				   
					  
				<tr>          
                     <% hospitalDao mdD = new hospitalDao();%>
                     <%medicinal md = new medicinal(); %>
                     <%md = mdD.getOnemd((String)session.getAttribute("onemd"));%>
                     <% session.removeAttribute("onemd");%>
			   	    <td> 1</td> 
			   	   
					<td><%out.print(md.getMedicinalId());%></td>
					<td><%out.print(md.getMedicinalName());%></td>
					<td><%out.print(md.getMedicinalNumber());%></td>
					<td><%out.print(md.getMedicinalPrice());%></td>
					<td><%out.print(md.getMedicinalDescription());%></td>

				</tr>
		
			</tbody>
		</table>
		
</div>
   
</body>
</html>
