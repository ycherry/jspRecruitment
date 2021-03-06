<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*,java.util.Date"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css"
	href="../css/style/comapplyJob.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
</head>
<body>
	<%
		DBConn dbc = new DBConn();
		DataBaseOperation dbo = new DataBaseOperation();
		String jobId = (String) request.getParameter("jobId");
		Statement at = dbc.getStmtread();
		int resumeCount = dbo.getRowCount("select count(*) from t_job_apply where jobId='" + jobId + "'");
		String sql = "select * from t_company_job,t_company where t_company.id=t_company_job.cid and t_company_job.id='"
				+ jobId + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<div class="yun_content">
		<div class="comappiy_left_sidebar fl">
			<div class="Company_left_cont">

				<div class="Company_post_name fl">
					<span class="Company_post_name_h1"><%=rs.getString("position") == null ? "暂无" : rs.getString("position")%></span>
				</div>
				<div class="Company_post_qy_name">
					<a href="ViewCompany.jsp?cid=<%=rs.getString("cid")%>"><%=rs.getString("companyName") == null ? "暂无" : rs.getString("companyName")%></a>
				</div>
				<div class="Company_post_State">
					<span class="Company_post_State_s"> <span class="c_Grey">刷新日期：</span><%=rs.getString("addTime") == null ? "暂无" : rs.getString("addTime")%>
					</span> <span class="Company_post_State_s"><span class="c_Grey">有效日期至：</span><%=rs.getString("deadline") == null ? "暂无" : rs.getString("deadline")%></span>
					<span class="Company_post_State_s"><span
						class="Company_post_State_s"><span class="c_Grey">简历投递：</span><span
							class="Orange blod"><%=resumeCount == 0 ? "暂无" : resumeCount%></span></span>
				</div>

				<div class="Company_Basic_information">
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_a"></i>
						<div class="Company_Basic_information_r">
							<span class="c_Grey">月薪：</span> <span
								class="Company_Basic_information_red"><%=rs.getString("salary") == null ? "暂无" : rs.getString("salary")%></span>
						</div>
					</div>
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_b"></i>
						<div class="Company_Basic_information_r">
							<span class="Company_Basic_information_l"><span
								class="c_Grey">经验：</span><%=rs.getString("experience") == null ? "暂无" : rs.getString("experience")%></span>
							<span class="Company_Basic_information_l"> <span
								class="c_Grey">学历：</span><%=rs.getString("education") == null ? "暂无" : rs.getString("education")%>
							</span> <span class="Company_Basic_information_l"> <span
								class="c_Grey">性质：</span><%=rs.getString("nature") == null ? "暂无" : rs.getString("nature")%>
							</span>
						</div>
					</div>
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_c"></i>
						<div class="Company_Basic_information_r">
							<span class="Company_Basic_information_l"> <span
								class="c_Grey">招聘人数：</span><%=rs.getString("amount") == null ? "暂无" : rs.getString("amount")%>
							</span>
						</div>
					</div>
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_d"></i>
						<div class="Company_Basic_information_r">
							<span class="c_Grey">城市：</span><%=rs.getString("district") == null ? "暂无" : rs.getString("district")%></span>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="Company_post_msg">
				<i class="Company_h1_line"></i><span class="Company_co">职位描述</span>
			</div>
			<div class="Company_content fl Company_toggle" id="Company_job_info">
				<div class="Job_Description"><%=rs.getString("contents") == null ? "暂无" : rs.getString("contents")%></div>
			</div>
			<div class="clear"></div>
			<div class="Company_post_msg">
				<i class="Company_h1_line"></i><span class="Company_co">联系方式</span>
			</div>
			<div class="Company_post_touch">
				<div class="Company_post_touch_list">
					<div class="Company_post_touch_list_left">
						<span class="c_Grey">电子邮箱：</span><%=rs.getString("email") == null ? "暂无" : rs.getString("email")%>
					</div>
				</div>


				<div class="Company_post_touch_list">
					<div class="Company_post_touch_list_left">
						<span class="c_Grey">联系手机：</span><%=rs.getString("telphone") == null ? "暂无" : rs.getString("telphone")%></div>
				</div>
				<div class="Company_post_touch_list">
					<span class="c_Grey">公司地址：</span><%=rs.getString("address") == null ? "暂无" : rs.getString("address")%>
				</div>
			</div>
			<div class="Company_post_msg m10">
				<i class="Company_h1_line"></i><span class="Company_co">公司简介</span>
			</div>
			<div class="Company_content fl">
				<div class="Company_Profile"><%=rs.getString("introduction") == null ? "暂无" : rs.getString("introduction")%></div>
				<div class="clear"></div>
			</div>
			<%
				Jobseeker jobseeker = new Jobseeker();
					jobseeker = (Jobseeker) request.getSession().getAttribute("jobseeker");
					Boolean visibilityOfButton = jobseeker.getId() == null ? false : true;
			%>
			<div class="comapply_sq">
				<a id="sq_job"
					href="../ApplyJobServlet?jobId=<%=rs.getString("id")%>&&jobName=<%=rs.getString("position")%>&&companyName=<%=rs.getString("companyName")%>&&companyId=<%=rs.getString("cid")%>"
					class="comapply_sq_submit"
					style="display:<%=visibilityOfButton ? "block" : "none"%>">申请此职位</a>
				<a id="sq_job" href="updateJob.jsp?intId=<%=rs.getString("id")%>"
					class="comapply_sq_submit"
					style="display:<%=visibilityOfButton ? "none" : "block"%>;">编辑</a>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>