<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>项目用户管理 - ${applicationScope.sysName}</title>
    <jsp:include page="../common/init_style.jsp"/>
</head>
<body class="gray-bg top-navigation">
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
                            <c:if test="${'admin' == adminUser.role}">
                            <div class="row">
                                <div class="qry-form">
                                    <button type="button" class="btn btn-primary btn-sm margin-bottom-empty" onclick="location='pjCreate?type=new';" id="qryBtn"><i class="fa fa-plus"></i> 创建项目</button>
                                    <button type="button" class="btn btn-info btn-sm margin-bottom-empty" onclick="location='pjCreate?type=old';" id="importBtn"><i class="fa fa-mail-forward"></i> 导入现有项目</button>
                                </div>
                            </div>
                            </c:if>
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
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tplContainer">
                                    <c:if test="${pageBean.recordCount<1}">
                                        <tr><td colspan="15" align="center">未查询到相关数据</td></tr>
                                    </c:if>
                                    <c:if test="${pageBean.recordCount>0}">
                                        <c:forEach items="${pageBean.dataList}" var="item" varStatus="v">
                                            <tr>
                                                <td>${v.index+1}</td>
                                                <td>${item.pj}</td>
                                                <td>${item.path}</td>
                                                <td><a href="repository?pj=${item.pj}" title="去设置权限？">${item.url}</a></td>
                                                <td><label class="label label-warning">${item.type}</label></td>
                                                <td>${item.des}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-primary btn-sm" type="button" onclick="location.href='pjUsrList?pj=${item.pj}';"><i class="fa fa-user"></i> 用户</button>
                                                        <button class="btn btn-success btn-sm" type="button" onclick="location.href='pjGrList?pj=${item.pj}';"><i class="fa fa-users"></i> 用户组</button>
                                                        <button class="btn btn-warning btn-sm" type="button" onclick="location.href='repository?pj=${item.pj}';"><i class="fa fa-unlock-alt"></i> 权限</button>
                                                    </div>
                                                   <%-- <div class="btn-group">
                                                        <button data-toggle="dropdown" class="btn btn-info btn-xs dropdown-toggle"
                                                                aria-expanded="false">操作 <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                        <li>
                                                            <a href="javascript:void(0)" onclick="location.href='pjUsrList?pj=${item.pj}';" class="font-bold">设置用户</a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0)" onclick="location.href='pjGrList?pj=${item.pj}';" class="font-bold">设置用户组</a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0)" onclick="location.href='repository?pj=${item.pj}';" class="font-bold">设置权限</a>
                                                        </li>
                                                        <!-- <li class="divider"></li>
                                                        <li>
                                                            <a href="javascript:void(0)" data-id="{{item.id}}" class="font-bold text-danger">删除</a>
                                                        </li>
                                                        -->
                                                    </ul>
                                                    </div>--%>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
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