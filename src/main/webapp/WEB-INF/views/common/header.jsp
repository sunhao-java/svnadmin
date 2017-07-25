<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row border-bottom white-bg">
	<nav class="navbar navbar-static-top container" role="navigation">
		<div class="navbar-header">
			<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
				<i class="fa fa-reorder"></i>
			</button>
			<a href="#" class="navbar-brand">U+</a>
		</div>
		<div class="navbar-collapse collapse" id="navbar">
			<ul class="nav navbar-nav">
				<c:if test="${'admin' == adminUser.role}" var="isAdmin">
				<%-- 管理员才有的权限 --%>
				<li class="active">
					<a aria-expanded="false" role="button" href="pjList"> 项目管理</a>
				</li>

				<li>
					<a aria-expanded="false" role="button" href="pjCreate"> 创建项目</a>
				</li>
				<li>
					<a aria-expanded="false" role="button" href="usrList"> 用户管理</a>
				</li>
				</c:if>
				<li <c:if test="${!isAdmin}">class="active"</c:if> >
					<a aria-expanded="false" role="button" href="usrRightListView"> 我的权限</a>
				</li>

				<li>
					<a aria-expanded="false" role="button" href="updatePswd"> 修改密码</a>
				</li>
			</ul>
			<ul class="nav navbar-top-links navbar-right">
				<li>
					欢迎您，<c:if test="${isAdmin}">管理员</c:if><c:if test="${!isAdmin}">普通用户</c:if> ：<label class="label label-info" style="font-size: 16px;">${adminUser.usr}</label>
				</li>
				<li>
					<a href="logout">
						<i class="fa fa-sign-out"></i> 退出
					</a>
				</li>
			</ul>
		</div>
	</nav>
</div>
