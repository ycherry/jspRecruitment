<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/util/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../js/util/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="../js/util/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../js/util/bootstrap.js"></script>
<script type="text/javascript"
	src="../js/util/jquery.validate-1.13.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style/m_header.css">
<link rel="stylesheet" type="text/css" href="../css/style/m_css.css">
<link rel="stylesheet" href="../css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="../css/style/common.css">
</head>
<body>
	<div class="w950">
		<div class="mian_right fltR">
			<div class="member_right_h1 fltL">
				<span class="member_right_span fltL">面试邀请</span>
			</div>
			<div class="remindbox01 mt10">
				<div id="gms_showclew"></div>
				<div class="resumelistbox01 mt10">
					<div id="" class="resume_box_list">
						<div class="List_Ope List_Title ">
							<span class="List_Title_span List_Title_w170">面试职位</span> <span
								class="List_Title_span List_Title_w330">公司名称</span> <span
								class="List_Title_span List_Title_w230"
								style="text-align: center">操作</span>
						</div>
						<div class="List_Ope List_Ope_Advisory">
							<span class="List_Title_span List_Title_w170"> <a
								href="http://127.0.0.1/recruitment/upload/job/index.php?c=comapply&id=2"
								class="List_Title_span_com">java工程师</a>
							</span> <span class="List_Title_span List_Title_w330"> <a
								href="http://127.0.0.1/recruitment/upload/company/index.php?c=show&id=4"
								target="_blank">信息技术</a>
							</span> <span class="List_Title_span List_Title_w230"
								style="text-align: center"> <a
								href="javascript:void(0);"
								onclick="layer_del('您确定要删除？', 'index.php?c=msg&act=del&id=3'); "
								class="cblue">删除</a> <span class="u_List_line">|</span> <a
								href="javascript:void(0);"
								onclick="layer_del('您确定要屏蔽该公司并删除该邀请？','index.php?c=msg&act=shield&id=3');"
								class="cblue">屏蔽</a><span class="u_List_line">|</span> <a
								href="javascript:void(0);"
								onclick="layer_del('确定要拒绝面试邀请？', 'index.php?c=msg&act=inviteset&id=3&browse=4')"
								class="cblue">拒绝面试</a><span class="u_List_line">|</span><a
								href="javascript:void(0);"
								onclick="layer_del('确定要同意面试邀请？', 'index.php?c=msg&act=inviteset&id=3&browse=3')"
								class="cblue">同意面试</a> <span class="u_List_line">|</span> <a
								href="javascript:getcont('3');">查看</a>
							</span>
							<div style="width: 100%; float: left">
								<span style="padding-left: 10px;">邀请时间：2016-03-15</span> <span
									style="padding-left: 48px;">我的操作： <font color="#f60">尚未回复</font>
								</span>
							</div>
						</div>
					</div>
					<div class="diggg"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="getcont" style="width: 350px; height: 250px; display: none;">
		<div style="padding: 10px;">
			<div class="audition_list">
				<span class="audition_list_span">面试职位：</span><em
					class="audition_list_em" id="jobname"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">联系人： </span><em
					class="audition_list_em" id="linkman"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">联系电话：</span><em
					class="audition_list_em" id="linktel"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">面试时间：</span><em
					class="audition_list_em" id="intertime"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">面试地址：</span><em
					class="audition_list_em" id="address"></em>
			</div>
			<div class="audition_list">
				<span class="audition_list_span">面试备注：</span><em
					class="audition_list_em" id="content"></em>
			</div>
		</div>
	</div>
	<script>
		function getcont(id) {
			$.post("index.php?c=msg&act=ajax", {
				id : id
			}, function(data) {
				var data = eval('(' + data + ')');
				$("#jobname").html(data.jobname);
				$("#linkman").html(data.linkman);
				$("#linktel").html(data.linktel);
				$("#intertime").html(data.intertime);
				$("#address").html(data.address);
				$("#content").html(data.content);
				$.layer({
					type : 1,
					title : '邀请信息',
					shade : [ 0 ],
					closeBtn : [ 0, true ],
					border : [ 10, 0.3, '#000', true ],
					area : [ '350px', 'auto' ],
					page : {
						dom : "#getcont"
					}
				});
			})
		}
	</script>
	<iframe id="supportiframe" name="supportiframe"
		onload="returnmessage('supportiframe');" style="display: none"></iframe>
</BODY>
</HTML>
<script>
	$(function() {
		$.get("http://127.0.0.1/recruitment/upload/index.php?m=cron");
	});
</script>