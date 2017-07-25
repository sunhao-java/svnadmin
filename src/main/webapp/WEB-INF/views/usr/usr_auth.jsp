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
                                <h5>我的项目权限列表</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="table-responsive margin-top-mid clear-overflow">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>项目</th>
                                            <th>描述</th>
                                            <th>帐号</th>
                                            <th>资源</th>
                                            <th>权限</th>
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
                                                <td>{{item.des}}</td>
                                                <td>{{item.usr}}</td>
                                                <td>{{item.res}}</td>
                                                <td>{{resRightStatus[item.rw]}}</td>
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
</div>
<jsp:include page="../common/init_script.jsp"/>
<script type="text/javascript">
    seajs.use("${appPath}/script/modules/usr/usr_auth_list");
</script>
</body>
</html>