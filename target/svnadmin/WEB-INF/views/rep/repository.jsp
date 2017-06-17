<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>项目资源权限管理 - ${applicationScope.sysName}</title>
    <jsp:include page="../common/init_style.jsp"/>
    <script type="text/javascript" src="${appPath}/script/plugins/treeview/treeview.js"></script>
    <link type="text/css" rel="stylesheet" href="${appPath}/script/plugins/treeview/treeview.css"/>
</head>
<body class="gray-bg top-navigation">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <jsp:include page="../common/header.jsp"/>
        <div class="wrapper wrapper-content repository">
            <div class="container" style="width: 1280px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <div class="ibox">
                                <div class="ibox-content">
                                    <h3>项目资源树</h3>
                                    <input type="hidden" id="now-pj" value="${pj.pj}"/>
                                    <div class="filetree treeview" style="width: 100%;height:530px;overflow: auto;">
                                        <ul>
                                            <li id="svnroot" class="closed lastclosed" treeId="rep"
                                                param="pj=${pj.pj}&path=${pj.path}">
                                                <div class="hit closed-hit lastclosed-hit" onclick='$att(this);'></div>
                                                <span class="folder" onclick='$att(this);'>
                                                <a id="rootlink" href='javascript:void(0);' onclick='$atc(this)'>${pj.url}</a>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="ibox">
                                <div class="ibox-content">
                                    <h3>项目资源权限管理</h3>
                                    <div>
                                        <form name="pjauth" class="rep-auth-form" action="pjauth" method="post" id="submitForm" onsubmit="return submitForm();">
                                            <input type="hidden" name="act" value="save">
                                            <table class="table ">
                                                <tr>
                                                    <th class="lbl">资源</th>
                                                    <td colspan="3">
                                                        <input type="text" id="selectedRes" name="res" value="[${pj.pj}:/]" style="width: 416px;;" required/><span style="color:red;">*</span>
                                                        <select onchange="this.form.res.value=this.value">
                                                            <option value="">选择资源</option>
                                                        <c:forEach items="${pjreslist}" var="item">
                                                            <option value="${item}">${item}</option>
                                                        </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="lbl">用户组</th>
                                                    <td valign="top">
                                                        <table>
                                                            <tr>
                                                                <td style="border:0px;">
                                                                    <select id="select3" multiple="multiple" style="height: 150px;width: 150px;">
                                                                    <c:forEach items="${pjgrlist}" var="item">
                                                                        <option value="${item.gr}">${item.gr}</option>
                                                                    </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="border:0px;">
                                                                    <input id="group_add" type="button"  value=">"><br>
                                                                    <input id="group_add_all" type="button"  value=">>"><br><br>
                                                                    <input id="group_del" type="button"  value="<"><br>
                                                                    <input id="group_del_all" type="button"  value="<<"><br><br>
                                                                </td>
                                                                <td style="border:0px;">
                                                                    <select id="select4" name="grs" multiple="multiple" style="height: 150px;width: 150px;">
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>

                                                    <th class="lbl">用户</th>
                                                    <td valign="top">
                                                        <table>
                                                            <tr>
                                                                <td style="border:0px;">
                                                                    <select id="select1" multiple="multiple" style="height: 150px;width: 150px;">
                                                                    <c:forEach items="${usrList}" var="item">
                                                                        <option value="${item.usr}">${item.name}(${item.usr})</option>
                                                                    </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="border:0px;">
                                                                    <input id="user_add" type="button"  value=">"><br>
                                                                    <input id="user_add_all" type="button"  value=">>"><br><br>
                                                                    <input id="user_del" type="button"  value="<"><br>
                                                                    <input id="user_del_all" type="button"  value="<<"><br><br>
                                                                </td>
                                                                <td style="border:0px;">
                                                                    <select id="select2" name="usrs" multiple="multiple" style="height: 150px;width: 150px;">
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="lbl">权限</th>
                                                    <td colspan="3">
                                                        <select name="rw" required>
                                                            <option value="">没有权限</option>
                                                            <option value="r">可读</option>
                                                            <option value="rw">可读可写</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="center">
                                                        <button type="submit" class="btn btn-primary margin-bottom-empty margin-top-mid" id="submitBtn">保存更改</button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                        <div class="table-responsive margin-top-mid clear-overflow">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <th>序号</th>
                                                <th>项目</th>
                                                <th>资源</th>
                                                <th>用户组/帐号</th>
                                                <th>权限</th>
                                                <th>删除</th>
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
                                                    <td>{{item.res}}</td>
                                                    <td>{{item.gr}}{{item.usr}}</td>
                                                    <td>{{resRightStatus[item.rw]}}</td>
                                                    <td><button type="button" class="btn btn-warning btn-xs btn-remove" data-param="pj={{item.pj}}&res={{item.res}}&gr={{item.gr}}&usr={{item.usr}}">删除</button></td>
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
    </div>
</div>
<jsp:include page="../common/init_script.jsp"/>
<script type="text/javascript">
    seajs.use("${appPath}/script/modules/rep/repository");
</script>
</body>
</html>