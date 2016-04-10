<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<script type="text/javascript" src="../js/util/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../js/util/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
</head>
<%
	DBConn dbc = new DBConn();
	Jobseeker jobseeker = (Jobseeker) request.getSession()
			.getAttribute("jobseeker");
	String resumeId = null;
	if (jobseeker.getUserName() != null) {
		String sql = "select * from t_resume where userName ='"
				+ jobseeker.getUserName() + "'";
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
			resumeId = rs.getString("id");
		}
	}
%>
<body LINK=firebrick VLINK=#660000 ALINK=red>
	<div class="sidebar-menu">
		<!-- http://getbootstrap.com/components/#glyphicons 图标 -->
		<a href="#userMeun" class="nav-header menu-first collapsed"
			data-toggle="collapse"><i class=""></i>&nbsp;&nbsp;用户信息管理</a>
		<ul id="userMeun" class="nav nav-list collapse menu-second">
			<li><a href="changePassword.jsp" target="mainFrame"><i
					class=""></i>&nbsp;&nbsp;修改密码</a></li>
		</ul>
		<a href="#resumeMenu" class="nav-header menu-first collapsed"
			data-toggle="collapse"><i class=""></i>简历管理</a>
		<ul id="resumeMenu" class="nav nav-list collapse menu-second">
			<li><a href="buildResume.jsp" target="mainFrame"><i class=""></i>&nbsp;&nbsp;填写简历信息</a></li>
			<li><a href="ViewResume.jsp?resumeId=<%=resumeId%>"
				target="mainFrame"><i class=""></i>&nbsp;&nbsp;预览简历信息</a></li>
		</ul>
		<a href="#recruitmentMenu" class="nav-header menu-first collapsed"
			data-toggle="collapse"><i class=""></i>求职管理</a>
		<ul id="recruitmentMenu" class="nav nav-list collapse menu-second">
			<li><a href="SearchJob.jsp" target="mainFrame"><i
					class="icon-pencil"></i> 搜索职位信息</a></li>
			<li><a href="SearchCompany.jsp" target="mainFrame"><i
					class="icon-pencil"></i> 搜索企业信息</a></li>
			<li><a href="InterviewInvitation.jsp" target="mainFrame"><i
					class="icon-list-alt"></i> 面试邀请</a></li>
			<li><a href="AppliedJobs.jsp" target="mainFrame"><i
					class="icon-list-alt"></i> 申请的职位</a></li>
		</ul>	
		<a href="#otherMenu" class="nav-header menu-first collapsed"
			data-toggle="collapse"><i class=""></i>退出系统</a>
		<ul id="otherMenu" class="nav nav-list collapse menu-second">
			<li><a href="../LogoutServlet" target="_parent"><i
					class="icon-pencil"></i> 退出</a></li>
		</ul>
	</div>
</body>
</html>
