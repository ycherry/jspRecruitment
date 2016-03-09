<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="jsprecruitment.util.*,jsprecruitment.entity.*"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
</head>
<body class="container" align="center">
	<div class="row regTitle">
		<font color="red"><strong>全部招聘信息</strong></font>
	</div>
	<table class="table table-bordered  table-responsive table-hover">
		<thead>
			<tr>
				<th>所求职位</th>
				<th>发布时间</th>
				<th>有效时间</th>
				<th>求职人数</th>
				<th>预览</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>
		</thead>
		<%
			DBConn con = new DBConn();
		    DataBaseOperation dbo= new DataBaseOperation();
			String strChecked = "checked";
			int companyId = ((Company) request.getSession().getAttribute(
					"company")).getId();
			//			String sql="select id "
			String companyName = null;
			ResultSet rs = con.getRs("SELECT * FROM t_company_job WHERE cid='"
					+ companyId + "'order by id desc");
			while (rs.next()) {
				int intId = rs.getInt(1);
				String selectSql="select * from t_job_apply where jobId='"+rs.getString(1)+"'";
		%>
		<tbody>
			<tr>
				<td><a href="viewDetails.jsp?intId=<%=intId%>"><%=rs.getString(3)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=rs.getString(12)%></td>
				<td><%=dbo.getRowCount(selectSql) %></td>
				<td><a href="viewJobDetails.jsp?intId=<%=intId %>">预览</a></td>
				<td><a href="updateJob.jsp?intId=<%=intId%>">编辑</a></td>
				<td><a href=" ../DeleteJobServlet?intId=<%=intId%>">删除</a></td>
			</tr>
		</tbody>
		<%
			}
		%>
	</table>
	<!--  <table width="100%" heigth="500" border="0" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td height="20">&nbsp;</td>
		</tr>
		<tr>
			<td align="left" valign="top"><table width="692" border="0"
					align="left" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
					<tr align=center">
						<td height="27" colspan="4"><div id="reg">
								<font color=red> 删除求职信息</font>
								<div></td>
					</tr>
					<tr>
						<td width="153" height="22" align="center">所求职位</td>
						<td width="165" align="center">发布时间</td>
						<td width="219" align="center">有效时间</td>
						<td width="155" align="center">编辑</td>
						<td width="155" align="center">删除</td>
					</tr>

					<tr>
						
					</tr>

				</table></td>
		</tr>
	</table>
	-->
</body>
</html>