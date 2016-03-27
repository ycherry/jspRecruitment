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
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/util/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../js/util/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/m_header.css">
<link rel="stylesheet" type="text/css" href="../css/style/m_css.css">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
</head>
<body>
	<div class="w950">
		<div class="mian_right fltR">
			<div class="member_right_h1 fltL">
				<span class="member_right_span fltL">面试邀请</span>
			</div>
			<div class="remindbox01 mt10">
				<div id="gms_showclew"></div>
				<div class="resumelistbox01 mt10">
					<div id="" class="resume_box_list">
						<div class="List_Ope List_Title ">
							<span class="List_Title_span List_Title_w170">面试职位</span> <span
								class="List_Title_span List_Title_w170">公司名称</span> <span
								class="List_Title_span List_Title_w230"
								style="text-align: center">操作</span><span
								class="List_Title_span List_Title_w150"
								style="text-align: center">面试时间</span> <span
								class="List_Title_span List_Title_w150"
								style="text-align: center">我的操作</span>
						</div>
						<%
							DBConn dbc = new DBConn();
							Jobseeker jobseeker = (Jobseeker) request.getSession().getAttribute("jobseeker");
							String selectInterviewSql = "select * from t_company_interview where resumeId='" + jobseeker.getId() + "'";
							ResultSet rs = dbc.getRs(selectInterviewSql);
							while (rs.next()) {
								System.out.println(rs.getString("companyName"));
								String status = rs.getString("status");
								String responseMessage = null;
								if (status != null && status.equals("1")) {
									responseMessage = "已接受";
								} else if (status != null && status.equals("2")) {
									responseMessage = "已拒绝";
								} else {
									responseMessage = "尚未回复";
								}
						%>
						<div class="List_Ope List_Ope_Advisory">
							<span class="List_Title_span List_Title_w170"> <a
								href="<%=request.getContextPath()%>/company/ViewJob.jsp?jobId=<%=rs.getString("jobId")%>"
								class="List_Title_span_com"><%=rs.getString("jobName")%></a>
							</span> <span class="List_Title_span List_Title_w170"> <a
								href="<%=request.getContextPath()%>/company/ViewCompany.jsp?cid=<%=rs.getString("companyId")%>"><%=rs.getObject("companyName")%></a>
							</span> <span class="List_Title_span List_Title_w230"
								style="text-align: center"><a href="javascript:void(0);"
								onclick="deleteInterview(<%=rs.getString("id")%>,'3')"
								class="cblue">删除</a><span class="u_List_line">|</span> <%
 	if (status == null) {
 %> <a href="javascript:void(0);"
								onclick="refuseInterview(<%=rs.getString("id")%>,'2')"
								class="cblue">拒绝面试</a><span class="u_List_line">|</span><a
								href="javascript:void(0);"
								onclick="acceptInterview(<%=rs.getString("id")%>,'1')"
								class="cblue">同意面试</a> <span class="u_List_line">|</span> <%
 	}
 %> <a href="#jobInterview<%=rs.getString("id")%>" data-toggle="modal">查看</a>
							</span> <span class="List_Title_span List_Title_w150"> <%=rs.getString("interviewTime")%>
							</span><span class="List_Title_span List_Title_w150"><font
								color="#f60"><%=responseMessage%></font> </span>
						</div>
						<div class="modal" id="jobInterview<%=rs.getString("id")%>"
							style="z-index: 2000">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title">邀请面试</h4>
									</div>
									<div class="modal-body">
										<div class="audition_list">
											<span class="audition_list_span">面试职位：</span><em
												class="audition_list_em" id="jobname"><%=rs.getString("jobName") %></em> <span
												class="audition_list_span">企业名称：</span><em
												class="audition_list_em" id="linkman"><%=rs.getString("companyName") %></em>
										</div>
										<div class="audition_list">
											<span class="audition_list_span">联系电话：</span><em
												class="audition_list_em" id="linktel"><%=rs.getString("telphone") %></em> <span
												class="audition_list_span">面试时间：</span><em
												class="audition_list_em" id="intertime"><%=rs.getString("interviewTime") %></em>
										</div>
										<div class="audition_list">
											<span class="audition_list_span">面试地点：</span><em
												class="audition_list_em" id="address"><%=rs.getString("district") %></em>
										</div>
										<div class="clear"></div>
										<div class="audition_list">
											<span class="audition_list_span">面试备注：</span><em
												class="audition_list_em" id="content"><%=rs.getString("Note") %></em>
										</div>
										<div class="clear"></div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="getcont" style="width: 350px; height: 250px; display: none;">
		<div style="padding: 10px;">
			<div class="audition_list">
				<span class="audition_list_span">面试职位：</span><em
					class="audition_list_em" id="jobname"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">联系人： </span><em
					class="audition_list_em" id="linkman"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">联系电话：</span><em
					class="audition_list_em" id="linktel"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">面试时间：</span><em
					class="audition_list_em" id="intertime"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">面试地址：</span><em
					class="audition_list_em" id="address"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">面试备注：</span><em
					class="audition_list_em" id="content"></em>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function refuseInterview(interviewId,status){
		if(confirm("确定拒绝面试?")){
			console.log("确认拒绝！");
			console.log(status);
			window.location.href="../ResponseOfInterviewServlet?interviewId="+interviewId+"&&responseStatus="+status;
		}else{
			console.log("取消拒绝！");
		}
	};
	
	function acceptInterview(interviewId,status){
		if(confirm("确定接受面试?")){
			console.log("确认接受绝！");
			console.log(status);
			window.location.href="../ResponseOfInterviewServlet?responseStatus="+status+"&&interviewId="+interviewId;
		}else{
			console.log("取消接受！");
		}
	};
	
	function deleteInterview(interviewId,status){
		if(confirm("确定删除?")){
			console.log("确认删除！");
			console.log(status);
			window.location.href="../ResponseOfInterviewServlet?responseStatus="+status+"&&interviewId="+interviewId;
		}else{
			console.log("取消删除！");
		}
	};
	</script>
</BODY>
</HTML>
