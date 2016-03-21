<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="jsprecruitment.util.*,jsprecruitment.entity.*"%>
<%@page import="java.sql.*,java.io.*,java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../js/util/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../js/util/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/util/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/sidebar.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.css.map">
<style type="text/css">
#filter {
	width: 90%;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	font-size: 12px;
	display: block;
	padding-bottom: 20px;
}

#filter dl {
	clear: both;
	border-bottom: 1px solid #ebebeb;
}

#filter dl dt {
	float: left;
	width: auto;
	height: 14px;
	padding: 0 0 4px 0;
	font-weight: bold;
	color: #333333;
	margin: 10px 0 5px 0;
	font-size: larger;
}

#filter dl dd {
	float: left;
	width: auto;
	padding: 0;
	color: #005AA0;
	margin: 10px 8px 5px 0;
}

#filter a {
	cursor: pointer;
	font-size: larger;
}

.seling {
	background-color: #005AA0;
	color: #FFFFFF;
}

.seled {
	background-color: #005AA0;
	color: #FFFFFF;
}
</style>
</head>

<body class="container" align="center">
	<div class="row regTitle">
		<font color="red"><strong>搜索职位信息</strong></font>
	</div>
	<div class="filter_box" id="talentList">
		<div id="filter">
			<dl>
				<dt>招聘行业：</dt>
				<dd>
					<div>
						<a>全部</a>
					</div>
				</dd>
				<%
					DBConn con = new DBConn();
					DataBaseOperation dbo = new DataBaseOperation();
					ResultSet industryrs = con.getRs("SELECT * FROM t_industry");
					while (industryrs.next()) {
				%>
				<dd>
					<div>
						<a><%=industryrs.getString(2)%></a>
					</div>
				</dd>

				<%
					}
				%>
			</dl>
			<dl>
				<dt>工作省份：</dt>
				<dd>
					<div>
						<a>全部</a>
					</div>
				</dd>
				<%
					ResultSet wdrs = con.getRs("SELECT name FROM t_city where id between 2 and 35");
					while (wdrs.next()) {
				%>
				<dd>
					<div>
						<a><%=wdrs.getString(1)%></a>
					</div>
				</dd>

				<%
					}
				%>
			</dl>
			<dl>
				<dt>薪水待遇：</dt>
				<dd>
					<div>
						<a>全部</a>
					</div>
				</dd>
				<%
					ResultSet salaryrs = con.getRs("SELECT * FROM t_filter where keyid =34");
					while (salaryrs.next()) {
				%>
				<dd>
					<div>
						<a><%=salaryrs.getString(3)%></a>
					</div>
				</dd>
				<%
					}
				%>
			</dl>
			<dl>
				<dt>学历要求：</dt>
				<dd>
					<div>
						<a>全部</a>
					</div>
				</dd>
				<%
					ResultSet educationrs = con.getRs("SELECT * FROM t_filter where keyid =38");
					while (educationrs.next()) {
				%>
				<dd>
					<div>
						<a><%=educationrs.getString(3)%></a>
					</div>
				</dd>
				<%
					}
				%>
			</dl>
			<dl>
				<dt>工作经验：</dt>
				<dd>
					<div>
						<a>全部</a>
					</div>
				</dd>
				<%
					ResultSet experiencers = con.getRs("SELECT * FROM t_filter where keyid =10");
					while (experiencers.next()) {
				%>
				<dd>
					<div>
						<a><%=experiencers.getString(3)%></a>
					</div>
				</dd>
				<%
					}
				%>
			</dl>
		</div>
	</div>
	<%
		String industry = null;
		String workDistrict = null;
		String salary = null;
		String experience = null;
		String education = null;
		Date date = new Date();
		int year = date.getYear();
		PrintWriter out1 = response.getWriter();
		industry = request.getParameter("industry");
		workDistrict = request.getParameter("workDistrict");
		salary = request.getParameter("salary");
		experience = request.getParameter("experience");
		education = request.getParameter("education");
		String selectSql = null;
		if (industry != null && workDistrict != null && salary != null && experience != null && education != null) {
			industry = industry != null && !industry.equals("")
					? java.net.URLDecoder.decode(industry, "utf-8")
					: "";
			workDistrict = workDistrict != null && !workDistrict.equals("")
					? java.net.URLDecoder.decode(workDistrict, "utf-8")
					: "";
			salary = salary != null && !salary.equals("") ? java.net.URLDecoder.decode(salary, "utf-8") : "";
			experience = experience != null && !experience.equals("")
					? java.net.URLDecoder.decode(experience, "utf-8")
					: "";
			education = education != null && !education.equals("")
					? java.net.URLDecoder.decode(education, "utf-8")
					: "";
			selectSql = "select * from t_resume where ";
			if (industry.equals("全部")) {
				selectSql += " 1=1 and ";
			} else {
				selectSql += " industry='" + industry + "' and ";
			}
			if (workDistrict.equals("全部")) {
				selectSql += " 1=1 and ";
			} else {
				selectSql += " district='" + workDistrict + "' and ";
			}
			if (salary.equals("全部")) {
				selectSql += " 1=1 and ";
			} else {
				selectSql += " expectedSalary='" + salary + "' and ";
			}
			if (experience.equals("全部")) {
				selectSql += " 1=1 and ";
			} else {
				selectSql += " experience='" + experience + "' and ";
			}
			if (education.equals("全部")) {
				selectSql += " 1=1 ";
			} else {
				selectSql += " education='" + education + "'";
			}
			System.out.println(selectSql);

		} else {
			selectSql = "select * from t_resume ";
		}
		System.out.println(selectSql);
		ResultSet resultset = con.getRs(selectSql);

		//	System.out.println("resultset:"+resultset.next());
		while (resultset.next()) {
			String resumeId=resultset.getString(1);
			String resumeUid=resultset.getString(2);
	%>
	<div class="talent">
		<div class="search_talent_list">
			<div class="search_talent_list_font">
				<a
					href="../jobseeker/ViewResume.jsp?resumeId=<%=resultset.getString(1)%>"
					target="mainFrame" class="disc_talent fl"><%=resultset.getString(5)%></a>
				<span class="fl disc_talent_mes"><%=resultset.getString(4)%>,<%=year - resultset.getDate(7).getYear()%>岁</span>
			</div>
			<div class="disc_job_pay">
				期望薪资：<%=resultset.getString(17)%>
			</div>
			<div class="clear"></div>
			<div class="disc_talent_detail">
				<span class="search_talent_list_box">意向：<em
					class="search_talent_list_box_em"><%=resultset.getString(13)%></em></span>
				<span class="search_talent_list_box_line">|</span> <span
					class="search_talent_list_box">更新时间：<em
					class="search_talent_list_box_em"><%=resultset.getString(19)%></em></span>
				<span class="search_talent_list_box_line">|</span><span
					class="search_talent_list_box">经验：<em
					class="search_talent_list_box_em"><%=resultset.getString(8)%></em></span>
				<span class="search_talent_list_box_line">|</span> <span
					class="search_talent_list_box">学历：<em
					class="search_talent_list_box_em"><%=resultset.getString(10)%></em></span>

			</div>
			<div class="interview_btn_align">
				<button class="interview_btn" onclick="window.location.href='JobInterview.jsp?resumeId=<%=resumeId%>&&resumeUid=<%=resumeUid%>&&jobName=全部职位'">邀请面试</button>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%
		}
	%>


	<!--滚动展示内容-->
	<SCRIPT>
		$(function() {
			console.log(decodeURI(decodeURI(window.location.href)));

			//选中filter下的所有a标签，为其添加hover方法，该方法有两个参数，分别是鼠标移上和移开所执行的函数。  
			$("#filter a").hover(function() {
				$(this).addClass("seling");
			}, function() {
				$(this).removeClass("seling");
			});

			//选中filter下所有的dt标签，并且为dt标签后面的第一个dd标签下的a标签添加样式seled。(感叹jquery的强大)  
			$("#filter dt+dd a").attr("class", "seled");
			var urlData = GetUrlData();
			console.log(urlData);
			$("#filter a").each(function(index, item, arr) {
				if (urlData.indexOf($(item).html()) !== -1) {
					$(this).parents("dl").children("dd").each(function() {
						//	$('a', item).removeClass("seled");
						$(this).find("a").removeClass("seled");
					});
					$(item).attr("class", "seled");
				}
			});

			//为filter下的所有a标签添加单击事件  
			$("#filter a").click(function() {
				$(this).parents("dl").children("dd").each(function() {
					//下面三种方式效果相同（第三种写法的内部就是调用了find()函数，所以，第二、三种方法是等价的。）  
					//$(this).children("div").children("a").removeClass("seled");  
					//$(this).find("a").removeClass("seled");  
					$('a', this).removeClass("seled");
				});

				$(this).attr("class", "seled");
				$(this).attr("id", $(this).html());
				//	alert($(this).attr("id"));
				//	alert(RetSelecteds()); //返回选中结果  
				window.location.href = RetSelecteds();

			});
			//	alert(RetSelecteds()); //返回选中结果  
		});

		function RetSelecteds() {
			var result = "SearchTalent.jsp?";
			var array = [ "industry", "workDistrict", "salary", "education",
					"experience" ];
			var i = 0;
			$("#filter a[class='seled']").each(
					function() {
						var s = $(this).html() != '' ? encodeURI(encodeURI($(
								this).html())) : encodeURI(encodeURI("全部"));
						if (i < 4) {
							result += array[i] + "=" + s + "&&";
						} else {
							result += array[i] + "=" + s;
						}

						i++;
					});
			//result += "#talentList";
			return result;
		}

		function GetUrlData() {
			var array = [ "industry", "workDistrict", "salary", "education",
					"experience" ];
			var url = location.search;
			var request = new Object();
			var urlData = new Array(5);
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&&");
				for (var i = 0; i < strs.length; i++) {
					request[strs[i].split("=")[0]] = unescape(decodeURI(decodeURI(strs[i]
							.split("=")[1])));
				}
			}
			for (var i = 0; i <= 4; i++) {
				urlData[i] = request[array[i]];
			}
			return urlData;
		}
	</script>

</body>
</html>