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
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<div class="resume_box">
		<div class="resume_content">
			<div class="resume_content_top_box">
				<div class="resume_content_left">
					<div class="resume_content_name">
						<span class="resume_content_name_s"><%=rs.getString(5)%></span>(<%=rs.getString(4)%>,<%=(year - rs.getDate(7).getYear())%>岁)
					</div>
					<span class="resume_content_msg_c" style="width: 140px;"> <span
						class="resume_content_msg_span">学历：</span><%=rs.getString(10) == null ? "未知" : rs.getString(10)%>
					</span> <span class="resume_content_msg_c"> <span
						class="resume_content_msg_span">经验：</span><%=rs.getString(8) == null ? "未知" : rs.getString(8)%>
					</span> <span class="resume_content_msg_c"> </span> <span
						class="resume_content_msg_c"
						style="width: 200px; height: 28px; overflow: hidden"> <span
						class="resume_content_msg_span">所在地：</span><%=rs.getString(9) == null ? "未知" : rs.getString(9)%>

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
						<span class="resume_c6">期望职位：</span><%=rs.getString(13) == null ? "未知" : rs.getString(13)%>
					</div>
					<div class="resume_content_yx_list">
						<span class="resume_c6">期望行业：</span><%=rs.getString(6) == null ? "未知" : rs.getString(6)%>
					</div>
					<div class="resume_content_yx_list">
						<span class="resume_c6">待遇要求：</span><%=rs.getString(17) == null ? "未知" : rs.getString(17)%>
						<font color="#888888">RMB</font>
					</div>
					<div class="resume_content_yx_list">
						<span class="resume_c6">工作地区：</span><%=rs.getString(16) == null ? "未知" : rs.getString(16)%>
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
							<span class="resume_c6">电话号码：</span><%=rs.getString(11) == null ? "未知" : rs.getString(11)%>
						</div>
						<div class="resume_content_yx_list">
							<span class="resume_c6">电子邮件：</span><%=rs.getString(12) == null ? "未知" : rs.getString(12)%>
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
								<span class="resume_c6">个人特长：</span><%=rs.getString(14) == null ? "未知" : rs.getString(14)%>
							</div>
							<div class="resume_content_yx_list resume_content_yx_list_w101">
								<span class="resume_c6">自我介绍：</span><%=rs.getString(18) == null ? "未知" : rs.getString(18)%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-offset-4 col-sm-3 ">
					<input type="button" class="btn_1 sq_resume" value="邀请面试" onclick="window.location.href='../company/JobInterview.jsp?resumeId=<%=resumeId%>&&resumeUid=<%=rs.getString(2)%>'">
				</div>
			</div>
		</div>
		<%
			}
		%>
	
</body>
</html>