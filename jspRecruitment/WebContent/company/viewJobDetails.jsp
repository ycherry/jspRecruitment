<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
<title>职位详情</title>
</head>
<body class="container" align="center">
	<div class="row regTitle">
		<font color="red"><strong>详细招聘信息</strong></font>
	</div>
	<%
		DBConn dbc = new DBConn();
		String intId = (String) request.getParameter("intId");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_company_job where id='" + intId + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<table class="table table-bordered  table-responsive table-hover">
		<tr>
			<td nowrap="nowrap" class="td_style">公司名称</td>
			<td><%=rs.getString(4)%></td>
			<td nowrap="nowrap" class="td_style">职位名称</td>
			<td><%=rs.getString(3)%></td>
		</tr>
		<tr>
			<td nowrap="nowrap" class="td_style">招聘人数</td>
			<td><%=rs.getString(5)%></td>
			<td nowrap="nowrap" class="td_style">工作地区</td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<tr>
			<td nowrap="nowrap" class="td_style">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</td>
			<td><%=rs.getString(7)%></td>
			<td nowrap="nowrap" class="td_style">薪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;水</td>
			<td><%=rs.getString(9)%></td>
		</tr>
		<tr>
			<td nowrap="nowrap" class="td_style">发布日期</td>
			<td><%=rs.getString(11)%></td>
			<td nowrap="nowrap" class="td_style">截止日期</td>
			<td><%=rs.getString(12)%></td>
		</tr>
		<tr>
			<td nowrap="nowrap" class="td_style">职位要求</td>
			<td colspan="3"><%=rs.getString(10)%></td>
		</tr>
		<tr>
			<td colspan="4"><a class="btn btn-primary" href="updateJob.jsp?intId=<%=intId%>">&nbsp;&nbsp;&nbsp;&nbsp;编&nbsp;&nbsp;&nbsp;&nbsp;辑&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
		</tr>
	</table>
	
	<%
		}
	%>
</body>
</html>