<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="renderer" content="webkit">
	<link rel="shortcut icon" href="${appPath}/image/favicon.ico" type="image/icon">
	<title>登录 - ${applicationScope.sysName}</title>
	<link href="${framePath}/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${appPath}/style/form-common.css">
	<link href="${framePath}/css/animate.min.css" rel="stylesheet">
	<link href="${framePath}/css/style.min.css?v=3.3.0" rel="stylesheet">
	<link href="${framePath}/css/login.min.css" rel="stylesheet">
</head>

<body class="signin">
<div class="signinpanel">
	<div class="row">
		<div class="col-sm-7">
			<div class="signin-info">
				<div class="logopanel m-b">
					<h1><span>[ U+ ]</span></h1>
				</div>
				<div class="m-b"></div>
				<h4>欢迎使用<strong>SVN资源管理平台</strong></h4>
				<ul class="m-b">
					<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 稳定、流畅的用户体验</li>
					<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 安全、可靠的系统性能</li>
					<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 更多，敬请期待...</li>
				</ul>
			</div>
		</div>
		<div class="col-sm-5">
			<form method="post" id="loginForm" action="#" onsubmit="return loginSubmit();">
				<h4 class="no-margins" style="color: #1c84c6;">登录：</h4>

				<p class="m-t-md" style="color: #1c84c6;">登录到SVN资源管理平台</p>
				<input type="text" class="form-control uname" placeholder="${lbe_usr_txt}" id="userCode" name="usr" required/>
				<input type="password" class="form-control pword m-b" placeholder="${lbe_psw_txt}" id="password" name="psw" required/>
				<%--&lt;%&ndash;<a href="">忘记密码了？</a>&ndash;%&gt;--%>
				<%--<a href="javascript:void(0);">&nbsp;</a>--%>
				<p id="error" style="width: 100%;height: 20px;"></p>
				<button class="btn btn-success btn-block" id="userLogin">${btn_login_txt}</button>
			</form>
		</div>
	</div>
	<div class="signup-footer">
		<div class="pull-left">
			&copy; 2016 All Rights Reserved. 破晓科技有限公司
		</div>
	</div>
</div>
<jsp:include page="../common/init_script.jsp" />
<script type="text/javascript">
	seajs.use("${appPath}/script/modules/basic/login");
</script>
</body>
</html>