<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="../css/style/admin/admin.css">
<title>简历管理</title>
<style type="text/css">
body {
	background: #FFF;
}
</style>
</head>
<body class="admin_body_font">
	<div class="admin_Filter">
		<span class="complay_top_span">简历管理</span>
	</div>
	<div class="clear"></div>

	<div class="table_list">
		<div class="admin_table_border">
			<table width="100%">
				<thead>
					<tr class="admin_table_top">
						<th>简历ID</th>
						<th>用户名</th>
						<th>意向职位</th>
						<th>工作地点</th>
						<th>待遇要求</th>
						<th>工作性质</th>
						<th><a href="#">更新时间<img src="../images/sanj2.jpg"></a></th>
						<th class="admin_table_th_bg">操作</th>
					</tr>

				</thead>
				<tbody>
					<tr>
						<td>123</td>
						<td>yaya</td>
						<td>java工程师</td>
						<td>上海</td>
						<td>2000-9000</td>
						<td>程序员</td>
						<td>2015-02-12</td>
						<td>删除</td>
					</tr>

				</tbody>
				<tfoot>
					<tr style="background: #f1f1f1;">
						<td align="center"><input type="checkbox" id="chkAll2"
							onclick="CheckAll2(this.form)"></td>
						<td colspan="5"><label for="chkAll2">全选</label>&nbsp; <input
							class="admin_submit4" type="button" name="delsub" value="删除所选"
							onclick="return really('del[]')"> <input
							class="admin_submit4" type="button" name="delsub" value="批量刷新"
							onclick="Refreshs();"> <input class="admin_submit2"
							type="button" name="delsub" value="推荐"
							onclick="checkdel('rec_resume','1');"> <input
							class="admin_submit4" type="button" name="delsub" value="取消推荐"
							onclick="checkdel('rec_resume','0');"> <input
							class="admin_submit2" type="button" name="delsub" value="置顶"
							onclick="checkdel('top','1');"> <input
							class="admin_submit4" type="button" name="delsub" value="取消置顶"
							onclick="checkdel('top','0');"></td>
						<td colspan="8" class="digg"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>