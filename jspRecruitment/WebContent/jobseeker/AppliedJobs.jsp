<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
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
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<meta content="MSHTML 6.00.6000.16939" name="Generator">
</head>
<body>
	<%
		DataBaseOperation dbo = new DataBaseOperation();
	    DBConn dbc=new DBConn();
		Jobseeker jobseeker = (Jobseeker) request.getSession()
				.getAttribute("jobseeker");
		String countSql = "select count(*) from t_job_apply where resumeId='"
				+ jobseeker.getId() + "'";
		int count = dbo.getRowCount(countSql);
	%>
	<div class="mian_right fltR">
		<div class="member_right_h1 fltL">
			<span class="member_right_span fltL">申请的职位</span>
		</div>
		<div class="resume_box_list">
			<div class="resume_Prompt">
				您已申请 <span style="color: red;"><%=count%></span> 条职位,请耐心等待企业回复！
			</div>
			<div class="clear"></div>
			<div id="gms_showclew"></div>
			<div class="List_Ope List_Title mt12">
				<span class="List_Title_span List_Title_w200">申请的职位</span> <span
					class="List_Title_span List_Title_w200">公司名称</span> <span
					class="List_Title_span List_Title_w150">当前状态</span> <span
					class="List_Title_span List_Title_w150">申请时间</span> <span
					class="List_Title_span List_Title_w150">操作</span>
			</div>
			<%
			String selectSql="select * from t_company_job,t_job_apply where t_job_apply.jobId=t_company_job.id and resumeId='"+jobseeker.getId()+"'";
			ResultSet rs=dbc.getRs(selectSql);
			while(rs.next()){
			%>
			<div class="List_Ope List_Ope_bor">
				<span class="List_Title_span List_Title_w200"> <a
					href="<%=request.getContextPath() %>/company/ViewJob.jsp?jobId=<%=rs.getString(1)%>"
					target="mainFrame" title="web工程师" class="List_Title_span_com"><%=rs.getString(3) %></a>
				</span> <span class="List_Title_span List_Title_w200"> <a
					href="<%=request.getContextPath() %>/company/ViewCompany.jsp?jobId=<%=rs.getString(2) %>"
					target="mainFrame" title="信息技术" class="List_Ope_a"><%=rs.getString(4) %> </a>
				</span><span class="List_Title_span List_Title_w150">
				<%
				String status=null;
				if(rs.getString(21)==null||rs.getString(21).equals("")){
					status="未查看";
				}else if(rs.getString(21).equals("1")){
					status="已邀请面试";
				}else if(rs.getString(21).equals("2")){
					status="不符合公司职位需求";
				}
				%> <span
					class=" is_browse2"><%=status %></span>
				</span> <span class="List_Title_span List_Title_w150"><%=rs.getString(20) %></span> <span
					class="List_Title_span List_Title_w150"> <a
					href="javascript:void(0)"
					onclick="deleteApplyInfo(<%=rs.getString(14) %>,<%=rs.getString(16) %>)"
					class="List_dete cblue">删除</a>
				</span>
			</div>
			<%} %>
			<div class="clear"></div>
		</div>
		<div class="diggg" style="margin-top: 10px; float: right"></div>
	</div>
<script type="text/javascript">
function deleteApplyInfo(resumeId,jobId){
	if(confirm("确认删除求职信息？")){
		console.log("确认删除!");
		console.log("resumeId:"+resumeId);
		console.log("jobId:"+jobId);
		var contextpath="<%=request.getContextPath()%>";
		window.location.href=contextpath + "/DeleteApplyInfoServlet?jobId='"+jobId+"'&&resumeId='"+resumeId+"'";
	}else{
		console.log("取消删除!");
	}
	
}
</script>



</body>
</HTML>
<script>