<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>项目用户组管理 - ${applicationScope.sysName}</title>
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
                            <h5>项目组用户列表</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="usr-select-box">
                                    <div class="col-sm-4">
                                        <div class="ibox">
                                            <div class="ibox-content">
                                                <h3>未入组账号</h3>
                                                <ul class="sortable-list connectList agile-list ui-sortable usr-list out-usr-list">
                                                    <c:forEach items="${usrList}" var="item">
                                                    <li class="warning-element">
                                                        ${item.usr}（${item.name}）
                                                        <input type="hidden" name="usrs" value="${item.usr}"/>
                                                    </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <input type="hidden" value="${pj}" class="select_pj"/>
                                        <input type="hidden" value="${gr}" class="select_gr"/>
                                        <button type="button" class="btn btn-info btn-sm margin-bottom-empty margin-top-larger" id="addBtn">添加到用户组 <i class="fa fa-chevron-right"></i></button>
                                        <button type="button" class="btn btn-success btn-sm margin-bottom-empty margin-top-mid" id="removeBtn"><i class="fa fa-chevron-left"></i> 从用户组移出</button>
                                        <button type="button" class="btn btn-primary margin-bottom-empty margin-top-mid" id="submitBtn">保存更改</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="ibox">
                                            <div class="ibox-content">
                                                <h3>已入组账号</h3>
                                                <form action="" id="in-usr-form">
                                                    <ul class="sortable-list connectList agile-list ui-sortable usr-list in-usr-list">
                                                    </ul>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive margin-top-mid clear-overflow">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>项目</th>
                                        <th>用户组</th>
                                        <th>账号</th>
                                        <th>删除</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tplContainer"></tbody>
                                    <!-- Template -->
                                    <script id="listView" type="text/html">
                                        {{if recordCount<1}}
                                        <tr><td colspan="15" align="center">未查询到相关数据</td></tr>
                                        {{else}}
                                        {{each dataList as item i}}
                                        <tr>
                                            <td>{{i+1}}</td>
                                            <td>{{item.pj}}</td>
                                            <td>{{item.gr}}</td>
                                            <td>{{item.usr}}</td>
                                            <td><button type="button" class="btn btn-warning btn-xs btn-remove" data-usr="{{item.usr}}">删除</button></td>
                                        </tr>
                                        {{/each}}
                                        {{/if}}
                                    </script>
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
<script type="text/javascript">
    seajs.use("${appPath}/script/modules/svn/pj_gr_usr_list");
</script>
</body>
</html>