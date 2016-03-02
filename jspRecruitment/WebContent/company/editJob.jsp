<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="jsprecruitment.util.*,jsprecruitment.entity.*"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript" src="../Js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../Js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../Js/util/jquery.validate-1.13.1.js"></script>

<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link href="../css/left.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0px">
	<div class="row regTitle">
		<font color="red"><strong>编辑求职信息</strong></font>
	</div>
	<table class="table table-bordered  table-responsive table-hover">
		<thead>
			<tr>
				<th>所求职位</th>
				<th>发布时间</th>
				<th>有效时间</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>
		</thead>
		<%
			DBConn con = new DBConn();
			String strChecked = "checked";
			String userName = ((Company)request.getSession().getAttribute("company")).getUserName();
//			String sql="select id "
            String companyName=null;
			ResultSet rs = con.getRs("SELECT * FROM t_company_job WHERE userName='" + companyName + "'");
			while (rs.next()) {
				int intId = rs.getInt(1);
		%>
		<tbody>
			<tr>
				<td><a href="viewDetails.jsp?intId=<%=intId%>"><%=rs.getString(4)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><a href="updateJob.jsp?intId=<%=intId%>">编辑</a></td>
				<td><a href="delJobDo.jsp?intId=<%=intId%>">删除</a></td>
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