

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>坚果管理平台</title>
<link href="themes/css/login.css" rel="stylesheet" type="text/css" />
  <script src="js/sweet-alert.js"></script>
  <link rel="stylesheet" href="css/sweet-alert.css">
<script type="text/javascript">
	
	function check(){
			var uname = document.getElementById("name").value;
			var upwd = document.getElementById("pwd").value;
			if(uname = null || uname.length==0){
				document.getElementById("labname").innerHTML="<font color='red'>用户名不能为空！！！</font>";
				return false;
			}
			if(upwd = null || upwd.length==0){
				document.getElementById("labpwd").innerHTML="<font color='red'>密码不能为空！！！</font>";
				return false;
			}
			//setTimeout(return true,5000); 
			
		}
	
</script>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<a href="http://demo.dwzjs.com"><img src="themes/default/images/login_logo.gif" /></a>
			</h1> 
			<div class="login_headerContent">
				
				<h2 class="login_title"><img src="themes/default/images/login_title.png" /></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
				<form action="T_admin_Check_Servlet" method="post">
					<!--<p>
						<label>权限：</label>
						<select name="quanxian"> 
							<option value="gly">【管理员】</option> 
					        <option value="cjgly">【超级管理员】</option>         
					        <option value="boss">【BOSS】</option>         
					</select>
					</p>
					-->
					<p>
						<label>权限：</label>
						<select name="city"> 
							<option value="sanya">【三亚】</option> 
					        <option value="haikou">【海口】</option>         
					        <option value="beijing">【北京】</option>         
					        <option value="hangzhou">【杭州】</option>         
					        <option value="xian">【西安】</option>         
					        <option value="boss">【BOSS】</option>         
					</select>
					</p>
					<p>
						<label>用户名：</label>
						<input id="name" type="text" name="username" size="20" class="login_input" /><br/>
						<span id="labname"></span>
					</p>
					<p>
						<label>密码：</label>
						<input id="pwd" type="password" name="password" size="20" class="login_input" /><br/>
						<span id="labpwd"></span>
					</p>
					
					<div class="login_bar">
						<input class="sub" type="submit" value=" " onclick="return check()"/>
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="themes/default/images/login_banner.jpg" /></div>
			<div class="login_main"><br /><div class="login_inner">
					<p>您可以使用 网易网盘 ，随时存，随地取</p>
					<p>您还可以使用 闪电邮 在桌面随时提醒邮件到达，快速收发邮件。</p>
					<p>在 百宝箱 里您可以查星座，订机票，看小说，学做菜…</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2009 www.dwzjs.com Inc. All Rights Reserved.
		</div>
	</div>
</body>
</html>
