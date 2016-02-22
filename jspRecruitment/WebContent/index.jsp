
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<%@page import="jsprecruitment.util.*"%>
<%@page import="java.sql.ResultSet"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jsp人才系统_最新招聘信息_找工作</title>
<meta name="keywords" content="jsp人才系统，招聘，招聘网，找工作" />
<meta name="description"
	content="phpyun人才系统（http://127.0.0.1/recruitment/upload）大品牌的招聘网站，找工作的理想选择，规模大信息真实的专业招聘网站，查询人才网最新招聘信息，找工作，上phpyun人才系统!" />
<link rel="stylesheet" href="css/style/css.css" type="text/css" />
<link rel="stylesheet" href="css/style/index.css" type="text/css" />
<!--[if IE 6]>
<script src="http://127.0.0.1/recruitment/upload/js/png.js"></script>
<script>
DD_belatedPNG.fix('.png,.pagination li a');
</script>
<![endif]-->
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
								<div class="yun_topLogin">
									<a class="yun_More" href="javascript:void(0)">用户登录</a>
									<ul class="yun_Moredown" style="display: none">
										<li><a href="login.jsp">会员登录</a></li>
									</ul>
								</div>
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
			<ul class="header_fixed_list">
				<li class=""><a
					href="http://127.0.0.1/recruitment/upload/index.php">首页</a></li>
				<li class=""><a href="http://127.0.0.1/recruitment/upload/job/">找工作</a></li>
				<li class=""><a
					href="http://127.0.0.1/recruitment/upload/resume/">找人才</a></li>
				<li class=""><a
					href="http://127.0.0.1/recruitment/upload/company/">找企业</a></li>
				<li class=""><a
					href="http://127.0.0.1/recruitment/upload/tiny/">微简历</a></li>
				<li class=""><a
					href="http://127.0.0.1/recruitment/upload/once/">微招聘</a></li>
			</ul>
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
			<div class="header_fixed_close">
				<a href="javascript:;" onclick="$('#header_fix').remove();">关闭</a>
			</div>
		</div>

	</div>
	<script language="javascript">
		$(function() {
			var offset = 150;
			$(window).scroll(
					function() {
						($(this).scrollTop() > offset) ? $("#header_fix")
								.show() : $("#header_fix").hide();
					});

			$(".header_fixed_login_dl").hover(function() {
				var t = $(this).attr("did");
				$("#" + t + "_t").show();
			}, function() {
				var t = $(this).attr("did");
				$("#" + t + "_t").hide();
			});
		});
	</script>
	<!--滚动展示内容 end-->

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
										<p class="lnk"><%=rs.getString(3)%></p> <i
										class="index_nav_icon"></i>
								</a>
									<div style="top: -38px;" class="posBox">
										<div class="posJobSort">
											<div class="l">
												<dl class=''>

													<dd>
														<%
															String subsql = "select * from t_jobclass where keyid='"
																		+ rs.getString(1) + "'";
																ResultSet subrs = dbc.getRs(subsql);
																while (subrs.next()) {
														%>
														<a
															href="http://127.0.0.1/recruitment/upload/job/?c=search&job1=35&job1_son=50&job_post=166"
															target="_blank"><%=subrs.getString(3)%></a>
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
						<div class="lstMaskWhite1"></div>
						<div class="lstMaskGray1"></div>
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
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_1.png"
									width="28" height="28" class="png" />
							</dt>
							<dd>找工作</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/resume/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_2.png"
									width="28" height="28" class="png" />
							</dt>
							<dd>找人才</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/company/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_3.png"
									width="28" height="28" class="png" />
							</dt>
							<dd>找企业</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/once/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_4.png"
									width="28" height="28" class="png" />
							</dt>
							<dd>微招聘</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/tiny/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_5.png"
									width="28" height="28" class="png" />
							</dt>
							<dd>微简历</dd>
						</dl>
					</a><a href="http://127.0.0.1/recruitment/upload/zph/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_8.png"
									width="28" height="28" class="png" />
							</dt>
							<dd>招聘会</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/tiny/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_5.png"
									width="28" height="28" class="png" />
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
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_1.png"
									width="28" height="28" class="png" />
							</dt>
							<dd>找工作</dd>
						</dl>
					</a> <a href="http://127.0.0.1/recruitment/upload/company/"
						class="index_left_mune_a" target="_blank">
						<dl class="index_left_mune_list">
							<dt>
								<img
									src="http://127.0.0.1/recruitment/upload/app/template/default/images/i_m_3.png"
									width="28" height="28" class="png" />
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
						class="Latest_talent_h1_icon Latest_talent_h1_icon_jj png"></i>紧急招聘</b><a
						href="http://127.0.0.1/recruitment/upload/job/index.php?c=search&urgent=1"
						class="index_more" target="_blank">更多>></a>
				</div>
				<div class="Emergency_index_cont">
					<ul>
					</ul>
				</div>
			</div>
			<div class="Famous_recruitment">
				<div class="Latest_talent_h1 ">
					<b><i
						class="Latest_talent_h1_icon Latest_talent_h1_icon_mq png"></i>名企招聘</b>
					<!--<a href="###" target="_blank" class="index_more">我也要出现在这里？</a>-->
				</div>
				<div class="Famous_recruitment_cont_box">
					<div class="Famous_recruitment_cont">
						<div class="index_left15560">
							<div id="mainids"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="index_Emergency_job">
				<div class="Latest_talent_h1 ">
					<b><i
						class="Latest_talent_h1_icon Latest_talent_h1_icon_new png"></i>推荐职位</b><a
						href="http://127.0.0.1/recruitment/upload/job/index.php?c=search&rec=1"
						class="index_more" target="_blank">更多>></a>
				</div>
				<div class="Recommended_jobs_cont">
					<div class="Famous_recruitment_cont">
						<ul>
						</ul>
					</div>
				</div>
			</div>
			<div class="index_Emergency_job">
				<div class="Featured_Jobs_bg1">
					<div class="Latest_talent_h1">
						<b><i
							class="Latest_talent_h1_icon Latest_talent_h1_icon_new_post png"></i>最新职位</b><a
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
						href="http://127.0.0.1/recruitment/upload/resume/index.php?c=search"
						class="index_more" target="_blank">更多>></a>
				</div>
				<div class="Latest_talent_cont">
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
									<div class="com_index_rue_list_t">
										<strong class="fl"><a class="cblue blod"
											href="http://127.0.0.1/recruitment/upload/resume/index.php?c=show&id=1"
											target="_blank">阿先生</a></strong> <span
											class="com_index_rue_list_date fr">2016-01-26</span>
									</div>
									<div class="com_index_rue_list_t index_talent">
										<span class="com_index_rue_listspan">￥</span> <em
											class="com_index_rue_list_xz f60">1000 - 1999</em>
									</div>
									<div class="com_index_rue_list_t index_exper">
										<span class="com_index_rue_listspan">经验：</span> <em
											class="com_index_rue_list_xz com_index_rue_list_jy f61">1年以上</em>
									</div>
								</dd>
							</dl>
							<div class="com_index_rue_list_yx">
								<span class="com_index_rue_listspan">意向职位：</span>物业管理经理/主管,
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="index_w1000">
				<div id="bg"></div>
				<div class="clear"></div>
				<div style="display: none;" id="goTopBtn" class="png">
					<img border=0
						src="http://127.0.0.1/recruitment/upload/app/template/default/images/lanren_top.png"
						class="png">
				</div>

			</div>
		</div>
	</div>
	<!--------------------------------弹出框-------------------------------------->
	<!--职位类别start-->
	<div class="sPopupDiv" id="jobdiv" style="display: none; float: left;"></div>
	<!--职位类别end-->

	<!--工作地点start-->
	<div class="sPopupDiv" id="citydiv" style="display: none"></div>
	<!--工作地点end-->

	<!--行业类别start-->
	<div class="sPopupDiv" id="industrydiv" style="display: none"></div>
	<!--行业类别end-->


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
				<div class="footer_right" style="text-align: left">
					<div class="footer_touch">服务热线</div>
					<div class="footer_tel">400-880-5523</div>

					<ul class="footer_last">

						<li
							style="width: 70px; float: left; margin-top: 5px; text-align: left">
							<a class="move_01" style="color: #ff0000" target="_blank"
							href="http://127.0.0.1/recruitment/upload/index.php?c=wap"
							target="_blank">触屏版</a>
						</li>

						<li
							style="width: 70px; float: left; margin-top: 5px; text-align: left">
							<a class="move_03" style="color: #ff0000" target="_blank"
							href="http://127.0.0.1/recruitment/upload/index.php?c=weixin"
							target="_blank">微信</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--foot  end-->
	<div id="bg" style=""></div>
	<div id="uclogin" style="display: none"></div>
	<script>
		var integral_pricename = '积分';
		var weburl = "http://127.0.0.1/recruitment/upload";
	</script>
</body>
</html>
</body>
</html>
<script>
	$(function() {
		$.get("http://127.0.0.1/recruitment/upload/index.php?m=cron");
	});
</script>