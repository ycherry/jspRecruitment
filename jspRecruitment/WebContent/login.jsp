<%@page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<html>
<head>
<title>欢迎登陆人才招聘网</title>
<script type="text/javascript" src="Js/util/jquery.js"></script>
<script type="text/javascript" src="Js/util/bootstrap.js"></script>
<script type="text/javascript" src="Js/util/angular.js"></script>
<link rel="stylesheet" type="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="stylesheet" href="	css/style/common.css">
<link rel="stylesheet" type="stylesheet" href="	css/style/login.css">
<link rel="stylesheet" type="stylesheet" href="	css/style/css.css">
</head>
<body>
	<div class="top">
		<div class="top_left ">
			<div class="welcome">欢迎来到jsp人才系统！</div>
		</div>
	</div>
	<div class="logoin_banner">
		<div id="slides" class="s_lb">
			<div class="slides_container">
				<div class="slide">
					<img src='images/login/loginbg.JPG'></a>
				</div>

			</div>
		</div>
	</div>
	<form role="form" name="login" action="LoginServlet">
		<div class="logoin_cont_box">
			<div class="logoin_bg"></div>
			<div class="login_left ">
				<div class="login_box_cont">
					<div class="login_box_h1_d" id='usertype1'>会员登录</div>
					<div class="clear"></div>
					<div class="lgoin_box_cot" id='login_cur'>
						<div class="col-md-offset-1 col-md-10 login_box_list logoin_re">
							<input type="text" class="form-control" id="user" name="user"
								placeholder="请输入您的用户名" ng-model="user" required>
						</div>
						<div class="col-md-offset-1 col-md-10 login_box_list logoin_re">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="请输入您的密码" ng-model="password"
								required>
						</div>

						<div class=" col-md-offset-1 login_box_list logoin_re">
							<div class=" col-md-6	">
								<label style="color: #ffffff"> <input type="radio"
									name="type" id="userType1" value="1" checked> 个人用户
								</label>
							</div>
							<div class="col-md-6">
								<label style="color: #ffffff"> <input type="radio"
									name="type" id="userType1" value="2"> 企业用户
								</label>
							</div>
						</div>
						<div class=" col-md-offset-1  form-group login_box_cz">
							<div class=" col-md-11">
								<button type="submit" class="btn btn-primary"
									style="width: 100%">立即登录</button>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-offset-1 col-md-4">
								<button type="button" class="btn btn-info"
									onclick="window.location.href='jobseeker/reg.html'">
									个人用户注册</a>
								</button>
							</div>
							<div class="col-md-offset-1 col-md-4">
								<button type="button" class="btn btn-info"
									onclick="window.location.href='company/reg.html'">
									企业用户注册</a>
								</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="row">
		<dl class="col-md-offset-3 login_list">
			<dt>
				<img src="images/login/log_img1.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">强大的招聘平台</div>
				<div class="login_list_p">提供快捷、高效、可靠地网上招聘</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="images/login/log_img2.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">收获职业机会</div>
				<div class="login_list_p">好机会主动找上你，成就职业成功</div>
			</dd>
		</dl>
		<dl class="login_list">
			<dt>
				<img src="images/login/log_img3.png" class="png">
			</dt>
			<dd>
				<div class="login_list_h1">打造职业形象</div>
				<div class="login_list_p">创建职业档案，持续展示自己的优势</div>
			</dd>
		</dl>
	</div>
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
		</div>
	</div>

	<!--foot  end-->

	
</body>
</html>