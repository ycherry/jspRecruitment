<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="jsprecruitment.util.*,jsprecruitment.entity.*"%>
<%@page import="java.sql.*,java.io.*,java.util.Date"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<link rel="stylesheet" type="text/css" href="../css/style/search.css">
</head>
<%
	String header = request.getHeader("Referer");
	String[] path = header.split("\\?");
	String resourcePage = path[0].substring(21);
	System.out.println("resourcePage:"+resourcePage);
%>
<body class="container" align="center">
	<div class="row regTitle">
		<font color="red"><strong>搜索企业信息</strong></font>
		<div class="disc_search">
			<input type="text" name="keyword" value="" placeholder="请输入要搜索的关键字"
				class="Search_text" id="Search_text"> <input type="button"
				value="搜索" class="Search_submit" onclick="searchCompany()">
		</div>
	</div>
	<div class="filter_box" id="talentList">
		<div id="filter">
			<dl>
				<dt>从事行业：</dt>
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
						<a><%=industryrs.getString("name")%></a>
					</div>
				</dd>

				<%
					}
				%>
			</dl>
			<dl>
				<dt>企业性质：</dt>
				<dd>
					<div>
						<a>全部</a>
					</div>
				</dd>
				<%
					ResultSet naturers = con.getRs("SELECT * FROM t_filter where keyid =19");
					while (naturers.next()) {
				%>
				<dd>
					<div>
						<a><%=naturers.getString("name")%></a>
					</div>
				</dd>
				<%
					}
				%>
			</dl>
			<dl>
				<dt>企业规模：</dt>
				<dd>
					<div>
						<a>全部</a>
					</div>
				</dd>
				<%
					ResultSet scalers = con.getRs("SELECT * FROM t_filter where keyid =26");
					while (scalers.next()) {
				%>
				<dd>
					<div>
						<a><%=scalers.getString("name")%></a>
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
		String nature = null;
		String scale = null;
		String keyword = null;
		java.util.Date date = new java.util.Date();
		int year = date.getYear();
		PrintWriter out1 = response.getWriter();
		industry = request.getParameter("industry");
		nature = request.getParameter("nature");
		scale = request.getParameter("scale");
		if (request.getParameter("keyword") != null
				&& !request.getParameter("keyword").toString().equals("undefined") ) {
			keyword = request.getParameter("keyword");
		}
		String selectSql = null;
		if (keyword != null) {
			keyword = "%" + Encode.getNewString(keyword) + "%";
		}
		if (industry != null && nature != null && scale != null) {
			industry = industry != null && !industry.equals("")
					? java.net.URLDecoder.decode(industry, "utf-8")
					: "";
			nature = nature != null && !nature.equals("") ? java.net.URLDecoder.decode(nature, "utf-8") : "";
			scale = scale != null && !scale.equals("") ? java.net.URLDecoder.decode(scale, "utf-8") : "";
			if (keyword != null) {
				selectSql = "select * from t_company where companyName is not null and companyName like '" + keyword
						+ "' and ";
			} else {
				selectSql = "select * from t_company where companyName is not null and ";
			}
			if (industry.equals("全部")) {
				selectSql += " 1=1 and ";
			} else {
				selectSql += " industry='" + industry + "' and ";
			}
			if (nature.equals("全部")) {
				selectSql += " 1=1 and ";
			} else {
				selectSql += " nature='" + nature + "' and ";
			}
			if (scale.equals("全部")) {
				selectSql += " 1=1 ";
			} else {
				selectSql += " scale='" + scale + "'";
			}
			System.out.println(selectSql);

		} else {
			if (keyword != null) {
				selectSql = "select * from t_company where companyName is not null and companyName like '" + keyword
						+ "'";
			} else {
				selectSql = "select * from t_company where companyName is not null ";
			}
		}
		System.out.println(selectSql);
		ResultSet resultset = con.getRs(selectSql);

		while (resultset.next()) {
	%>
	<div class="talent">
		<div class="search_talent_list">
			<div class="search_talent_list_font">
				<a
					href="../company/ViewCompany.jsp?cid=<%=resultset.getString("id")%>"
					target="mainFrame" class="disc_talent fl"><%=resultset.getString("companyName")%></a>
				<span class="fl disc_talent_mes"><%=resultset.getString("scale") == null ? "暂无" : resultset.getString("scale")%></span>
			</div>
			<div class="clear"></div>
			<div class="disc_talent_detail">
				<span class="search_talent_list_box">行业：<em
					class="search_talent_list_box_em"><%=resultset.getString("industry") == null ? "暂无" : resultset.getString("industry")%></em></span>
				<span class="search_talent_list_box_line">|</span> <span
					class="search_talent_list_box">性质：<em
					class="search_talent_list_box_em"><%=resultset.getString("nature") == null ? "暂无" : resultset.getString("nature")%></em></span>
				<span class="search_talent_list_box_line">|</span><span
					class="search_talent_list_box">联系方式：<em
					class="search_talent_list_box_em"><%=resultset.getString("telphone") == null ? "暂无" : resultset.getString("telphone")%></em></span>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%
		}
		int count = dbo.getRowCount(selectSql);
		if (count <= 0) {
	%>
	<div class="seachno">
		<div class="seachno_left">
			<img src="../images/search-no.gif" width="144" height="102">
		</div>
		<div class="listno-content">
			<strong>很抱歉，没有找到满足条件的企业</strong><br> <span> 建议您：<br>
				1、适当减少已选择的条件<br> 2、适当删减或更改搜索关键字<br>
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

			reset();
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
			if(urlData[1]){
				$("#Search_text").attr("value",urlData[1]);
			}

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
				window.location.href = RetSelecteds();

			});
		});

		function RetSelecteds() {
			var result = "SearchCompany.jsp?";
			var array = [ "industry", "nature", "scale" ];
			var i = 0;
			var urlData = GetUrlData();
			var keyword = $("#Search_text").val();
			var sourcePage="<%=resourcePage%>";
			if (sourcePage=="/jspRecruitment/index.jsp"&&urlData[1]&&!keyword) {
				keyword = urlData[1];
			}
			result += "c=search&keyword=" + keyword + "&";
			$("#filter a[class='seled']").each(
					function() {
						var s = $(this).html() != '' ? encodeURI(encodeURI($(
								this).html())) : encodeURI(encodeURI("全部"));
						if (i < 4) {
							result += array[i] + "=" + s + "&";
						} else {
							result += array[i] + "=" + s;
						}

						i++;
					});
			return result;
		}

		function GetUrlData() {
			var array = [ "c", "keyword", "industry", "nature", "scale" ];
			var url = location.search;
			var request = new Object();
			var urlData = new Array(5);
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&");
				for (var i = 0; i < strs.length; i++) {
					request[strs[i].split("=")[0]] = unescape(decodeURI(decodeURI(strs[i]
							.split("=")[1])));
				}
				for (var i = 0; i < strs.length; i++) {
					urlData[i] = request[array[i]];
				}
			}
		return urlData;
		}
		
		function reset() {
			$("#filter dt+dd a").attr("class", "seled");
		}
		
		function searchCompany() {
			reset();
			window.location.href = RetSelecteds();
		}
	</script>

</body>
</html>