<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>项目列表 - ${applicationScope.sysName}</title>
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
                            <h5>项目用户组列表</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="qry-form">
                                    <input type="hidden" value="${pj.pj}" class="select_pj"/>
                                    <button type="button" class="btn btn-primary btn-sm margin-bottom-empty" id="addBtn">+ 添加项目用户组</button>
                                </div>
                            </div>
                            <div class="table-responsive margin-top-mid clear-overflow">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>项目</th>
                                        <th>用户组</th>
                                        <th>描述</th>
                                        <th>设置用户</th>
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
                                            <td>{{item.des}}</td>
                                            <td><button type="button" class="btn btn-primary btn-xs btn-set-usr" onclick="location='pjGrUsrList?pj={{item.pj}}&gr={{item.gr}}';">设置用户</button></td>
                                            <td><button type="button" class="btn btn-warning btn-xs btn-remove" data-pj="{{item.pj}}" data-gr="{{item.gr}}">删除</button></td>
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
<!-- 添加项目用户表单 -->
<form class="form-horizontal m-t" id="submitForm" action="#" onsubmit="return submitForm();" style="display: none"
      method="post">
    <div class="col-md-9 clear-float" style="margin: 30px 0 0 40px;">
        <div class="form-group">
            <label class="col-sm-3 control-label">所属项目：</label>
            <div class="col-sm-8">
                <p class="form-control-static">${pj.pj}（${pj.des}）</p>
                <input type="hidden" name="pj" value="${pj.pj}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">用户组：</label>
            <div class="col-sm-8">
                <input type="text" name="gr" id="gr" class="form-control" placeholder="请输入用户组" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">描述：</label>
            <div class="col-sm-8">
                <input type="text" name="des" id="des" class="form-control" placeholder="请输入描述" required/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 col-sm-offset-3">
                <button class="btn btn-primary" type="submit">保存信息</button>
                <button class="btn btn-white" type="reset">取消</button>
            </div>
        </div>
    </div>
</form>
<jsp:include page="../common/init_script.jsp"/>
<script type="text/javascript">
    seajs.use("${appPath}/script/modules/svn/pj_gr_list");
</script>
</body>
</html>