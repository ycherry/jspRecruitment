<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="jsprecruitment.util.*,jsprecruitment.entity.*,javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.sql.*,java.util.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http=equiv= "Content=Type " content="text/html; charset=UTF-8">
<title>发布求职信息</title>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
</head>
<body>
	<form role="form" method="post" id="pubJobForm"
		action="../UpdateJobServlet">
		<%
			String intId = null;
			intId = (String) request.getParameter("intId");
			Job job = new Job();
			if (intId != null) {
				DBConn dbc = new DBConn();
				Statement at = dbc.getStmtread();
				String sql = "select * from t_company_job where id='" + intId
						+ "'";
				System.out.println(sql);
				ResultSet rs = dbc.getRs(sql);
				while (rs.next()) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date utilDate = sdf.parse(rs
							.getObject("deadline").toString());
					java.sql.Date sqlDate = new java.sql.Date(
							utilDate.getTime());
					job.setJobId(intId);
					job.setAmount(rs.getObject("amount").toString());
					job.setCompanyName(rs.getObject("companyName").toString());
					job.setContents(rs.getObject("contents").toString());
					job.setDeadline(sqlDate);
					job.setDistrict(rs.getObject("district").toString());
					job.setEducation(rs.getObject("education").toString());
					job.setExperience(rs.getObject("experience").toString());
					job.setPosition(rs.getObject("position").toString());
					job.setSalary(rs.getObject("salary").toString());
				}
			}
		%>
		<div class="container" align="center">
			<div class="row regTitle">
				<font color="red"><strong>修改招聘信息 </strong></font>
			</div>
			<input type="hidden" name="intId" value=<%=intId%>>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>职位名称:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="position"
						id="position" placeholder="请输入职位名称（必填）"
						value=<%=job.getPosition() != null ? job.getPosition() : ' '%>>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>招聘人数:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="amount" id="amount"
						placeholder="请输入招聘人数（必填）"
						value=<%=job.getAmount() != null ? job.getAmount() : ' '%>>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>工作地区:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="district"
						id="distinct" placeholder="请输入工作地区（必填）"
						value=<%=job.getDistrict() != null ? job.getDistrict() : ' '%>>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>学历要求:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="education">
						<option hidden="true"><%=job.getEducation() != null ? job.getEducation() : "不限"%></option>
						<option>不限</option>
						<option>初中及以下</option>
						<option>高中/中技/中专</option>
						<option>大专</option>
						<option>本科</option>
						<option>硕士</option>
						<option>博士</option>
					</select>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>工作年限:</label>
				</div>
				<div class="col-sm-6">
					<select class="form-control selectpicker" name="experience">
						<option hidden="true"><%=job.getExperience() != null ? job.getExperience() : "不限"%></option>
						<option>不限</option>
						<option>无经验</option>
						<option>1-3年</option>
						<option>3-5年</option>
						<option>5-10年</option>
						<option>10年以上</option>
					</select>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>薪水范围:</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="salary" id="salary"
						placeholder="请输入职位薪水（必填）"
						value=<%=job.getSalary() != null ? job.getSalary() : ' '%>>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3 ">
					<label>有效时间:</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control" name="deadline"
						id="deadline" placeholder="请输入有效时间，例如：xxxx-xx-xx（年-月-日）（必填）"
						value=<%=job.getDeadline() != null ? job.getDeadline() : ' '%>>
				</div>
			</div>
			<div class="row updateInfoLabel">
				<div class="col-sm-offset-1 col-sm-3">
					<label>职位描述:</label>
				</div>
				<div class="col-sm-6">
					<textarea class="form-control" rows="4" cols="12"
						placeholder="请输入职位要求" name="contents" id="contents"><%=job.getContents() != null ? job.getContents() : ' '%></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-offset-3 col-sm-3">
					<button type="submit" name="Submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
				<div class="col-sm-offset-1 col-sm-3">
					<button type="reset" name="reset" class="btn btn-default">&nbsp;&nbsp;&nbsp;&nbsp;重&nbsp;&nbsp;&nbsp;&nbsp;置&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			/*					jQuery.validator
										.addMethod(
												"isValidDate",
												function(val, element) {
													var date = /^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/;
													return this.optional(element)
															|| date.test(val);
												}, "请输入正确格式的日期！");
			 */

			$("#pubJobForm").validate({
				rules : {
					position : {
						required : true
					},
					amount : {
						required : true
					},
					district : {
						required : true
					},
					salary : {
						required : true
					},
					deadline : {
						required : true,
						//		isValidDate : true,
						date : true
					}
				},
				messages : {
					position : {
						required : "行业名称不能为空！"
					},
					amount : {
						required : "招聘人数不能为空 !"
					},
					district : {
						required : "工作地区不能为空!"
					},
					salary : {
						required : "薪水不能为空！"
					},
					deadline : {
						required : "截止时间不能为空！",
						//			isValidDate : "请输入正确的日期格式!",
						date : "请输入正确的日期格式!"
					}
				}
			});
		});
	</script>
</body>
</html>