<%@ page language="java"
	import="java.util.*, cn.ly.bean.department, cn.ly.dao.*, cn.ly.bean.*, java.math.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<title>后台登录-X-admin2.0</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,taptet-densitydpi=low-dpi" />
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

<%@ include file="dataIndex.jsp"%>
<div class="layui-anim layui-anim-up">
	<%  userDao ptD = new userDao();
	   List<patient> list= new ArrayList<patient>();
	   patient pt = new patient();
	   list = ptD.getAllPatient();
	%>			
 <span class="x-right"
			style="line-height: 40px">共有数据：<%
 	out.print(list.size());
 %>
			条
		</span> </xblock>

		<table class="layui-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>患者姓名</th>
					<th>患者性别</th>
					<th>患者编号</th>
					<th>患者药品</th>
					<th>就诊时间</th>
					<th>就诊医生编号</th>

				</tr>
			</thead>
			<tbody>
				<%
					int cnt = 0;
				    	for(int i = 0; i < list.size(); i++) {
				    		pt = list.get(i);
				  %>
	    		 <tr>
					<% cnt++;%>
					<td><%out.print(cnt);%></td>
					<td><%out.print(pt.getPatientName());%></td>
					<td><%out.print(pt.getPatientSex());%></td>
					<td><%out.print(pt.getPatientDescription());%></td>
					<td><%out.print(pt.getMedicinal());%></td>
					<td><%out.print(pt.getTime());%></td>
					<td><%out.print(pt.getDoctorNumber());%></td>
				</tr>
				<%}%>
			</tbody>
				
		</table>

	</div>
</div>
</div>
</div>

</body>
</html>
