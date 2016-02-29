<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>修改信息</title>
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
	<%
		DBConn dbc = new DBConn();
		Company company = (Company) request.getSession().getAttribute(
				"company");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_company where userName =" + "'"
				+ company.getUserName() + "'";
		ResultSet rs = dbc.getRs(sql);
		System.out.println(sql);
		while (rs.next()) {
			System.out.println(rs.getString(3));
	%>
	<form role="form" name="updateCompnyInfoForm" id="updateCompnyInfoForm"
		method="post" action="../UpdateCompanyInfoServlet" target="mainFrame"
		bgcolor="#F5f7f7">
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>企业用户修改注册信息</strong></font>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel ">
					<label>企业名称:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="companyName"
						placeholder="请输入您的企业名称（必填）"
						value="<%=rs.getString(2) == null ? "" : rs.getString(2)%>">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>公司性质:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="nature">
						<%
							System.out.println("企业性质" + rs.getString(4) != null);
								if (rs.getString(4) != null) {
						%>
						<option data-hidden="true"><%=rs.getString(4)%></option>
						<%
							}
						%>
						<option>外资企业</option>
						<option>合资企业</option>
						<option>私营企业</option>
						<option>民营企业</option>
						<option>股份制企业</option>
						<option>集体企业</option>
					</select>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>所属行业:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="industry">
						<%
							if (rs.getString(5) != null) {
						%>
						<option data-hidden="true"><%=rs.getString(5)%></option>
						<%
							}
						%>
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
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>公司规模:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="scale">
						<%
							if (rs.getString(8) != null) {
						%>
						<option data-hidden="true"><%=rs.getString(8)%></option>
						<%
							}
						%>
						<option>10人以下</option>
						<option>10-50人</option>
						<option>50-200人</option>
						<option>200-500人</option>
						<option>500-1000人</option>
						<option>1000人以上</option>
					</select>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>联系电话:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="telphone"
						placeholder="请输入您的联系电话（必填）"
						value=<%=rs.getString(7) == null ? ' ' : rs.getString(7)%>>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>电子邮件:</label>
				</div>
				<div class="col-sm-6">
					<input type="email" class="form-control" name="email"
						placeholder="请输入您的电子邮件（必填）"
						value=<%=rs.getString(9) == null ? ' ' : rs.getString(9)%>>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3  updateInfoLabel">
					<label>公司地址:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="address"
						placeholder="请输入您的公司地址（必填）"
						value=<%=rs.getString(6) == null ? ' ' : rs.getString(6)%>>
				</div>
			</div>
			<div class="row updateDiv">
				<div class=" col-sm-3 updateInfoLabel">
					<label>企业简介:</label>
				</div>
				<div class="col-sm-6">
					<textarea type="text" class="form-control" name="introduction"
						placeholder="请介绍一下您的公司吧"><%=rs.getString(10) == null ? ' ' : rs.getString(10)%></textarea>
				</div>
			</div>
			<div>
				<div>
					<button type="submit" name="Submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</form>
	<%
		}
	%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#updateCompnyInfoForm").validate({
				rules : {
					companyName : {
						required : true
					},
					telphone : {
						required : true,
						number : true
					},
					email : {
						required : true,
						email : true
					},
					address : {
						required : true
					}
				},
				messages : {
					companyName : {
						required : "请输入企业名称"
					},
					telphone : {
						required : "请输入联系电话",
						number : "请输入正确的号码格式"
					},
					email : {
						required : "请输入邮箱地址",
						email : "请输入正确的邮箱格式"
					},
					address : {
						required : "请输入地址"
					}
				}
			});
		});
	</script>
</body>
</html>
