<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="jsprecruitment.util.*,jsprecruitment.entity.*"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/util/jquery-1.10.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style/sidebar.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css.map">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style/common.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-select.css.map">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style/company/m_style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style/company/user-n2012.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style/company/index_style.css">
</head>
<body align="center">
	<div class="admin_mainbody">
		<div class=right_box>
			<div class=admincont_box>
				<div class="com_tit">
					<span class="com_tit_span">全部招聘信息</span>
					<div class="disc_search">
						<input type="text" name="keyword" value=""
							placeholder="请输入要搜索的关键字" class="Search_text" id="Search_text">
						<input type="button" value="搜索" class="Search_submit"
							onclick="searchPosition()">
					</div>
				</div>
				<div class="com_body">
					<div class=admin_textbox_04>
						<iframe id="supportiframe" name="supportiframe"
							style="display: none"></iframe>
						<div class="clear"></div>
						<form action="index.php?c=hr&act=hrset" target="supportiframe"
							method="post" id='myform'>
							<div class="clear"></div>
							<div class="job_news_list job_news_list_h1 mt10">
								<span class="job_news_list_span job_w140"
									style="text-align: center">职位名称</span> <span
									class="job_news_list_span job_w120">发布时间</span> <span
									class="job_news_list_span job_w100">有效时间</span> <span
									class="job_news_list_span job_w120">求职人数</span> <span
									class="job_news_list_span job_w120">预览</span> <span
									class="job_news_list_span job_w120">编辑</span><span
									class="job_news_list_span job_w120">删除</span>
							</div>
							<%
								DBConn con = new DBConn();
								DataBaseOperation dbo = new DataBaseOperation();
								/*	String companyId = ((Company) request.getSession().getAttribute(
											"company")).getId();
									String selectPositionSql = "SELECT * FROM t_company_job WHERE cid='"
											+ companyId + "'order by id desc";
									ResultSet rs = con.getRs(selectPositionSql);
								 */
								ResultSet rs = null;
								String companyId = ((Company) request.getSession().getAttribute("company")).getId();
								String selectPositionSql = "SELECT * FROM t_company_job WHERE cid='" + companyId + "'order by id desc";
								if (request.getAttribute("PositionResultSet") != null) {
									rs = (ResultSet) request.getAttribute("PositionResultSet");
								} else {
									rs = con.getRs(selectPositionSql);
								}
								while (rs.next()) {
									int intId = Integer.parseInt(rs.getObject("id").toString());
									String selectSql = "select count(*) from t_job_apply where jobId='" + rs.getObject("id") + "'";
							%>
							<div class="job_news_list" style="padding-bottom: 18px;">
								<span class="job_news_list_span job_w140"
									style="text-align: center"><a
									href="viewJobDetails.jsp?intId=<%=intId%>" target="_blank"
									class="com_Release_name"><%=rs.getObject("position")%></a></span> <span
									class="job_news_list_span job_w120"><%=rs.getObject("addTime")%></span>
								<span class="job_news_list_span job_w100"><%=rs.getObject("deadline")%></span>
								<span class="job_news_list_span job_w120"><%=dbo.getRowCount(selectSql)%></span>
								<span class="job_news_list_span job_w120"><a
									href="ViewJob.jsp?jobId=<%=intId%>" class="uesr_name_a">预览</a></span>
								<span class="job_news_list_span job_w120"><a
									href="updateJob.jsp?intId=<%=intId%>" class="uesr_name_a">编辑</a></span>
								<span class="job_news_list_span job_w120"><a
									href=" ../DeleteJobServlet?intId=<%=intId%>"
									class="uesr_name_a">删除</a></span>
							</div>
							<%
								}

								int count = 0;
								if (request.getAttribute("positionCount") != null) {
									count = (Integer) request.getAttribute("positionCount");
								} else {
									count=dbo.getRowCount(selectPositionSql);
								}

								if (count <= 0) {
							%>
							<div class="seachno">
								<div class="seachno_left">
									<img src="../images/search-no.gif" width="144" height="102">
								</div>
								<div class="listno-content">
									<strong>暂时还未发布职位信息</strong><br> <span> 建议您：<br>
										1、完善企业信息<br> 2、发布一条职位信息<br>
								</div>
							</div>
							<%
								}
							%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
	//	searchPosition();
	});
	
	function searchPosition(){
		var keyword=$("#Search_text").val();
		console.log(keyword);
		var contextpath="<%=request.getContextPath()%>";
			window.location.href = contextpath
					+ "/SearchPositionServlet?keyword=" + keyword;
		}
	</script>
</body>
</html>