<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>用户列表 - ${applicationScope.sysName}</title>
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
                            <h5>用户列表</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="qry-form">
                                    <button type="button" class="btn btn-primary btn-sm margin-bottom-empty" id="addBtn">+ 创建用户</button>
                                </div>
                            </div>
                            <div class="table-responsive margin-top-mid clear-overflow">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>用户名</th>
                                        <th>姓名</th>
                                        <th>密码</th>
                                        <th>角色</th>
                                        <th class="w100">查看</th>
                                        <th class="w100">操作</th>
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
                                            <td>{{item.usr}}</td>
                                            <td>{{item.name}}</td>
                                            <td>{{item.psw}}</td>
                                            <td>{{item.role}}</td>
                                            <td><button type="button" class="btn btn-primary btn-xs btn-watch" data-id="{{item.usr}}">查看权限</button></td>
                                            <td><button type="button" class="btn btn-warning btn-xs btn-remove" data-id="{{item.usr}}">删除</button></td>
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
<!-- 编辑用户表单 -->
<form class="form-horizontal m-t" id="submitForm" action="#" onsubmit="return submitForm();" style="display: none" method="post">
    <div class="col-md-12 clear-float">
        <div class="form-group">
            <label class="col-md-3 control-label">用户名：</label>
            <div class="col-sm-8">
                <input type="text" placeholder="请输入用户名" name="usr" maxlength="16" class="form-control" required>
                <span class="help-block m-b-none"><i class="fa fa-info-circle">&nbsp;</i>用户名请使用字母，4-16位，将用作登录</span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">姓名：</label>
            <div class="col-sm-8">
                <input type="text" placeholder="请输入姓名" name="name" class="form-control" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">密码：</label>
            <div class="col-sm-8">
                <input type="text" placeholder="请输入密码" name="psw" class="form-control" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">角色：</label>
            <div class="col-sm-8">
                <select name="role" class="form-control">
                    <option value="">选择角色</option>
                    <option value="admin">admin</option>
                </select>
            </div>
        </div>

        <div class="form-group margin-top-larger">
            <label class="col-md-3 control-label"></label>
            <div class="col-sm-4 col-sm-offset-2">
                <button class="btn btn-primary" type="submit">创建</button>
                <button class="btn btn-white" type="reset">重置</button>
            </div>
        </div>
    </div>
</form>
<!-- 用户资源权限列表 -->
<div class="table-responsive clear-overflow" id="userRightList" style="display: none;margin: 10px;">
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
        <tbody id="resTplContainer"></tbody>
        <!-- Template -->
        <script id="resListView" type="text/html">
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
<jsp:include page="../common/init_script.jsp"/>
<script type="text/javascript">
    seajs.use("${appPath}/script/modules/usr/usr_list");
</script>
</body>
</html>