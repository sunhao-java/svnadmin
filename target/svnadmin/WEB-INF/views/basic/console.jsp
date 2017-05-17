<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>SVN资源管理平台 - 首页</title>
    <jsp:include page="../common/init_style.jsp"/>
</head>
<body class="gray-bg top-navigation">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <jsp:include page="../common/header.jsp"/>
        <div class="wrapper wrapper-content">
            <div class="container">
                <div class="row list-margin">
                    <div class="col-sm-12 box-align-center clear-float">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>SVN 项目列表</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="row marggin-left-mid">
                                    <div class="qry-form">
                                        <button type="button" class="btn btn-primary btn-sm margin-bottom-empty" id="qryBtn">+ 创建项目</button>
                                    </div>
                                </div>
                                <div class="table-responsive margin-top-mid clear-overflow">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>项目</th>
                                            <th>路径</th>
                                            <th>URL</th>
                                            <th>类型</th>
                                            <th>描述</th>
                                            <th>设置用户</th>
                                            <th>设置用户组</th>
                                            <th>设置权限</th>
                                            <th>删除</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tplContainer"></tbody>
                                            <c:if test="${pageBean.recordCount<1}">
                                            <tr><td colspan="15" align="center">未查询到相关数据</td></tr>
                                            </c:if>
                                            <c:if test="${pageBean.recordCount>0}">
                                            <c:forEach items="${pageBean.dataList}" var="item" varStatus="v">
                                            <tr>
                                                <td>${v.index+1}</td>
                                                <td>${item.pj}</td>
                                                <td>${item.pj}</td>
                                                <td>${item.pj}</td>
                                                <td>${item.pj}</td>
                                                <td>${item.pj}</td>
                                                <td><span class="label label-warning">{{userStatus[item.isActive]}}</span></td>
                                                <td>${item.pj}</td>
                                                <td>${item.pj}</td>
                                                <td>${item.pj}</td>
                                            </tr>
                                            </c:forEach>
                                            </c:if>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/init_script.jsp"/>
<%--<script type="text/javascript">--%>
    <%--seajs.use("${appPath}/script/modules/svn/pro_list");--%>
<%--</script>--%>
</body>
</html>