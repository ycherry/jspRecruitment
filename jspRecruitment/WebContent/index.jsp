<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<%@page import="jsprecruitment.util.*,jsprecruitment.entity.*"%>
<%@page import="java.sql.ResultSet"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	Jobseeker jobseeker = new Jobseeker();
	Company company = new Company();
	Admin admin = new Admin();
	String jobseekerId = null;
	String companyId = null;
	String adminName = null;
	if (request.getSession(false) != null) {
		System.out.println("第一步");
		if (((Company) request.getSession().getAttribute("company")) != null
				&& (((Company) request.getSession().getAttribute("company"))).getId() != null) {
			company = (Company) request.getSession().getAttribute("company");
			companyId = company.getId();
		} else
			if (((Jobseeker) request.getSession().getAttribute("jobseeker")) != null
					&& (((Jobseeker) request.getSession().getAttribute("jobseeker"))).getId() != null) {
			jobseeker = (Jobseeker) request.getSession().getAttribute("jobseeker");
			jobseekerId = jobseeker.getId();
		} else
				if (((Admin) request.getSession().getAttribute("admin")) != null
						&& (((Admin) request.getSession().getAttribute("admin"))).getUserName() != null) {
			admin = (Admin) request.getSession().getAttribute("admin");
			adminName = admin.getUserName();
		}
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jsp人才系统_最新招聘信息_找工作</title>
<meta name="keywords" content="jsp人才系统，招聘，招聘网，找工作" />
<link rel="stylesheet" href="css/style/css.css" type="text/css" />
<link rel="stylesheet" href="css/style/index.css" type="text/css" />
<script src="js/util/jquery-1.8.0.min.js" language="javascript"></script>
<script src="js/layer/layer.min.js" language="javascript"></script>
<script src="js/util/lazyload.min.js" language="javascript"></script>
<script src="js/public.js" language="javascript"></script>
<script src="js/reg_ajax.js" type="text/javascript"></script>
<script src="js/index.js" language="javascript"></script>
<script src="js/search.js" type="text/javascript"></script>
<script src="js/util/slides.jquery.js" type="text/javascript"></script>
</head>
<body class="index_body_box">
	<div class="top">
		<div class="top_cot">
			<div class="top_cot_content">
				<div class="top_left fl">
					<div class="yun_welcome fl">欢迎来到jsp人才系统！</div>
				</div>
				<div class="top_right_re fr">
					<div class="top_right">
						<div class=" fr">
							<div class="yun_topLogin_cont">
								<%
									if (company.getUserName() == null && jobseeker.getUserName() == null && admin.getUserName() == null) {
								%>
								<div class="yun_topLogin">
									<a class="yun_More" href="javascript:void(0)">用户登录</a>
									<ul class="yun_Moredown" style="display: none">
										<li><a href="login.jsp">会员登录</a></li>
									</ul>
								</div>
								<%
									} else if (company.getUserName() != null) {
								%>
								<div class="yun_topLogin">
									<a class="yun_More" href="company/index.jsp"><%=company.getUserName()%>欢迎！</a>
								</div>
								<%
									} else if (jobseeker.getUserName() != null) {
								%>
								<div class="yun_topLogin">
									<a class="yun_More" href="jobseeker/index.jsp"><%=jobseeker.getUserName()%>您好！</a>
								</div>
								<%
									} else if (admin.getUserName() != null) {
								%>
								<div class="yun_topLogin">
									<a class="yun_More" href="admin/index.jsp"><%=admin.getUserName()%>您好！</a>
								</div>
								<%
									}
								%>
								<div class="yun_topLogin">
									<a class="yun_More" href="javascript:void(0)">用户注册</a>
									<ul class="yun_Moredown fn-hide" style="display: none">
										<li><a href="jobseeker/reg.html">个人注册</a></li>
										<li><a href="company/reg.html">企业注册</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<!--滚动展示内容-->
	<script>
		$(document).ready(
				function() {
					$("#slides").slides({
						preload : true,
						preloadImage : 'images/loading.gif',
						play : 5000,
						pause : 2500,
						hoverPause : true
					});
					$('.index_header_seach_find').delegate('#search_name',
							'click', function() {
								$(this).next().show();
							});
					$("img.lazy").lazyload();
					top_search('job', '找工作', 'jobseeker/SearchJob.jsp', '1', 'job'); 
					$('#search').attr('name', 'c');
				});
	</script>
	<!--content  start-->
	<div class="index_body">
		<div class="index_w1000">
			<%
				DataBaseOperation data = new DataBaseOperation();
				DBConn dbc = new DBConn();
			%>
			<div class="index_search fl">
				<form action="" method="get"
					onsubmit="search_keyword(this,'<%=jobseekerId%>','<%=companyId%>','<%=adminName%>');"
					id="index_search_form">
					<div class="index_search_box">
						<div class="index_search_t">
							<input type="hidden" value="job" id="m" /> <input type="hidden"
								name="c" value="search" id="search" /> <input type="text"
								id="keyword" name="keyword" class="index_serch_text" value=''
								placeholder='请输入要搜索的关键字' />
						</div>
						<div class="index_header_seach_find">
							<span id='search_name'>找人才</span>
							<div class="index_header_seach_find_list" style="display: none">
								<a href="javascript:void(0)"
									onclick="top_search('job', '找工作', 'jobseeker/SearchJob.jsp', '1', 'job'); $('#search').attr('name', 'c');"
									target="_blank">找工作</a> <a href="javascript:void(0)"
									onclick="top_search('resume', '找人才', 'company/SearchTalent.jsp', '1', 'resume'); $('#search').attr('name', 'c');"
									target="_blank"> 找人才</a><a href="javascript:void(0)"
									onclick="top_search('company', '找企业', 'jobseeker/SearchCompany.jsp', '1', 'company'); $('#search').attr('name', 'c');"
									target="_blank"> 找企业</a>
							</div>
						</div>
						<div class="index_serch_bth_b">
							<input type="submit" value="搜 索" class="index_serch_bth" />
						</div>
					</div>
				</form>
			</div>
			<div class="clear"></div>
			<div class="index_Emergency_job">
				<div class="Latest_talent_h1 ">
					<b><i
						class="Latest_talent_h1_icon Latest_talent_h1_icon_new png"></i>最新职位</b><a
						href="javascript:void(0)"
						onclick="more('<%=jobseekerId%>','<%=companyId%>','<%=adminName%>','jobs')"
						class="index_more" target="_blank">更多>></a>
				</div>
				<div class="Recommended_jobs_cont">
					<div class="Latest_talent_cont_box">
						<%
							String selectJobSql = "select * from t_company_job order by addTime desc limit 0,6";
							ResultSet jobrs = dbc.getRs(selectJobSql);
							while (jobrs.next()) {
						%>
						<div class="com_index_rue_list fl">
							<dl style="border-bottom: 0px; padding-bottom: 0px">
								<dd id="com_index_rue_list2">
									<div class="com_index_rue_list_t">
										<strong class="fl"><a class="cblue blod"
											href="javascript:void(0)"
											onclick="viewDetail('<%=jobseekerId%>','<%=companyId%>','<%=adminName%>',<%=jobrs.getString("id")%>,'job')"
											target="_blank"><%=jobrs.getString("position")%></a></strong> <span
											class="com_index_rue_list_date fr"><%=jobrs.getString("addTime")%></span>
									</div>
									<div class="com_index_rue_list_yx">
										<a href="javascript:void(0)"
											onclick="viewDetail('<%=jobseekerId%>','<%=companyId%>','<%=adminName%>','<%=jobrs.getString("cid")%>','company')"><%=jobrs.getString("companyName")%></a>
									</div>
									<div class="com_index_rue_list_t index_talent">
										<span class="com_index_rue_listspan">￥</span> <em
											class="com_index_rue_list_xz f60"><%=jobrs.getString("salary")%></em>
									</div>
									<div class="com_index_rue_list_t index_exper">
										<div class="com_index_rue_listspan experience">
											<span>经验：</span>
										</div>
										<div
											class="com_index_rue_list_xz com_index_rue_list_jy f61 experience_value">
											<em><%=jobrs.getString("experience")%></em>
										</div>
									</div>
								</dd>
							</dl>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<div class="index_Emergency_job">
				<div class="Featured_Jobs_bg1">
					<div class="Latest_talent_h1">
						<b><i
							class="Latest_talent_h1_icon Latest_talent_h1_icon_new_post png"></i>知名企业</b><a
							href="http://127.0.0.1/recruitment/upload/job/index.php?c=search"
							class="index_more" target="_blank">更多>></a>
					</div>
					<div class="Recommended_jobs_cont">
						<div class="Latest_talent_cont_box">
							<%
							//	String selectJobSql1 = "select *,count(distinct t_company_job.cid=t_company.id) from t_company,t_company_job where t_company_job.cid=t_company.id and position is not null and updateTime is not null order by firstUpdateTime desc limit 0,6";
							String selectJobSql1 = "select * from t_company where id in (select distinct(cid) from t_company_job)";
								ResultSet companyrs = dbc.getRs(selectJobSql1);
								while (companyrs.next()) {
							%>
							<div class="com_index_rue_list fl">
								<dl style="border-bottom: 0px; padding-bottom: 0px">
									<dd id="com_index_rue_list2">
										<div class="com_index_rue_list_t">
											<strong class="fl"><a class="cblue blod"
												href="javascript:void(0)"
												onclick="viewDetail('<%=jobseekerId%>','<%=companyId%>','<%=adminName%>',<%=companyrs.getString("id")%>,'job')"
												target="_blank"><%=companyrs.getString("companyName")%></a></strong>
										</div>
										<%
											String cjobSelect = "select * from t_company_job where position is not null and cid='"
														+ companyrs.getString("id") + "' limit 0,2";
												ResultSet cjobrs = dbc.getRs(cjobSelect);
												while (cjobrs.next()) {
										%>
										<div class="com_index_rue_list_yx">
											<a href="javascript:void(0)"
												onclick="viewDetail('<%=jobseekerId%>','<%=companyId%>','<%=adminName%>','<%=cjobrs.getString("cid")%>','company')"><%=cjobrs.getString("position")%></a>
											<div class="fr">
												<span>￥</span> <em class="com_index_rue_list_xz f60"><%=cjobrs.getString("salary")%></em>
											</div>
										</div>
										<%
											}
										%>
									</dd>

								</dl>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="index_Emergency_job">
				<div class="Latest_talent_h1 ">
					<b><i
						class="Latest_talent_h1_icon Latest_talent_h1_icon_user png"></i>最新人才</b><a
						href="javascript:void(0)"
						onclick="more('<%=jobseekerId%>','<%=companyId%>','<%=adminName%>','talents')"
						class="index_more" target="_blank">更多>></a>
				</div>

				<div class="Latest_talent_cont">
					<%
						String selectTalent = "select  * from t_resume where updateTime is not null order by firstUpdateTime desc limit 0,6";
						ResultSet talentrs = dbc.getRs(selectTalent);
						while (talentrs.next()) {
					%>
					<div class="Latest_talent_cont_box">
						<div class="com_index_rue_list fl">
							<dl>
								<dt>
									<img width="24" height="30"
										data-original="data/logo/20141210/14204024737.JPG"
										class="lazy" src=""
										onerror="showImgDelay(this,'http://127.0.0.1/recruitment/upload/data/logo/20141210/14204024737.JPG',2);" />
								</dt>
								<dd>
									<%
										String name = null;
											if (talentrs.getString("gender").equals("女")) {
												name = talentrs.getString("fullName").charAt(0) + "女士";

											} else if (talentrs.getString("gender").equals("男")) {
												name = talentrs.getString("fullName").charAt(0) + "先生";
											}
									%>
									<div class="com_index_rue_list_t">
										<strong class="fl"><a class="cblue blod"
											href="javascript:void(0)"
											onclick="viewDetail('<%=jobseekerId%>','<%=companyId%>','<%=adminName%>',<%=talentrs.getString("id")%>,'talent')"
											target="_blank"><%=name%></a></strong> <span
											class="com_index_rue_list_date fr"><%=talentrs.getString("updateTime")%></span>
									</div>
									<div class="com_index_rue_list_t index_talent">
										<span class="com_index_rue_listspan">￥</span> <em
											class="com_index_rue_list_xz f60"><%=talentrs.getString("expectedSalary")%></em>
									</div>
									<div class="com_index_rue_list_t index_exper">
										<div class="com_index_rue_listspan experience">
											<span>经验：</span>
										</div>
										<div
											class="com_index_rue_list_xz com_index_rue_list_jy f61 experience_value">
											<em><%=talentrs.getString("experience")%></em>
										</div>

									</div>
								</dd>
							</dl>
							<div class="com_index_rue_list_yx">
								<span class="com_index_rue_listspan">意向职位：</span><%=talentrs.getString("intentionJobs")%>
							</div>
						</div>
					</div>
					<%
						}
						dbc.close();
					%>
				</div>

			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--foot  start-->
	<div class="clear"></div>
	<div class="footer">
		<div class="foot">
			<div class="foot_conent">
				<div class="footer_left">
					<dl class="footer_list">
						<dt>关于我们</dt>
						<dd>
							<ul>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/index.html"
									title="关于我们">关于我们</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/service.html"
									title="注册协议">注册协议</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/phpyun.html"
									title="法律声明">法律声明</a></li>
							</ul>
							<dd>
					</dl>
					<dl class="footer_list">
						<dt>支付信息</dt>
						<dd>
							<ul>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/yh.html"
									title="银行帐户">银行帐户</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/pinpai.html"
									title="品牌推广">品牌推广</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/charge.html"
									title="收费标准">收费标准</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/indexzy.html"
									title="经营资源">经营资源</a></li>
							</ul>
							<dd>
					</dl>
					<dl class="footer_list">
						<dt>网站特色</dt>
						<dd>
							<ul>
								<li><a href="m_redeem.html" title="积分兑换">积分兑换</a></li>
								<li><a href="index.php?m=subscribe" title="订阅服务">订阅服务</a></li>
							</ul>
							<dd>
					</dl>
					<dl class="footer_list">
						<dt>咨询反馈</dt>
						<dd>
							<ul>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/kf.html"
									title="客服中心">客服中心</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/gg.html"
									title="广告投放">广告投放</a></li>
								<li><a
									href="http://127.0.0.1/recruitment/upload/about/newuser.html"
									title="新手指引">新手指引</a></li>
							</ul>
							<dd>
					</dl>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--foot  end-->
	<div id="bg" style=""></div>
	<div id="uclogin" style="display: none"></div>
</body>
</html>

<script>
	function more(jobseekerId,companyId,adminName,pathName){
		console.log("jobseekerId:"+jobseekerId+" companyId:"+companyId+" adminName:"+adminName);
		if(jobseekerId=="null"&& companyId=="null"&&  adminName=="null"){
		   alert("请先登录！");
		   return;
		}else{
			if(pathName=="talents"){
			    window.open("company/SearchTalent.jsp");
			}else if(pathName=="jobs"){
				window.open("jobseeker/SearchJob.jsp");
			}	
		}		
	}
	function viewDetail(jobseekerId,companyId,adminName,id,pathName){
		console.log("jobseekerId:"+jobseekerId+" companyId:"+companyId+" adminName:"+adminName);
		if(jobseekerId=="null"&& companyId=="null"&&  adminName=="null"){
		   alert("请先登录！");
		   return;
		}else{
			if(pathName=="job"){
				 window.open("company/ViewJob.jsp?jobId="+id);
		    }else if(pathName=="talent"){
		    	window.open("jobseeker/ViewResume.jsp?resumeId="+id);
		    }else if(pathName=="company"){
		    	window.open("company/ViewCompany.jsp?cid="+id);
			}
		}
	}
	
</script>