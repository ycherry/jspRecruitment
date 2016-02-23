<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsprecruitment.util.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改招聘信息</title>
<script type="text/javascript" src="../Js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../Js/util/bootstrap.js"></script>
<script type="text/javascript" src="../Js/util/angular.js"></script>
<script type="text/javascript"
	src="../Js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../Js/company/reg.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/common.css">
</head>
<body>
	<%
		DBConn dbc = new DBConn();
		String intId = (String) request.getParameter("intId");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_pubjob where id='" + intId + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<form role="form" name="updateJobInfoForm" method="post"
		id="updateJobInfoForm" action="updateJobDo.jsp?intId=<%=intId%>"
		novalidate bgcolor="#F5f7f7">
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>修改招聘信息</strong></font>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>行业名称:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="specialty"
						id="specialty" placeholder="请输入行业名称（必填）"
						value="<%=rs.getString(3)%>">
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>职位名称:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="jobName" id="jobName"
						placeholder="请输入职位名称（必填）" value="<%=rs.getString(4)%>">
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>学历:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="education"
						id="education" placeholder="请输入学历（必填）"
						value="<%=rs.getString(5)%>">
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>薪水:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="salary" id="salary"
						placeholder="请输入薪水（必填）" value="<%=rs.getString(6)%>">
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>截至日期:</label>
				</div>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="endTime" id="endTime"
						placeholder="请输入截止日期（必填）" value="<%=rs.getString(8)%>">
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-1 ">
					<label>职位要求:</label>
				</div>
				<div class="col-sm-1">
					<textarea class="form-control" name="atime" id="atime"
						placeholder="请输入描述一下职位要求" rows="6" cols="4"><%=rs.getString(9)%></textarea>
				</div>
			</div>
			<div>
				<div>
					<button type="submit" name="Submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</form>
	<%
		}
	%>
	<script type="text/javascript">
		$(document).ready(function() {
			console.log("已调用！");
			$("#updateJobInfoForm").validate({
				rules : {
					specialty : {
						required : true
					},
					jobName : {
						required : true
					},
					education : {
						required : true
					},
					salary : {
						required : true
					},
					atime : {
						required : true
					}
				},
				messages : {
					specialty : {
						required : " 行业名称不能为空！"
					},
					jobName : {
						required : " 职业名称不能为空！"
					},
					education : {
						required : " 学历不能为空！ "
					},
					salary : {
						required : "薪水不能为空！ "
					},
					atime : {
						required : "截至日期不能为空!"
					}
				}
			});
		});
	</script>
</body>
</html>