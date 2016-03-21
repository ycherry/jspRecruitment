<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<meta content="MSHTML 6.00.6000.16939" name=GENERATOR>

</head>
<body>
	<div>
		<div class="admin_mainbody">

			<div class=right_box>
				<div class=admincont_box>
					<div class="com_tit">
						<span class="com_tit_span">已邀请面试的简历</span>
						<div class="com_body">
							<!-- <div class="job_re_ts"> 您已邀请 <span class="re_cor blod">1</span> 份简历面试 </div>-->
							<div class=admin_textbox_04>
								<iframe id="supportiframe" name="supportiframe"
									onload="returnmessage('supportiframe');" style="display: none"></iframe>
								<form action="index.php?c=invite&act=del" method="post"
									target="supportiframe" id='myform'>
									<div class=table>
										<div id="job_checkbokid">
											<div class="job_news_list job_news_list_h1">
												<span class="job_news_list_span job_w100">姓名</span> <span
													class="job_news_list_span job_w150">面试职位</span> <span
													class="job_news_list_span job_w100">工作经验</span> <span
													class="job_news_list_span job_w100">期望薪资</span> <span
													class="job_news_list_span job_w100">邀请时间</span> <span
													class="job_news_list_span job_w80">状态</span> <span
													class="job_news_list_span job_w80">操作</span>
											</div>
											<%
												Company company = (Company) request.getSession().getAttribute(
														"company");
												String companyId = company.getId();
												DBConn dbc = new DBConn();
												String selectSql = "select * from t_resume,t_company_interview where t_resume.id=t_company_interview.resumeId and companyId='"
														+ companyId + "'";
												ResultSet rs = dbc.getRs(selectSql);
												while (rs.next()) {
											%>
											<div class="job_news_list">
												<span class="job_news_list_span job_w130"
													style="width: 95px;">&nbsp;<a
													href="<%=request.getContextPath()%>/jobseeker/ViewResume.jsp?resumeId=<%=rs.getString(1) %>"
													target=_blank class="com_Release_name"><%=rs.getString(5)%></a></span>
												<span class="job_news_list_span job_w150"><%=rs.getString(24)%></span>
												<span class="job_news_list_span job_w100"><%=rs.getString(8)%></span>
												<span class="job_news_list_span job_w100"><%=rs.getString(17)%></span>
												<span class="job_news_list_span job_w100"><%=rs.getString(27)%></span>
												<%
													if (rs.getString(32) == null) {
												%>
												<span class="job_news_list_span job_w80"> <font
													color="blue">对方未回复</font>
												</span>
												<%
													} else {
												%>
												<span class="job_news_list_span job_w80"> <font
													color="blue"><%=rs.getString(32) %></font>
												</span>
												<%
													}
												%>
												<span class="job_news_list_span job_w80"><a
													href="javascript:void(0)"
													onclick="deleteInterviewInfo(<%=rs.getString(1) %>,<%=rs.getString(23) %>)"
													class="uesr_name_a">删除</a></span>
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
		</div>
	</div>
	<script>
	function deleteInterviewInfo(resumeId,jobId){
		if(confirm("确认要删除面试消息?")){
			console.log("确认删除!");
			console.log("resumeId:"+resumeId);
			console.log("jobId:"+jobId);
			var contextpath="<%=request.getContextPath()%>";
			window.location.href=contextpath + "/DeleteInterviewInfoServlet?jobId='"+jobId+"'&&resumeId='"+resumeId+"'";
		}else{
			console.log("取消删除!");
		}
	}
	
	</script>
</body>
</html>