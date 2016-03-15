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
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/comapplyJob.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
</head>
<body>
	<%
		DBConn dbc = new DBConn();
		DataBaseOperation dbo = new DataBaseOperation();
		String jobId = (String) request.getParameter("jobId");
		Statement at = dbc.getStmtread();
		int resumeCount = dbo
				.getRowCount("select count(*) from t_job_apply where jobId='"
						+ jobId + "'");
		String sql = "select * from t_company_job,t_company where t_company.id=t_company_job.cid and t_company_job.id='"
				+ jobId + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<div class="yun_content">
		<div class="comappiy_left_sidebar fl">
			<div class="Company_left_cont">

				<div class="Company_post_name fl">
					<span class="Company_post_name_h1"><%=rs.getString(3) == null ? "暂无" : rs.getString(3)%></span>
				</div>
				<div class="Company_post_qy_name">
					<a href="ViewCompany.jsp?cid=<%=rs.getString(2)%>"><%=rs.getString(4) == null ? "暂无" : rs.getString(4)%></a>
				</div>
				<div class="Company_post_State">
					<span class="Company_post_State_s"> <span class="c_Grey">刷新日期：</span><%=rs.getString(11) == null ? "暂无" : rs.getString(11)%>
					</span> <span class="Company_post_State_s"><span class="c_Grey">有效日期至：</span><%=rs.getString(12) == null ? "暂无" : rs.getString(12)%></span>
					<span class="Company_post_State_s"><span
						class="Company_post_State_s"><span class="c_Grey">简历投递：</span><span
							class="Orange blod"><%=resumeCount == 0 ? "暂无" : resumeCount%></span></span>
				</div>

				<div class="Company_Basic_information">
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_a"></i>
						<div class="Company_Basic_information_r">
							<span class="c_Grey">月薪：</span> <span
								class="Company_Basic_information_red"><%=rs.getString(9) == null ? "暂无" : rs.getString(9)%></span>
						</div>
					</div>
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_b"></i>
						<div class="Company_Basic_information_r">
							<span class="Company_Basic_information_l"><span
								class="c_Grey">经验：</span><%=rs.getString(8) == null ? "暂无" : rs.getString(8)%></span>
							<span class="Company_Basic_information_l"> <span
								class="c_Grey">学历：</span><%=rs.getString(7) == null ? "暂无" : rs.getString(7)%>
							</span> <span class="Company_Basic_information_l"> <span
								class="c_Grey">性质：</span><%=rs.getString(17) == null ? "暂无" : rs.getString(17)%>
							</span>
						</div>
					</div>
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_c"></i>
						<div class="Company_Basic_information_r">
							<span class="Company_Basic_information_l"> <span
								class="c_Grey">招聘：</span><%=rs.getString(5) == null ? "暂无" : rs.getString(5)%>
							</span> 
						</div>
					</div>
					<div class="Company_Basic_information_list">
						<i
							class="Company_Basic_information_icon Company_Basic_information_icon_d"></i>
						<div class="Company_Basic_information_r">
							<span class="c_Grey">城市：</span><%=rs.getString(6) == null ? "暂无" : rs.getString(6)%></span>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="Company_post_msg">
				<i class="Company_h1_line"></i><span class="Company_co">职位描述</span>
			</div>
			<div class="Company_content fl Company_toggle" id="Company_job_info">
				<div class="Job_Description"><%=rs.getString(10) == null ? "暂无" : rs.getString(10)%></div>
			</div>
			<div class="clear"></div>
			<div class="Company_post_msg">
				<i class="Company_h1_line"></i><span class="Company_co">联系方式</span>
			</div>
			<div class="Company_post_touch">
				<div class="Company_post_touch_list">
					<div class="Company_post_touch_list_left">
						<span class="c_Grey">电子邮箱：</span><%=rs.getString(21) == null ? "暂无" : rs.getString(21)%>
					</div>
				</div>


				<div class="Company_post_touch_list">
					<div class="Company_post_touch_list_left">
						<span class="c_Grey">联系手机：</span><%=rs.getString(19) == null ? "暂无" : rs.getString(19)%></div>
				</div>
				<div class="Company_post_touch_list">
					<span class="c_Grey">公司地址：</span><%=rs.getString(18) == null ? "暂无" : rs.getString(18)%>
				</div>
			</div>
			<div class="Company_post_msg m10">
				<i class="Company_h1_line"></i><span class="Company_co">公司简介</span>
			</div>
			<div class="Company_content fl">
				<div class="Company_Profile"><%=rs.getString(22) == null ? "暂无" : rs.getString(22)%></div>
				<div class="clear"></div>
			</div>
			<div class="comapply_sq">

				<a id="sq_job" href="../ApplyJobServlet?jobId=<%=rs.getString(1) %>&&jobName=<%=rs.getString(3) %>&&companyName=<%=rs.getString(4) %>&&companyId=<%=rs.getString(2) %>" class="comapply_sq_submit">申请此职位</a>
				<div class="comapply_sq_r"></div>
			</div>
		</div>
	</div>
	<div id="sqjob_show" class="Pop-up_logoin"
		style="display: none; background: none;">
		<div class="Pop-up_logoin_sq">
			<span>职位名称：</span><em class="yun_red">网路工程师</em>
		</div>
		<div class="Pop-up_logoin_sq">
			<span>公司名称： </span><em>doudou</em>
		</div>
		<div class="Pop-up_logoin_sq" id="resume_job">
			<span>选择简历：</span>
			<div class="POp_up_r"></div>
		</div>
		<div class="Pop-up_logoin_sq" style="clear: both">
			<span>&nbsp;</span> <input id="companyname" type="hidden"
				value="doudou" /> <input id="jobname" type="hidden" value="网路工程师" />
			<input id="companyuid" type="hidden" value="5" /> <input id="jobid"
				type="hidden" value="5" /> <input id="click_sq"
				class="login_button2" type="button" value="提交申请" name="Submit">
		</div>
	</div>
	<%
		}
	%>
</body>
</html>