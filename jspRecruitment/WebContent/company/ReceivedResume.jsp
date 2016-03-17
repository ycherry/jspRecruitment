<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/span; charset=utf-8">
<meta http-equiv=X-UA-Compatible content="IE=edge">
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
<link rel="stylesheet" type="text/css"
	href="../css/style/company/m_style.css">
<link rel="stylesheet" type="text/css"
	href="../css/style/company/user-n2012.css">
<link rel="stylesheet" type="text/css"
	href="../css/style/company/index_style.css">
<meta content="MSHTML 6.00.6000.16939" name=GENERATOR>
</head>
<body>
	<div class="w1000">
		<div class="admin_mainbody">
			<div class=right_box>
				<div class=admincont_box>
					<div class="com_tit">
						<span class="com_tit_span">申请职位的人才</span>
					</div>
					<div class="com_body">
						<div class=admin_textbox_04>
							<iframe id="supportiframe" name="supportiframe"
								onload="returnmessage('supportiframe');" style="display: none"></iframe>
							<div class="hr_tip_box">
								<div class="hr_subMetx">
									<span class="hr_subMetx_span fltL">招聘职位：</span>
									<div class="text_seclet text_seclet_cur2 re">
										<input id="qypr" class="SpFormLBut text_seclet_w250"
											type="button" onclick="search_show('job_qypr');" value="全部职位">
										<div id="job_qypr" class="cus-sel-opt-panel "
											style="display: none;">
											<ul class="Search_Condition_box_list">
												<li><a href="index.php?c=hr&state=">全部职位</a></li>
												<li><a href="index.php?c=hr&jobid=2&state=">java工程师</a>
												</li>
												<li><a href="index.php?c=hr&jobid=3&state=">web工程师</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="hr_subMetx">
									<form action="index.php" method="get">
										<span class="hr_subMetx_span fltL">关 键 字：</span>
										<div class="hr_subMetx_se">
											<input name="c" type="hidden" value="hr"> <input
												name="keyword" type="text" class="news_text" value="请输入姓名查找"
												onblur="if(this.value==''){this.value='请输入姓名查找'}"
												onclick="if(this.value=='请输入姓名查找'){this.value=''}">
											<input type="submit" class="news_bth" value=" ">
										</div>
									</form>
								</div>
							</div>
							<div class="clear"></div>
							<form action="index.php?c=hr&act=hrset" target="supportiframe"
								method="post" id='myform'>
								<div class="clear"></div>

								<div class="job_news_list job_news_list_h1 mt10">
									<span class="job_news_list_span job_w30">&nbsp;</span> <span
										class="job_news_list_span job_w80" style="text-align: left">姓名</span>
									<span class="job_news_list_span job_w160">求职意向</span> <span
										class="job_news_list_span job_w100">工作经验</span> <span
										class="job_news_list_span job_w100">期望薪资</span> <span
										class="job_news_list_span job_w155">申请的职位</span> <span
										class="job_news_list_span job_w100"
										style="width: 140px; text-align: center">操作</span>
								</div>
								<div class="job_news_list" style="padding-bottom: 18px;">
									<span class="job_news_list_span job_w30"
										style="padding-right: 6px;"> <input type="checkbox"
										name="delid[]" value="2">
									</span> <span class="job_news_list_span job_w80"
										style="text-align: left"><a
										href="http://127.0.0.1/recruitment/upload/resume/index.php?c=show&id=2"
										target="_blank" class="com_Release_name">阿百川&nbsp;</a></span> <span
										class="job_news_list_span job_w160">软件工程师 &nbsp;</span> <span
										class="job_news_list_span job_w100">应届毕业生 &nbsp;</span> <span
										class="job_news_list_span job_w100">10000及以上&nbsp;</span> <span
										class="job_news_list_span job_w155"><a
										href="http://127.0.0.1/recruitment/upload/job/index.php?c=comapply&id=3"
										target="_blank" class="uesr_name_a">web工程师</a></span> <span
										class="job_news_list_span job_w100"
										style="width: 140px; text-align: right;"> <font
										color="red">已邀请</font> <span class="com_m_line">|</span> <a
										href="javascript:void(0)"
										onclick="layer_del('屏蔽该用户，并删除该条信息？', 'index.php?c=job&act=opera&p_uid=6'); "
										class="uesr_name_a">屏蔽/删除</a>
									</span>
									<div class="clear"></div>
									<div class="com_mem_hr_list_b_b">
										<span style="padding-left: 30px; color: #999">申请时间：2016-03-15</span>
									</div>
								</div>
								<div class="diggg mt10 fltR"></div>
							</form>
							<div class="clear"></div>
							<div class="job_list_tip">
								<span class="job_list_tip_span">共有（<span class="f60">1</span>）份简历申请贵公司发布的职位
								</span><a href="http://127.0.0.1/recruitment/upload/resume/"
									class="fb_Com_xz" target="_blank"
									style="text-align: center; line-height: 25px;">找人才</a>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$(".com_mem_hr_list_bj").click(function() {
				var browse = $(this).attr('browse');
				var id = $(this).attr('name');
				$.post("index.php?c=hr&act=hrset", {
					id : id,
					browse : browse
				}, function(data) {
					location.reload();
				});
			});
		});
	</script>
	</div>
	<div class="clear"></div>
</body>
</html>