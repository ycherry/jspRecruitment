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
	<%
		System.out.println("Referer : " + request.getHeader("Referer"));
		String header = request.getHeader("Referer");
		String[] path = header.split("\\?");
		String resourcePage = path[0].substring(21);
		System.out.println("path:" + path[0]);
		System.out.println("resourcePage:" + resourcePage);
	%>
	<form name="jobInterviewForm" id="jobInterviewForm" method="post"
		action="../JobInterviewServlet?resourcePage=<%=resourcePage%>"
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

					<%
						String jobName = Encode.getNewString(request.getParameter("jobName"));
						DBConn con = new DBConn();
						DataBaseOperation dbo = new DataBaseOperation();
						Interview interview = new Interview();
						String strChecked = "checked";
						String companyId = ((Company) request.getSession().getAttribute("company")).getId();
						String companyName = null;
						interview.setCompanyId(companyId);
						interview.setResumeId(request.getParameter("resumeId"));
						interview.setResumeUid(request.getParameter("resumeUid"));

						if (jobName != null) {
					%>
					<select class="form-control selectpicker" name="position">
						<option><%=jobName%></option>
						<%
							}
							ResultSet rs = con.getRs("SELECT * FROM t_company_job WHERE cid='" + companyId + "'order by id desc");
							while (rs.next()) {
								companyName = rs.getObject("companyName").toString();
								int intId = Integer.parseInt(rs.getObject("id").toString());
								int jobId = Integer.parseInt(rs.getObject("id").toString());
								String selectSql = "select count(*) from t_job_apply where jobId='" + rs.getObject("id") + "'";
						%>
						<option><%=rs.getObject("position")%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<%
				String selectSql = "select * from t_company where id='" + companyId + "'";
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
						value=<%=resultset.getObject("telphone").toString() == null ? ' ' : resultset.getObject("telphone").toString()%>>
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
							ResultSet districtrs = conn.getRs("SELECT name FROM t_city where id between 2 and 35");
							while (districtrs.next()) {
						%>
						<option><%=districtrs.getObject("name").toString()%></option>
						<%
							}
							conn.close();
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
						placeholder="请输入职位要求" name="note" id="note"></textarea>
				</div>
			</div>
			<%
				session.setAttribute("interview", interview);
			%>
			<div>
				<button type="submit" name="Submit" class="btn btn-primary">邀请面试</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			jQuery.validator.addMethod("isPosition", function(value,element) {
			
				if (value == "全部职位") {
					alert("相等");
					return true;
				} else {
					alert("不相等");
					return false;    
				}
			}, "请选择一个职位！");
			$("#jobInterviewForm").validate({
				rules : {
					position : {
						required : true,
						isPosition : true
					},
					interviewTime : {
						required : true,
						date : true
					}
				},
				messages : {
					position : {
						required : "请选择一个职位！",
						isPosition : "请选择一个职位！"
					},
					interviewTime : {
						required : "面试时间不能为空！",
						date : "请输入正确的日期格式!"
					}
				}
			});
		});
	</script>
</body>
</html>