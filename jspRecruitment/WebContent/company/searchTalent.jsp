<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="jsprecruitment.util.*,jsprecruitment.entity.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>搜索人才</title>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
</head>
<body>
	<form role="form" name="updateCompnyInfoForm" id="updateCompnyInfoForm"
		method="post" action="../UpdateCompanyInfoServlet" target="mainFrame"
		bgcolor="#F5f7f7">
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>搜索人才信息</strong></font>
			</div>

			<div class="row updateDiv">
				<div class="col-sm-2 updateInfoLabel">
					<label>所属行业:</label>
				</div>
				<div class="col-sm-3">
					<select class="form-control selectpicker" name="industry">
						<option>计算机/互联网</option>
						<option>销售/ 客服/技术支持</option>
						<option>会计/金融/银行 /保险</option>
						<option>生产/营运/采购/ 物流</option>
						<option>生物/制药/医疗/ 护理</option>
						<option>广告/市场/媒体/ 艺术</option>
						<option>建筑/房地产</option>
						<option>人事/行政/高级 管理</option>
						<option>咨询/法律/教育/ 科研</option>
						<option>服务业</option>
						<option>公务员/翻译/其 他</option>
						<option>化工/能源</option>
						<option>贸易/百货</option>
						<option>机械/设备/技工</option>
						<option>通信/电子</option>
					</select>
				</div>
				<div class="col-sm-2 updateInfoLabel">
					<label>工作省份:</label>
				</div>
				<div class="col-sm-3">
					<select class="form-control selectpicker" name="nature">
						<%
							DBConn con = new DBConn();
							DataBaseOperation dbo = new DataBaseOperation();
							ResultSet rs = con.getRs("SELECT name FROM t_city");
							while (rs.next()) {
						%>
						<option><%=rs.getString(1)%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-2 updateInfoLabel">
					<label>薪资待遇:</label>
				</div>
				<div class="col-sm-3">
					<select class="form-control selectpicker" name="industry">
						<option>全部</option>
						<option>面议</option>
						<option>1000以下</option>
						<option>1000-1999</option>
						<option>2000-2999</option>
						<option>3000-3999</option>
						<option>4000-4999</option>
						<option>5000-5999</option>
						<option>6000-6999</option>
						<option>7000-7999</option>
						<option>8000-8999</option>
						<option>9000-9999</option>
						<option>10000以上</option>
					</select>
				</div>
					<div class="col-sm-2 updateInfoLabel">
					<label>学历要求:</label>
				</div>
				<div class="col-sm-3">
					<select class="form-control selectpicker" name="scale">
						<option>全部</option>
						<option>高中以下</option>
						<option>高中</option>
						<option>中专</option>
						<option>大专</option>
						<option>本科</option>
						<option>硕士</option>
						<option>博士</option>
					</select>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-2 updateInfoLabel">
					<label>工作经验：</label>
				</div>
				<div class="col-sm-3">
					<select class="form-control selectpicker" name="scale">
						<option>全部</option>
						<option>无经验下</option>
						<option>应届毕业生</option>
						<option>1年以上</option>
						<option>2年以上</option>
						<option>3年以上</option>
						<option>4年以上</option>
						<option>5年以上</option>
						<option>6年以上</option>
						<option>8年以上</option>
						<option>10年以上</option>
					</select>
				</div>
				<div class="col-sm-offset-2 col-sm-2 updateInfoLabel">
					<button type="submit" name="Submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;搜&nbsp;&nbsp;&nbsp;&nbsp;索&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>