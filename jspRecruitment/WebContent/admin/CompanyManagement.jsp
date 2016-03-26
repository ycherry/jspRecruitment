<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="../css/style/admin/admin.css">
<title>企业基本信息管理</title>
<style type="text/css">
body {
	background: #FFF;
}
</style>
</head>
<body class="admin_body_font">
	<%
		DBConn dbc = new DBConn();
		String selectResumeSql = "select * from t_company";
		ResultSet rs = dbc.getRs(selectResumeSql);
	%>
	<div class="admin_Filter">
		<span class="complay_top_span">企业基本信息管理</span>
	</div>
	<div class="clear"></div>

	<div class="table_list">
		<div class="admin_table_border">
			<table width="100%">
				<thead>
					<tr class="admin_table_top">
						<th>企业ID</th>
						<th>企业名称</th>
						<th>用户名</th>
						<th>企业性质</th>
						<th>所属行业</th>
						<th>企业规模</th>
						<th class="admin_table_th_bg">操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (rs.next()) {
					%>

					<tr>
						<td><a class="a_style"
							href="<%=request.getContextPath()%>/company/ViewCompany.jsp?cid=<%=rs.getObject("id")%>"><%=rs.getObject("id") == null ? "未填" : rs
						.getObject("id")%></a></td>
						<td><a class="a_style"
							href="<%=request.getContextPath()%>/company/ViewCompany.jsp?cid=<%=rs.getObject("id")%>"><%=rs.getObject("companyName") == null ? "未填" : rs
						.getObject("companyName")%></a></td>
						<td><%=rs.getObject("userName") == null ? "未填" : rs
						.getObject("userName")%></td>
						<td><%=rs.getObject("nature") == null ? "未填" : rs
						.getObject("nature")%></td>
						<td><%=rs.getObject("industry") == null ? "未填" : rs
						.getObject("industry")%></td>
						<td><%=rs.getObject("scale") == null ? "未填" : rs
						.getObject("scale")%></td>
						<td><a class="a_style" href="javascript:void(0)"
							onclick="deleteJobseeker(<%=rs.getObject("id")%>,<%=rs.getObject("userId")%>)">删除</a></td>
					</tr>
					<%
						}
					%>
				</tbody>

			</table>
		</div>
	</div>
	<script type="text/javascript">	
   function deleteJobseeker(resumeId,userId){
	if(confirm("删除后数据不能恢复，包括简历信息，企业招聘信息，求职信息 ，确定删除？")){
		console.log("确认删除!");
		window.location.href="../DeleteJobseekerServlet?resumeId='"+resumeId+"'&&userId='"+userId+"'";
	}else{
		console.log("取消删除!");
	}
   }
</script>
</body>

</html>