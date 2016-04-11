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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css"
	href="../css/style/company/comapply.css">
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
		String cid = (String) request.getParameter("cid");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_company where id='" + cid + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<div class="yun_content">
		<div class="firm_left">
			<div class="firm_left_con">
				<div class="firm_sta">
					<div class="firm_sta_mes">
						<h3><%=rs.getString("companyName") == null ? "暂无"
						: rs.getString("companyName")%></h3>
					</div>
				</div>
				<div class="firm_det" id="company" data-slide='1'>
					<div class="firm_det_tit">
						<span>基本资料</span>
					</div>
					<div class="firm_det_link">
						<span class="firm_mes1">性&nbsp;&nbsp;&nbsp;质 ：<span
							class="JoB_material_right JoB_material_line"><%=rs.getString("nature") == null ? "暂无" : rs
						.getString("nature")%></span>
						</span><span class="firm_mes1">规&nbsp;&nbsp;&nbsp;模 ：<span
							class="JoB_material_right JoB_material_line"><%=rs.getString("scale") == null ? "暂无" : rs
						.getString("scale")%></span>
						</span><span class="firm_mes1">行&nbsp;&nbsp;&nbsp;业 ：<span
							class="JoB_material_right JoB_material_line"><%=rs.getString("industry") == null ? "暂无"
						: rs.getString("industry")%></span>
						</span>
					</div>
					<div class="firm_det" id="company" data-slide='1'>
						<div class="firm_det_tit">
							<span>公司简介</span>
						</div>
						<div class="firm_det_con"><%=rs.getString("introduction") == null ? "暂无"
						: rs.getString("introduction")%></div>
					</div>
					<div class="firm_det" id="contact" data-slide='2'>
						<div class="firm_det_tit">
							<span>联系方式</span>
						</div>
						<div class="firm_det_link">
							<span class="firm_mes1">联系电话：<i> <em
									class="JoB_material_right JoB_material_line"><%=rs.getString("telphone") == null ? "暂无"
						: rs.getString("telphone")%></em>
							</i></span> <span class="firm_mes1">联系邮件：<i><%=rs.getString("email") == null ? "暂无" : rs
						.getString("email")%></i></span>
							<span >地 &nbsp;&nbsp;&nbsp;址：<i> <em
									class="JoB_material_right JoB_material_line"><%=rs.getString("address") == null ? "暂无"
						: rs.getString("address")%></em>
							</i></span>
						</div>
						<div class="firm_det" id="job" data-slide='3'>
							<div class="firm_det_tit">
								<span>招聘职位</span>
							</div>
							<%
								String selectSql = "select * from t_company_job where cid='"
											+ cid + "'";
									ResultSet resultset = dbc.getRs(selectSql);
									while (resultset.next()) {
							%>
							<div class="firm_post">
								<div class="firm_post_con">
									<div class="firm_post_cen">
										<div class="fpc_name">
											<a href="ViewJob.jsp?jobId=<%=resultset.getString("id")%>"><%=resultset.getString("position")%></a>
										</div>
										<div class="fpc_type">
											<span class="fpc_type_fr">发布时间：<%=resultset.getString("addTime")%></span>
											<span>工作城市：<%=resultset.getString("district")%></span> <span>经验：<%=resultset.getString("experience")%></span>
											<span>学历：<%=resultset.getString("education")%></span> <span>薪资：<i><%=resultset.getString("salary")%></i></span>
										</div>
									</div>
									<div class="firm_post_right">
										<a href="ViewJob.jsp?jobId='<%=resultset.getString("id")%>'">查看</a>
									</div>
								</div>
							</div>
							<%
								}
							%>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>

