<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>修改信息</title>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body >
	<%
		DBConn dbc = new DBConn();
		Company company = (Company) request.getSession().getAttribute("company");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_company where name =" + "'" + company.getName() + "'";
		ResultSet rs = dbc.getRs(sql);
		System.out.println(sql);
		while (rs.next()) {
			System.out.println(rs.getString(3));
	%>
	<form role="form" name="updateCompnyInfoForm" method="post"
		action="reginfo.jsp" novalidate bgcolor="#F5f7f7">
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>企业用户修改注册信息</strong></font>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel ">
					<label>企业名称:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="ctruename"
						placeholder="请输入您的用户名（必填）" required ng-model="ctruename"
						ng-init="ctruename='<%=rs.getString(3)%>'">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>联系电话:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="tel"
						placeholder="请输入您的联系电话（必填）" required ng-model="tel"
						ng-init="tel='<%=rs.getString(4)%>'">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>电子邮件:</label>
				</div>
				<div class="col-sm-6">
					<input type="email" class="form-control" name="email"
						placeholder="请输入您的电子邮件（必填）" required ng-model="email"
						ng-init="email='<%=rs.getString(7)%>'">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>公司性质:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="manage"
						placeholder="请输入您的公司类型（必填）" required ng-model="manage"
						ng-init="manage='<%=rs.getString(5)%>'">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3  updateInfoLabel">
					<label>公司地址:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="address"
						placeholder="请输入您的公司地址（必填）" ng-model="address"
						ng-init="address='<%=rs.getString(6)%>'" required>
				</div>
			</div>
			<div class="row updateDiv">
				<div class=" col-sm-3 updateInfoLabel">
					<label>企业简介:</label>
				</div>
				<div class="col-sm-6">
					<textarea type="text" class="form-control" name="resume"
						placeholder="请介绍一下您的公司吧"><%=rs.getString(8)%></textarea>
				</div>
			</div>
			<div >
				<div>
					<button type="submit" name="Submit" class="btn btn-primary"
						ng-disabled="updateCompnyInfoForm.$invalid">&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<span class="invalid" ng-show="updateCompnyInfoForm.$invalid">请按要求填数据!</span>
				</div>
			</div>
		</div>
	</form>
	<%
		}
	%>
</body>
</html>
