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
		String sql = "select * from t_company where id='"
				+ cid + "'";
		System.out.println(sql);
		ResultSet rs = dbc.getRs(sql);
		while (rs.next()) {
	%>
	<div class="yun_content">
		<div class="firm_left">
			<div class="firm_left_con">
				<div class="firm_sta">
					<div class="firm_sta_mes">
						<h3>doudou</h3>
					</div>
				</div>
				<div class="firm_det" id="company" data-slide='1'>
					<div class="firm_det_tit">
						<span>基本资料</span>
					</div>
					<div class="firm_det_link">
						<span class="firm_mes1">性&nbsp;&nbsp;&nbsp;质 ：<span
							class="JoB_material_right JoB_material_line">国家机关</span>
						</span><span class="firm_mes1">规&nbsp;&nbsp;&nbsp;模 ：<span
							class="JoB_material_right JoB_material_line">50-200人</span>
						</span><span class="firm_mes1">行&nbsp;&nbsp;&nbsp;业 ：<span
							class="JoB_material_right JoB_material_line">计算机/互联网</span>
						</span>
					</div>
					<div class="firm_det" id="company" data-slide='1'>
						<div class="firm_det_tit">
							<span>公司简介</span>
						</div>
						<div class="firm_det_con">信息技术</div>
					</div>
					<div class="firm_det" id="contact" data-slide='2'>
						<div class="firm_det_tit">
							<span>联系方式</span>
						</div>
						<div class="firm_det_link">
							<span class="firm_mes1">联 &nbsp;系&nbsp;人：<i> <em
									class="JoB_material_right JoB_material_line">张三</em>
							</i></span> <span class="firm_mes1">联系电话：<i> <em
									class="JoB_material_right JoB_material_line"><img
										src='http://127.0.0.1/recruitment/upload/data/upload/tel/5/linktel.gif' /></em>
							</i></span> <span class="firm_mes1">联系邮件：<i>1231232324@qq.com</i></span>
						</div>
						<div class="firm_det" id="job" data-slide='3'>
							<div class="firm_det_tit">
								<span>招聘职位</span>
							</div>

							<div class="firm_post">
								<div class="firm_post_con">
									<div class="firm_post_cen">
										<div class="fpc_name">
											<a
												href="http://127.0.0.1/recruitment/upload/job/index.php?c=comapply&id=5">网路工程师</a>
										</div>
										<div class="fpc_type">
											<span class="fpc_type_fr">发布时间：2016-03-09</span> <span>工作城市：天津</span>
											<span>经验：不限</span> <span>学历：不限</span> <span>薪资：<i>不限</i></span>
										</div>
									</div>
									<div class="firm_post_right">
										<a
											href="http://127.0.0.1/recruitment/upload/job/index.php?c=comapply&id=5">查看</a>
									</div>
								</div>
							</div>
							<div class="firm_post">
								<div class="firm_post_con">
									<div class="firm_post_cen">
										<div class="fpc_name">
											<a
												href="http://127.0.0.1/recruitment/upload/job/index.php?c=comapply&id=4">java工程师</a>
										</div>
										<div class="fpc_type">
											<span class="fpc_type_fr">发布时间：2016-03-09</span> <span>工作城市：天津</span>
											<span>经验：不限</span> <span>学历：不限</span> <span>薪资：<i>不限</i></span>
										</div>
									</div>
									<div class="firm_post_right">
										<a
											href="http://127.0.0.1/recruitment/upload/job/index.php?c=comapply&id=4">查看</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="commpay_Comment">
				<div id="huifu" style="display: none;">
					<form action="index.php" method="post"
						onsubmit="return check_huifu('');">
						<div class="Comment_w608">
							<textarea class="Comment_textarea_hf" tip-text="说两句吧```"
								id="reply" name="content"></textarea>
							<input type="hidden" name="id" value="" />
						</div>
						<div class="Comment_w608">
							<input class="program_reply" type="submit" name="submit2"
								value="回复" />
						</div>
					</form>
				</div>
				<div class="clear"></div>
				<div id="map_show" style="display: none;">
					<div id="map_container" style="width: 580px; height: 350px;"></div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>

