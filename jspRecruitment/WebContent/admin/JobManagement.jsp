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
<title>职位管理</title>
<style type="text/css">
body {
	background: #FFF;
}
</style>
</head>
<body class="admin_body_font">
	<%
		DBConn dbc = new DBConn();
		String selectJobSql = "select * from t_company_job";
		ResultSet rs = dbc.getRs(selectJobSql);
	%>
	<div class="admin_Filter">
		<span class="complay_top_span">职位管理</span>
	</div>
	<div class="clear"></div>

	<div class="table_list">
		<div class="admin_table_border">
			<table width="100%">
				<thead>
					<tr class="admin_table_top">
						<th>职位ID</th>
						<th>职位名称</th>
						<th>公司名称</th>
						<th>学历要求</th>
						<th>工作经验</th>
						<th>薪&nbsp;&nbsp;水</th>
						<th>更新时间</th>
						<th class="admin_table_th_bg">操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (rs.next()) {
					%>

					<tr>
						<td><a class="a_style"
							href="<%=request.getContextPath()%>/company/ViewJob.jsp?jobId=<%=rs.getString("id")%>"><%=rs.getString("id") == null ? "未填" : rs
						.getString("id")%></a></td>
						<td><a class="a_style"
							href="<%=request.getContextPath()%>/company/ViewJob.jsp?jobId=<%=rs.getString("id")%>"><%=rs.getString("position") == null ? "未填" : rs
						.getString("position")%></a></td>
						<td><a class="a_style"
							href="<%=request.getContextPath()%>/company/ViewCompany.jsp?cid=<%=rs.getString("cid")%>"><%=rs.getString("companyName") == null ? "未填" : rs
						.getString("companyName")%></a></td>
						<td><%=rs.getString("education") == null ? "未填" : rs
						.getString("education")%></td>
						<td><%=rs.getString("experience") == null ? "未填" : rs
						.getString("experience")%></td>
						<td><%=rs.getString("salary") == null ? "未填" : rs
						.getString("salary")%></td>
						<td><%=rs.getString("addTime") == null ? "未填" : rs
						.getString("addTime")%></td>
						<td><a class="a_style" href="javascript:void(0)"
							onclick="deleteJob(<%=rs.getString("id")%>)">删除</a></td>
					</tr>
					<%
						}
					%>
				</tbody>

			</table>
		</div>
	</div>
	<script type="text/javascript">	
   function deleteJob(jobId){
	if(confirm("删除后数据不能恢复，包括简历信息，企业招聘信息，求职信息 ，确定删除？")){
		console.log("确认删除!");
		window.location.href="../AdminDeleteJobServlet?jobId='"+jobId+"'";
	}else{
		console.log("取消删除!");
	}
   }
</script>
</body>

</html>