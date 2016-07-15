<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0;  minimum-scale=1.0; maximum-scale=2.0"/>
<title>登录</title>
<link href="./css/public.css" rel="stylesheet" type="text/css" />
<link href="./css/login-res.css" rel="stylesheet" type="text/css" />
<!--link href="css/style.css" type="text/css" rel="stylesheet" /-->

</head>
<body>
	
	
<div class="main"> 
	<div class="title-login">
		<a href="#" class="back"></a>
		<span>登录</span>
		<a href="res.html">注册</a>
	</div>
	<form class="login-con">
		<div class="login-con-title">
			<div class="log-t-l backo">手机号快捷登录</div>
			<div class="log-t-r">账号密码登录</div>                
		</div>  

		<div class="form">
			<form action="T_login_app_servlet" method="post">
				<div class="div-phone">
					<em></em>
					<form action="T_SMS_Servlet" method="post">
					<input type="text" id="phone" name="tel" class="infos" placeholder="请输入手机" />
					<input class="sub" type="submit" value="验证" onclick="return check()"/>
					</form>
				</div>
				<div class="div-ranks">
					<em></em>
					<input type="text" id="ranks" class="infos" name="vertify"  placeholder="请输入验证码"  />
				</div>
				<div class="div-text">
					未注册过的手机号将创建兼果账号
				</div>
				<div class="div-conform">
					<input class="sub" type="submit" value="验证" onclick="return check()"/>
				</div>
			</form>
		</div>

		<div class="form hide">
			<from action="" method="post" >
				<div class="div-phone">
					<em></em>
					<input type="text" id="phone" class="infos" placeholder="请输入手机" />

				</div>
				<div class="div-ranks">
					<em></em>
					<input type="text" id="ranks" class="infos" placeholder="请输入密码"  />
				</div>
				<div class="div-conform">
					<button class="conform">登录</button>
				</div>
			</from>
		</div>

	</form>
		
	</div>
		

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var sends = {
	checked:1,
	send:function(){
			var numbers = /^1\d{10}$/;
			var val = $('#phone').val().replace(/\s+/g,""); //获取输入手机号码
			if($('.form').find('span').length == 0 && $('.div-phone a').attr('class') == 'send1'){
				if(!numbers.test(val) || val.length ==0){
					$('.form').append('<span class="error">请输入正确的手机号</span>');
					setInterval("$('.form span').remove()", 2000);
					return false;
				}
			}
			if(numbers.test(val)){
				var time = 60;			
				function timeCountDown(){
					if(time==0){
						clearInterval(timer);
						$('.div-phone a').addClass('send1').removeClass('send0').html("重新验证");
						sends.checked = 1;
						return true;
					}
					$('.div-phone a').html(time+"S");
					time--;
					return false;
					sends.checked = 0;
				}
				$('.div-phone a').addClass('send0').removeClass('send1');
				timeCountDown();
				var timer = setInterval(timeCountDown,1000);
			}
	}

}

$(document).ready(function(){
	$('.login-con-title div').click(function(){
		var i=$(".login-con-title div").index(this);
		$('.form').hide();
		$('.form').eq(i).show();
	    $(".login-con-title div").removeClass('backo');
		$(this).addClass('backo');

	});
});
</script>

</body>
</html>

  </body>
</html>
