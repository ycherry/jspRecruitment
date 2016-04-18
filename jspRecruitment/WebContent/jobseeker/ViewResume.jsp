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
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/Resume.css">
</head>
<body>
	<%
		DBConn dbc = new DBConn();
		Date date = new Date();
		int year = date.getYear();
		String resumeId = (String) request.getParameter("resumeId");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_resume where id='" + resumeId + "'";
		System.out.println("view resume:"+sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<div class="resume_box">
		<div class="resume_content">
			<div class="resume_content_top_box">
				<div class="resume_content_left">
					<div class="resume_content_name">
						<span class="resume_content_name_s"><%=rs.getString("fullName")==null?"暂无":rs.getString("fullName")%></span>(<%=rs.getString("gender")== null?"暂无":rs.getString("gender")%>,<%=rs.getDate("updateTime")==null?"暂无":(year - rs.getDate("birthday").getYear())%>岁)
					</div>
					<span class="resume_content_msg_c" style="width: 140px;"> <span
						class="resume_content_msg_span">学历：</span><%=rs.getString("education") == null ? "未知" : rs.getString("education")%>
					</span> <span class="resume_content_msg_c"> <span
						class="resume_content_msg_span">经验：</span><%=rs.getString("experience") == null ? "未知" : rs.getString("experience")%>
					</span> <span class="resume_content_msg_c"> </span> <span
						class="resume_content_msg_c"
						style="width: 200px; height: 28px; overflow: hidden"> <span
						class="resume_content_msg_span">所在地：</span><%=rs.getString("address") == null ? "未知" : rs.getString("address")%>

					</span> <span class="resume_content_msg_c" style="width: 140px;"> </span>
					<span class="resume_content_msg_c"> </span> <span
						class="resume_content_msg_c"> </span> <span
						class="resume_content_msg_c"> </span>
					<div style="width: 100%;" class="resume_con_identity"></div>
				</div>
				<div class="resume_content_right">
					<div class="resume_content_right_photo">
						<img src="../images/personlogo.JPG" width="80" height="100"
							onerror="showImgDelay(this,'../images/personlogo.JPG',2);">
					</div>
				</div>
			</div>
			<div class="resume_content_box">
				<div class="resume_content_h1">
					<i class="resume_content_h1_icon resume_content_h1_icon1"></i><span
						class="resume_content_h1_name">求职意向</span>
				</div>
				<div class="resume_content_yx_cont">
					<div class="resume_content_yx_list resume_content_yx_list_w100">
						<span class="resume_c6">期望职位：</span><%=rs.getString("intentionJobs") == null ? "未知" : rs.getString("intentionJobs")%>
					</div>
					<div class="resume_content_yx_list">
						<span class="resume_c6">期望行业：</span><%=rs.getString("industry") == null ? "未知" : rs.getString("industry")%>
					</div>
					<div class="resume_content_yx_list">
						<span class="resume_c6">待遇要求：</span><%=rs.getString("expectedSalary") == null ? "未知" : rs.getString("expectedSalary")%>
						<font color="#888888">RMB</font>
					</div>
					<div class="resume_content_yx_list">
						<span class="resume_c6">工作地区：</span><%=rs.getString("workDistrict") == null ? "未知" : rs.getString("workDistrict")%>
					</div>
				</div>
				<div class="clear"></div>
				<div class="resume_list">
					<div class="resume_content_h1">
						<i class="resume_content_h1_icon resume_content_h1_icon10"></i><span
							class="resume_content_h1_name">联系方式</span>
					</div>
					<div class="resume_content_yx_cont">
						<div class="resume_content_yx_list">
							<span class="resume_c6">电话号码：</span><%=rs.getString("telphone") == null ? "未知" : rs.getString("telphone")%>
						</div>
						<div class="resume_content_yx_list">
							<span class="resume_c6">电子邮件：</span><%=rs.getString("email") == null ? "未知" : rs.getString("email")%>
						</div>
					</div>
					<div class="clear"></div>
					<div class="resume_list">
						<div class="resume_content_h1">
							<i class="resume_content_h1_icon resume_content_h1_icon4"></i><span
								class="resume_content_h1_name">个人介绍</span>
						</div>
						<div class="resume_content_yx_cont">
							<div class="resume_content_yx_list resume_content_yx_list_w101">
								<span class="resume_c6">个人特长：</span><%=rs.getString("specialty") == null ? "未知" : rs.getString("specialty")%>
							</div>
							<div class="resume_content_yx_list resume_content_yx_list_w101">
								<span class="resume_c6">自我介绍：</span><%=rs.getString("selfIntroduction") == null ? "未知" : rs.getString("selfIntroduction")%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				    Company company = new Company();
					company = (Company) session.getAttribute("company");
					String visibility = company.getId() == null ? "hidden" : "visible";
			%>
			<div class="row">
				<div class="col-sm-offset-4 col-sm-3 ">
					<input type="button" class="btn_1 sq_resume" value="邀请面试"
						onclick="window.location.href='../company/JobInterview.jsp?resumeId=<%=resumeId%>&&resumeUid=<%=rs.getString(2)%>&&jobName=全部职位'"
						style="visibility:<%=visibility%>;">
				</div>
			</div>
		</div>
		<%
			}
		%>
	
</body>
</html>