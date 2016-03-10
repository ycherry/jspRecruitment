<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/util/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../js/util/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
</head>
<body>
	<%
		DBConn dbc = new DBConn();
		Jobseeker jobseeker = (Jobseeker) request.getSession().getAttribute("jobseeker");
		Statement at = dbc.getStmtread();
		String sql = "select * from t_resume where userName =" + "'" + jobseeker.getUserName() + "'";
		ResultSet rs = dbc.getRs(sql);
		System.out.println(sql);
		while (rs.next()) {
			jobseeker.setFullName(rs.getString(5));
			jobseeker.setAddress(rs.getString(9));
			jobseeker.setBirthday(rs.getDate(7));
			jobseeker.setEducation(rs.getString(10));
			jobseeker.setEmail(rs.getString(12));
			jobseeker.setExperience(rs.getString(8));
			jobseeker.setIndustry(rs.getString(6));
			jobseeker.setIntentionJobs(rs.getString(13));
			jobseeker.setPhoto(rs.getString(15));
			jobseeker.setGender(rs.getString(4));
			jobseeker.setSpecialty(rs.getString(14));
			jobseeker.setTelphone(rs.getString(11));
		}
	%>
	<form role="form" name="buildResumeForm" id="buildResumeForm"
		method="post" action="../BuildResumeFormServlet" target="mainFrame"
		bgcolor="#F5f7f7">
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>修改个人简历信息</strong></font>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3  updateInfoLabel">
					<label>真实姓名:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="fullName"
						placeholder="请输入您的公司地址（必填）"
						value=<%=jobseeker.getFullName() == null ? ' ' : jobseeker.getFullName()%>>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3  updateInfoLabel">
					<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
				</div>
				<div class="col-sm-3">
					<%
						if (jobseeker.getGender().compareTo("男") == 0) {
					%>
					<label class="radio-inline"><input type="radio"
						name="gender" id="male" value="男" checked="checked">男</label> <label
						class="radio-inline"><input type="radio" name="gender"
						id="female" value="女">女</label>
					<%
						} else {
					%>
					<label class="radio-inline"><input type="radio"
						name="gender" id="male" value="男" >男</label> <label
						class="radio-inline"><input type="radio" name="gender"
						id="female" value="女" checked="checked">女</label>
					<%
						}
					%>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>出生时间:</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control" name="deadline"
						id="deadline" placeholder="请输入生日，例如：xxxx-xx-xx（年-月-日）（必填）"
						value=<%=jobseeker.getBirthday()%>>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>从事行业:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="industry">
						<%
							if (jobseeker.getIndustry()!= null) {
						%>
						<option data-hidden="true"><%=jobseeker.getIndustry()%></option>
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
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>工作年限:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="experience">
						<option hidden="true"><%=jobseeker.getExperience() != null ? jobseeker.getExperience() : "不限"%></option>
						<option>不限</option>
						<option>无经验</option>
						<option>1-3年</option>
						<option>3-5年</option>
						<option>5-10年</option>
						<option>10年以上</option>
					</select>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>期望行业:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="telphone"
						placeholder="请输入您的期望行业"
						value=<%=rs.getString(13) %>>
				</div>
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>期待薪水:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="salary">
						<option>不限</option>
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
			</div>
			<div class="row updateDiv">
				<div class="col-sm-3 updateInfoLabel">
					<label>学历状态:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="education">
						<option>不限</option>
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