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
<script type="text/javascript" src="../js/util/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../js/util/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
</head>
<body>
	<form name="jobInterviewForm" id="jobInterviewForm" method="post" action="../JobInterviewServlet"
		target="mainFrame">
		
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>邀请面试</strong></font>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>面试职位:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="position">
						<%
							DBConn con = new DBConn();
							DataBaseOperation dbo = new DataBaseOperation();
							Interview interview=new Interview();
							String strChecked = "checked";
							String companyId = ((Company) request.getSession().getAttribute(
									"company")).getId();
							String companyName = null;
							interview.setCompanyId(companyId);
							interview.setResumeId(request.getParameter("resumeId"));
							interview.setResumeUid(request.getParameter("resumeUid"));
							ResultSet rs = con.getRs("SELECT * FROM t_company_job WHERE cid='"
									+ companyId + "'order by id desc");
							while (rs.next()) {
								interview.setCompanyName(rs.getString(4));
								interview.setJobId(rs.getString(1));
								interview.setJobName(rs.getString(3));
								companyName = rs.getString(4);
								int intId = rs.getInt(1);
								int jobId= rs.getInt(1);
								String selectSql = "select count(*) from t_job_apply where jobId='"
										+ rs.getString(1) + "'";
						%>
						<option><%=rs.getString(3)%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<%
				String selectSql = "select * from t_company where id='" + companyId
						+ "'";
				System.out.println(selectSql);
				ResultSet resultset = con.getRs(selectSql);
				while (resultset.next()) {
			%>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel ">
					<label>企业名称:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="companyName"
						placeholder="请输入您的企业名称（必填）"
						value="<%=companyName == null ? "" : companyName%>">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>联系电话:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="telphone"
						placeholder="请输入您的联系电话（必填）"
						value=<%=resultset.getString(7) == null ? ' ' : resultset
						.getString(7)%>>
				</div>
			</div>
			<%
				}
			%>
			<div class="row updateDiv">
				<div class="col-sm-offset-1 col-sm-3 updateInfoLabel">
					<label>面试时间:</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control" name="interviewTime"
						id="interviewTime" placeholder="请输入有效时间，例如：xxxx-xx-xx（年-月-日）（必填）">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-offset-1 col-sm-3 updateInfoLabel">
					<label>面试地点:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="district"
						id="district">
						<%
							DBConn conn = new DBConn();
							ResultSet districtrs = conn
									.getRs("SELECT name FROM t_city where id between 2 and 35");
							while (districtrs.next()) {
						%>
						<option><%=districtrs.getString(1)%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-offset-1 col-sm-3 updateInfoLabel">
					<label>备注:</label>
				</div>
				<div class="col-sm-6">
					<textarea class="form-control" rows="3" cols="12"
						placeholder="请输入职位要求" name="contents" id="note"></textarea>
				</div>
			</div>
			<%
			session.setAttribute("interview", interview);		
			%>
			<div>
					<button type="submit" name="Submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;邀请面试&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</body>
</html>