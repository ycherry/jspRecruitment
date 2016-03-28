<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<body onload="loadData()">
	<div>
		<div class="admin_mainbody">
			<div class=right_box>
				<div class=admincont_box>
					<div class="com_tit">
						<span class="com_tit_span">申请职位的人才</span>
					</div>
					<div class="com_body">
						<div class=admin_textbox_04>
							<iframe id="supportiframe" name="supportiframe"
								style="display: none"></iframe>
							<div class="hr_tip_box">
								<div class="hr_subMetx">
									<span class="hr_subMetx_span fltL">招聘职位：</span> <select
										class="selectpicker " id="position"
										onchange="positionChange()">
										<option
											value="<%=request.getAttribute("jobName") == null ? "0" : request
					.getAttribute("jobId")%>"
											data-hidden="true"><%=request.getAttribute("jobName") == null
					? "全部职位"
					: request.getAttribute("jobName")%></option>
										<option value="0">全部职位</option>
										<%
											DBConn dbc = new DBConn();
											Company company = (Company) request.getSession().getAttribute(
													"company");
											String selectSql = "select * from t_company_job where cid='"
													+ company.getId() + "' ";
											System.out.println(selectSql);
											ResultSet rs = dbc.getRs(selectSql);
											while (rs.next()) {
										%>
										<option value="<%=rs.getString("id")%>"><%=rs.getString("position")%></option>
										<%
											}
										%>
									</select>
								</div>
								<!--  						<div class="hr_subMetx">
									<form action="index.php" method="get">
										<span class="hr_subMetx_span fltL">关 键 字：</span>
										<div class="hr_subMetx_se">
											<input name="c" type="hidden" value="hr"> <input
												name="keyword" type="text" class="news_text" value="请输入姓名查找"
												onblur="if(this.value==''){this.value='请输入姓名查找'}"
												onclick="if(this.value=='请输入姓名查找'){this.value=''}">
											<input type="submit" class="news_bth" value=" ">
										</div>
									</form>
								</div>
			-->
							</div>
							<div class="clear"></div>
							<form action="index.php?c=hr&act=hrset" target="supportiframe"
								method="post" id='myform'>
								<div class="clear"></div>

								<div class="job_news_list job_news_list_h1 mt10">
									<span class="job_news_list_span job_w30">&nbsp;</span> <span
										class="job_news_list_span job_w80" style="text-align: left">姓名</span>
									<span class="job_news_list_span job_w120">求职意向</span> <span
										class="job_news_list_span job_w100">工作经验</span> <span
										class="job_news_list_span job_w120">期望薪资</span> <span
										class="job_news_list_span job_w120">申请的职位</span> <span
										class="job_news_list_span job_w100">申请时间</span><span
										class="job_news_list_span job_w140">操作</span>
								</div>
								<%
								    int resumeNumber=0;
									if (request.getAttribute("resultSet") != null) {
										ResultSet resultset = (ResultSet) request
												.getAttribute("resultSet");
										while (resultset.next()) {
											resumeNumber++;
								%>
								<div class="job_news_list" style="padding-bottom: 18px;">

									<span class="job_news_list_span job_w30"
										style="padding-right: 10px;"> <input type="checkbox"
										name="delid[]" value="2">
									</span> <span class="job_news_list_span job_w80"
										style="text-align: left"><a
										href="<%=request.getContextPath() %>/jobseeker/ViewResume.jsp?resumeId=<%=resultset.getString("id") %>"
										target="_blank" class="com_Release_name"><%=resultset.getString("fullName")%></a></span>
									<span class="job_news_list_span job_w120"><%=resultset.getString("intentionJobs")%></span>
									<span class="job_news_list_span job_w100"><%=resultset.getString("experience")%></span>
									<span class="job_news_list_span job_w120"><%=resultset.getString("expectedSalary")%></span>
									<span class="job_news_list_span job_w120"><a
										href="<%=request.getContextPath() %>/company/ViewJob.jsp?jobId=<%=Encode.getNewString(resultset.getString("jobId")) %>"
										target="_blank" class="uesr_name_a"><%=resultset.getString("jobName")%></a></span><span
										class="job_news_list_span job_w100"><%=resultset.getString("applyTime")%></span>
									<span class="job_news_list_span job_w140"
										style="text-align: center;">
										<%
										String status=null;
										String applySelectSql="select status from t_job_apply where resumeId='"+resultset.getString("id")+"' and jobId='"+resultset.getString("jobId")+"'";
										
												ResultSet applyRs=dbc.getRs(applySelectSql);
												if(applyRs.next()){
													status=applyRs.getString("status");
												}
										if(status!=null&&status.equals("2")){
											%>
											 <font color="red">已拒绝</font>
										<% }else{
										
										String interviewSelectSql="select * from t_company_interview where resumeId='"+resultset.getString("id")+"' and jobId='"+resultset.getString("jobId")+"'";
										if(dbc.getRs(interviewSelectSql).next()){
											%>
	                                       <font color="red">已邀请</font>
										<%}else{ %>
										<a
										href="<%=request.getContextPath() %>/company/JobInterview.jsp?resumeId=<%=resultset.getString("id") %>&&resumeUid=<%=resultset.getString("uid") %>&&jobName=<%=resultset.getString("jobName") %>"
										class="uesr_name_a">邀请面试</a>
										<%} %>
										 <span class="com_m_line">|</span> <a
										href="javascript:void(0)"
										onclick="deleteModal(<%=resultset.getString("id") %>,<%=resultset.getString("jobId") %>)"
										class="uesr_name_a">屏蔽/删除</a>
										<%} %>
									</span>

								</div>
								<%
									}
									}
								%>
								<div class="diggg mt10 fltR"></div>
							</form>
							<div class="clear"></div>
							<div class="job_list_tip">
								<span class="job_list_tip_span">共有（<span class="f60"><%=resumeNumber %></span>）份简历申请贵公司发布的职位
								</span><a href="<%=request.getContextPath() %>/company/SearchTalent.jsp"
									class="fb_Com_xz" target="mainFrame"
									style="text-align: center; line-height: 25px;">找人才</a>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$(".com_mem_hr_list_bj").click(function() {
				var browse = $(this).attr('browse');
				var id = $(this).attr('name');
				$.post("index.php?c=hr&act=hrset", {
					id : id,
					browse : browse
				}, function(data) {
					location.reload();
				});
			});
			
		});
		function loadData(){
			var jobName="<%=request.getAttribute("jobName")%>";
			console.log("调用onload");
			console.log("jobName:"+jobName);
			if(jobName=="null"){
				positionChange();
			}
		}
		function positionChange(){
			//	alert(window.location.href);
				var jobId=$("#position option:selected").val();
				var jobName=$("#position option:selected").text();
				var contextpath="<%=request.getContextPath()%>";
			console.log("contextpath:" + contextpath);
			console.log(jobId + " and " + jobName);
			window.location.href = contextpath
					+ "/ReceivedResumeServlet?jobId=" + jobId;
		}
		
		function deleteModal(resumeId,jobId){
			if(confirm("确定要拒绝给用户 ?")){
				var contextpath="<%=request.getContextPath()%>";
				window.location.href=contextpath + "/RefuseApplyServlet?jobId='"+jobId+"'&&resumeId='"+resumeId+"'";
			}else{
				console.log("取消拒绝");
			}
			
		}
		
	</script>
	<div class="clear"></div>
</body>
</html>