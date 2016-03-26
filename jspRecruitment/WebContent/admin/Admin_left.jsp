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
<body LINK=firebrick VLINK=#660000 ALINK=red>
	<div class="sidebar-menu">
		<!-- http://getbootstrap.com/components/#glyphicons 图标 -->
		<a href="#userMeun" class="nav-header menu-first collapsed"
			data-toggle="collapse"><i class=""></i>用户信息管理</a>
		<ul id="userMeun" class="nav nav-list collapse menu-second">
			<li><a href="<%=request.getContextPath() %>/admin/ChangePassword.jsp" target="mainFrame"><i
					class=""></i>修改密码</a></li>
		</ul>
		<a href="#recruitmentMenu" class="nav-header menu-first collapsed"
			data-toggle="collapse"><i class=""></i>用户管理</a>
		<ul id="recruitmentMenu" class="nav nav-list collapse menu-second">
			<li><a href="SearchJob.jsp" target="mainFrame"><i
					class="icon-pencil"></i> 用户信息管理</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/ResumeManagement.jsp" target="mainFrame"><i
					class="icon-list-alt"></i> 简历管理</a></li>
		</ul>
		<a href="#resumeMenu" class="nav-header menu-first collapsed"
			data-toggle="collapse"><i class=""></i>企业管理</a>
		<ul id="resumeMenu" class="nav nav-list collapse menu-second">
			<li><a href="CompanyManagement.jsp" target="mainFrame"><i class=""></i>基本信息管理</a></li>
			<li><a href="JobManagement.jsp"
				target="mainFrame"><i class=""></i>职位管理</a></li>
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
