<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>jsp人才系统</title>
<link rel="stylesheet" href="../css/style/css.css" type="text/css" />
<link rel="stylesheet" href="../css/style/m_css.css" type="text/css" />
<link rel="stylesheet" href="../css/style/m_header.css" type="text/css" />
<link rel="stylesheet" href="../css/style/index.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/style/login.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">


<script src="../js/util/jquery-1.8.0.min.js" language="javascript"></script>
<script src="../js/util/jquery-1.4.2.min.js" language="javascript"></script>
<script src="../js/util/jquery-ui-1.8.custom.min.js"
	language="javascript"></script>
<script src="../js/util/jquery-1.10.0.js" language="javascript"></script>
<script src="../js/util/bootstrap.js" language="javascript"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>


<script src="../js/layer/layer.min.js" language="javascript"></script>
<script src="../js/util/lazyload.min.js" language="javascript"></script>
<script src="../js/public.js" language="javascript"></script>
<script src="../js/reg_ajax.js" type="text/javascript"></script>
<script src="../js/index.js" language="javascript"></script>
<script src="../js/search.js" type="text/javascript"></script>
<script src="../js/util/slides.jquery.js" type="text/javascript"></script>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
	text-align: center;
	align: center
}

#container {
	width: 100%;
	margin: 0 auto;
	padding: 0px 100px 100px 100px;
	align: center;
	position: relative;
}

#left {
	width: 20%;
	height: 500px;
	float: left;
	background-color: green;
	align: right;
}

#iframe-left {
	width: 100%;
	height: 500px;
}

#main {
	width: 80%;
	height: 500px;
	float: left;
	background-color: black;
}

#iframe-main {
	width: 100%;
	height: 500px;
}
</style>
</head>


<body class="index_body_box">
	<%
	Jobseeker jobseeker=(Jobseeker)request.getSession().getAttribute("jobseeker");
		System.out.println("session用户名"
				+ jobseeker.getUserName());
	%>
	<div id="container">
		<div class="header">
			<div class="w950">
				<div class=" header_seach_State fltL">
					<a href="http://127.0.0.1/recruitment/upload" target="_blank"
						title='返回网站首页'> <span class="header_seach_State_a">欢迎来到jsp人才系统！</span>
					</a>
				</div>
				<div class="top_right_re fltR">
					<div class="top_right">
						<div class="header_seach_State fltR">
							<span class="header_seach_State_name">欢迎您 <%=jobseeker.getUserName()%>
							</span> <span class="user_m_line">|</span> <a href="../LogoutServlet"
								class="header_seach_State_a">退出</a> <span class="user_m_line">|</span>
							<a href="../index.jsp"  title='返回首页'
								class="user_m_fanh">返回首页 </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="left">
			<iframe src="jobseeker_left.jsp" name="leftFrame" id="iframe-left"></iframe>
		</div>
		<div id="main">
			<iframe src="jobseeker_body.html" name="mainFrame" id="iframe-main"></iframe>
		</div>


	</div>
	<!-- footer start -->
	<div class="row">
		<dl class="col-md-offset-3 login_list">
			<dt>
				<img src="../images/login/log_img1.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">强大的招聘平台</div>
				<div class="login_list_p">提供快捷、高效、可靠地网上招聘</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="../images/login/log_img2.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">收获职业机会</div>
				<div class="login_list_p">好机会主动找上你，成就职业成功</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="../images/login/log_img3.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">打造职业形象</div>
				<div class="login_list_p">创建职业档案，持续展示自己的优势</div>
			</dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div class="footer">
		<div class="foot">
			<div class="foot_conent">
				<div class="footer_left">
					<dl class="footer_list">
						<dt>关于我们</dt>
						<dd>
							<ul>
								<li><a href="https://www.baidu.com/" title="关于我们">关于我们</a></li>
								<li><a href="https://www.baidu.com/" title="注册协议">注册协议</a></li>
								<li><a href="https://www.baidu.com/" title="法律声明">法律声明</a></li>
							</ul>
						<dd>
					</dl>
					<dl class="footer_list">
						<dt>支付信息</dt>
						<dd>
							<ul>
								<li><a href="https://www.baidu.com/" title="银行帐户">银行帐户</a></li>
								<li><a href="https://www.baidu.com/" title="品牌推广">品牌推广</a></li>
								<li><a href="https://www.baidu.com/" title="收费标准">收费标准</a></li>
								<li><a href="https://www.baidu.com/" title="经营资源">经营资源</a></li>
							</ul>
						<dd>
					</dl>
					<dl class="footer_list">
						<dt>网站特色</dt>
						<dd>
							<ul>
								<li><a href="m_redeem.html" title="积分兑换">积分兑换</a></li>
								<li><a href="index.php?m=subscribe" title="订阅服务">订阅服务</a></li>
							</ul>
						<dd>
					</dl>
					<dl class="footer_list">
						<dt>咨询反馈</dt>
						<dd>
							<ul>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/kf.html"
									title="客服中心">客服中心</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/gg.html"
									title="广告投放">广告投放</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/newuser.html"
									title="新手指引">新手指引</a></li>
							</ul>
						<dd>
					</dl>
				</div>
			</div>
		</div>
	</div>

	<!--foot  end-->

	<script type="text/javascript">
		
	</script>
</body>

</html>