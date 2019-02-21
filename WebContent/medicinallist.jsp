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
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" action="MemberFind">
				<input class="layui-input" placeholder="请输入药品编号" name="departmentId"
					id="input1">
				<button type="button" id="btn1" class="layui-btn" lay-submit=""
					lay-filter="sreach">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<xblock> <a href="medicinalAdd.jsp"><button
				class="layui-btn">
				<i class="layui-icon"></i>添加
			</button> </a> 
	<%  hospitalDao mdD = new hospitalDao();
	   List<medicinal> list= new ArrayList<medicinal>();
	   medicinal md = new medicinal();
	   list = mdD.getAllMedicinal();
	%>			
 <span class="x-right"
			style="line-height: 40px">共有数据：<%
 	out.print(mdD.getAllMedicinal().size());
 %>
			条
		</span> </xblock>

		<table class="layui-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>药品编号</th>
					<th>药品名称</th>
					<th>药品数量</th>
					<th>药品价格</th>
					<th>药品描述</th>

					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<%
					int cnt = 0;
			    	Paging now_page = new Paging();
			        now_page = (Paging)request.getAttribute("paging"); 
			        
			        session.setAttribute("flag1", "false");
			        session.setAttribute("flag2", "false");
			        session.setAttribute("flag3", "true");
				    if(now_page == null)  {
				    	/* System.out.println("null"); */
				    	cnt = 0;
				    	for(int i = 0; i < (list.size() < 5 ? list.size() : 5); i++) {
				    		 md = list.get(i);
				  %>
	    		 <tr>
					<% cnt++;%>
					<td><%out.print(cnt);%></td>
					<td><%out.print(md.getMedicinalId());%></td>
					<td><%out.print(md.getMedicinalName());%></td>
					<td><%out.print(md.getMedicinalNumber());%></td>
					<td><%out.print(md.getMedicinalPrice());%></td>
					<td><%out.print(md.getMedicinalDescription());%></td>
					
					<td class="td-manage">
						<button class="layui-btn layui-btn-sm" onclick="deleteTip('<%=md.getMedicinalId()%>')">删除</button> 
						<a href="medicinalEdit.jsp?editId=<%=md.getMedicinalId()%>">
							<button class="layui-btn layui-btn-sm">编辑</button> </a>
				   </td>
				</tr>
				<%}%>
				<%}  else {%>
				
				<%
				 int end = now_page.getPage() * now_page.getPagesize() < now_page.getCount() ? now_page.getPage() * now_page.getPagesize() : now_page.getCount();
				 System.out.println("end" + end);
				 System.out.println(now_page.getCount());
				 for(int i = (now_page.getPage() - 1) * now_page.getPagesize(); i < end;i++) {
					 md = list.get(i);
				%>

				<tr>
					<% cnt++;%>
					<td><%out.print(cnt);%></td>
					<td><%out.print(md.getMedicinalId());%></td>
					<td><%out.print(md.getMedicinalName());%></td>
					<td><%out.print(md.getMedicinalNumber());%></td>
					<td><%out.print(md.getMedicinalPrice());%></td>
					<td><%out.print(md.getMedicinalDescription());%></td>


					<td class="td-manage">
						<button class="layui-btn layui-btn-sm" onclick="deleteTip('<%=md.getMedicinalId()%>')">删除</button> 
						<a href="medicinalEdit.jsp?editId=<%=md.getMedicinalId()%>">
							<button class="layui-btn layui-btn-sm">编辑</button> </a>
				   </td>
				</tr>
				<%}%>
				<%}%>
			</tbody>
		</table>
         
		<div class="page">
			<div>
			   
              <%
                  int Page = now_page == null ? 1 : now_page.getPage();
                  int count = list.size() % 5 == 0 ? list.size() / 5 : list.size() / 5 + 1; 
                  int Pagenumber = now_page == null ? count : now_page.getPagenumber();
              %>
              
				<a class="prev" href="ChangePage?page=<%=Page - 1%>&&pos=medicinallist.jsp">&lt;&lt;</a> 
				<a class="num" href="ChangePage?page=1&&pos=medicinallist.jsp">首页</a>
				  <strong>第<%out.print(Page);%>页/共<%out.print(Pagenumber);%>页</strong>
				<a class="num" href="ChangePage?page=<%=Pagenumber%>&&pos=medicinallist.jsp">尾页</a> 
			    <a class="next" href="ChangePage?page=<%=Pagenumber%>&&pos=medicinallist.jsp">&gt;&gt;</a>
			</div>
		</div>
	</div>
</div>
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
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="btn2">确定</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
	  $("#btn1").click(function(){
		  var medicinalId= $("#input1").val();
		  $.ajax({
	          url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/"%>findMedicinalServlet",//访问的地址
	          type:"post",
	          data:{
	        	   "medicinalId" : medicinalId,
	        	  },
	          dataType:'text',//后台返回的数据格式类型
	          success:function(data){
	        	  if(data == "yes") {
	        		  window.location.href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/"%>medicinalFind.jsp";
	        	  }
	        	  else {
	        		  $("#msg").html("无此药品信息！");
                      $('#tip').modal('show');
	        	  }
	      }
	  });
	});
	});
	
 	function deleteTip(name) {
 		if(confirm("确定删除吗？")) {
			  $.ajax({
		          url:"<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/"%>delMedicinalServlet",//访问的地址
		          type:"post",
		          data:{
		        	   "medicinalId" : name,
		        	  },
		          dataType:'text',//后台返回的数据格式类型
		          success:function(data){
		        	   if(data == "true") {
		        		  $("#msg").html("删除成功！");
	                      $('#tip').modal('show');
	                      $("#btn2").click(function(){
	                    	window.location.href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/"%>medicinallist.jsp";
	                     });
	                  }
		        	  else {
		        		  $("#msg").html("无法删除！");
	                      $('#tip').modal('show');
		        	  } 
		      }
		  });
		}
	}
</script>
</body>
</html>
