<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
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
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body >
	<%
		DBConn dbc = new DBConn();
		Company company = (Company) request.getSession().getAttribute("company");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_company where userName =" + "'" + company.getName() + "'";
		ResultSet rs = dbc.getRs(sql);
		System.out.println(sql);
		while (rs.next()) {
			System.out.println(rs.getString(3));
	%>
	<form role="form" name="updateCompnyInfoForm" method="post"
		action="reginfo.jsp" novalidate bgcolor="#F5f7f7">
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
						placeholder="请输入您的企业名称（必填）">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>公司性质:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control" name="nature" title="请选择企业性质(必填)" >
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
					<select class="form-control" name="industry" title="请选择行业(必填)" >
					<option>计算机/互联网</option>
					<option>销售/客服/技术支持</option>
					<option>会计/金融/银行/保险</option>
					<option>生产/营运/采购/物流</option>
					<option>生物/制药/医疗/护理</option>
					<option>广告/市场/媒体/艺术</option>		
					<option>建筑/房地产</option>
					<option>人事/行政/高级管理</option>
					<option>咨询/法律/教育/科研</option>
					<option>服务业</option>
					<option>公务员/翻译/其他</option>
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
					<select class="form-control" name="scale" title="请选择企业性质(必填)" >
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
						placeholder="请输入您的联系电话（必填）" >
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>电子邮件:</label>
				</div>
				<div class="col-sm-6">
					<input type="email" class="form-control" name="email"
						placeholder="请输入您的电子邮件（必填）">
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3  updateInfoLabel">
					<label>公司地址:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="address"
						placeholder="请输入您的公司地址（必填）">
				</div>
			</div>
			<div class="row updateDiv">
				<div class=" col-sm-3 updateInfoLabel">
					<label>企业简介:</label>
				</div>
				<div class="col-sm-6">
					<textarea type="text" class="form-control" name="introduction"
						placeholder="请介绍一下您的公司吧"><%=rs.getString(10)%></textarea>
				</div>
			</div>
			<div >
				<div>
					<button type="submit" name="Submit" class="btn btn-primary"
						>&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</form>
	<%
		}
	%>
</body>
</html>
