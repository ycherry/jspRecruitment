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
				&& (((Company) request.getSession().getAttribute(
						"company"))).getId() != null) {
			company = (Company) request.getSession().getAttribute(
					"company");
			companyId = company.getId();
		} else if (((Jobseeker) request.getSession().getAttribute(
				"jobseeker")) != null
				&& (((Jobseeker) request.getSession().getAttribute(
						"jobseeker"))).getId() != null) {
			jobseeker = (Jobseeker) request.getSession().getAttribute(
					"jobseeker");
			jobseekerId = jobseeker.getId();
		} else if (((Admin) request.getSession().getAttribute("admin")) != null
				&& (((Admin) request.getSession().getAttribute("admin")))
						.getUserName() != null) {
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
									if (company.getUserName() == null
											&& jobseeker.getUserName() == null
											&& admin.getUserName() == null) {
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
	<div class="header_fixed" id="header_fix" style="display: none">
		<div class="header_fixed_cont">

			<div class="header_fixed_login">
				<div class="header_fixed_login_l" style="display: block">
					<a href="http://127.0.0.1/recruitment/upload/index.php?m=login"
						style="color: #fff"><span class="header_fixed_login_dl"
						did="login" style="background: none;"> 登录 </span></a>|<span
						class="header_fixed_login_dl" did="register"> 注册
						<div class="header_fixed_reg_box" id="register_t"
							style="display: none">
							<a
								href="http://127.0.0.1/recruitment/upload/index.php?m=register&usertype=1"
								class="header_fixed_login_a">个人注册</a> <a
								href="http://127.0.0.1/recruitment/upload/index.php?m=register&usertype=2"
								class="header_fixed_login_a">企业注册</a>
						</div>
					</span>
				</div>
			</div>
		</div>
	</div>
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
				});
	</script>
	<!--content  start-->
	<div class="index_body">
		<div class="index_w1000">
			<div class="index_nav_left">
				<div class="index_nav">
					<div class="index_nav_tit">
						<a href="javascript:void(0);" id="navMenu"><span
							class="index_nav_tit_name">全部职位分类</span><i
							class="index_nav_tit_icon png"></i></a>
					</div>

					<div class="pos" id="boxNav" style="display: black;">
						<div class="lst" id="navLst">
							<ul>
								<%
									DataBaseOperation data = new DataBaseOperation();
									String sql = null;
									sql = "select * from t_jobclass where keyid= 0 ";
									DBConn dbc = new DBConn();
									ResultSet rs = dbc.getRs(sql);
									while (rs.next()) {
										System.out.println(rs.getString(3));
								%>
								<li><i></i> <a class="index_nav_l"
									href="http://127.0.0.1/recruitment/upload/job/?c=search&job1=35">
										<p class="lnk"><%=rs.getString("name")%></p> <i
										class="index_nav_icon"></i>
								</a>
									<div style="top: -38px;" class="posBox">
										<div class="posJobSort">
											<div class="l">
												<dl class=''>
													<dd>
														<%
															String subsql = "select * from t_jobclass where keyid='"
																		+ rs.getString("id") + "'";
																ResultSet subrs = dbc.getRs(subsql);
																while (subrs.next()) {
														%>
														<a
															href="http://127.0.0.1/recruitment/upload/job/?c=search&job1=35&job1_son=50&job_post=166"
															target="_blank"><%=subrs.getString("name")%></a>
														<%
															}
														%>
													</dd>
												</dl>
											</div>
										</div>
									</div></li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="index_search fl">
				<form action="http://127.0.0.1/recruitment/upload/job/" method="get"
					onsubmit="return search_keyword(this);" id="index_search_form">
					<div class="index_search_box">
						<div class="index_search_t">
							<input type="hidden" value="job" id="m" /> <input type="hidden"
								name="c" value="search" id="search" /> <input type="text"
								id="keyword" name="keyword" class="index_serch_text" value=''
								placeholder='请输入要搜索的关键字' />
						</div>
						<div class="index_header_seach_find">
							<span id='search_name'>找工作</span>
							<div class="index_header_seach_find_list" style="display: none">
								<a href="javascript:void(0)"
									onclick="top_search('job', '找工作', 'http://127.0.0.1/recruitment/upload/job/', '1', 'job'); $('#search').attr('name', 'c');">找工作</a>
								<a href="javascript:void(0)"
									onclick="top_search('resume', '找人才', 'http://127.0.0.1/recruitment/upload/resume/', '1', 'resume'); $('#search').attr('name', 'c');">
									找人才</a>
							</div>
						</div>
						<div class="index_serch_bth_b">
							<input type="submit" value="搜 索" class="index_serch_bth" />
						</div>
					</div>
				</form>
			</div>
			<div class="clear"></div>
			<div class="inbdex_box">
				<div class="index_left_mune">
					<a href="http://127.0.0.1/recruitment/upload/job/"
						class="index_left_mune_a" target="_blank">
						<div>
							<i class="index_left_mune_icon png"></i>
						</div>
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_1.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>找工作</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/resume/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon//i_m_2.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>找人才</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/company/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_3.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>找企业</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/once/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_4.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>微招聘</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/tiny/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_5.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>微简历</dd>
						</dl>
					</a><a href="http://127.0.0.1/recruitment/upload/zph/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_8.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>招聘会</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/tiny/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_5.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>微简历</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/job/"
						class="index_left_mune_a" target="_blank">
						<div>
							<i class="index_left_mune_icon png"></i>
						</div>
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_1.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>找工作</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/company/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img src="images/indexIcon/i_m_3.png" width="28" height="28"
									class="png" />
							</dt>
							<dd>找企业</dd>
						</dl>
					</a>
				</div>
				<div class="cont_Projector">
					<div class="Projector">
						<div id="slides" class="s_lb">
							<div class="slides_container">
								<div class="slide">
									<a href='index.jsp' rel='nofollow'><img
										src='images/zhaopin.jpg' height='215' width='622'></a>
								</div>
							</div>
						</div>
					</div>
				</div>
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
							String selectJobSql = "select * from t_company_job order by addTime desc limit 0,3";
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
					<div class="Famous_recruitment_cont_box">
						<div class="Featured_Jobs">
							<div class="Featured_Jobs_list">
								<dl>
									<dd>
										<div class="Featured_Jobs_t1">
											<a
												href="http://127.0.0.1/recruitment/upload/company/index.php?c=show&id=1"
												class="Featured_Jobs_name fl" target="_blank">鸭鸭</a>
										</div>
										<div class="Featured_Jobs_t2" id="post_index">
											<span> <a
												href="http://127.0.0.1/recruitment/upload/job/index.php?c=comapply&id=1"
												target="_blank" class="Featured_Jobs_name_c">开发</a>
											</span>
										</div>
									</dd>
								</dl>
							</div>
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
						String selectTalent = "select  * from t_resume where updateTime is not null order by firstUpdateTime desc limit 0,3";
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