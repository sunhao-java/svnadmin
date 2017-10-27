<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>创建项目 - ${applicationScope.sysName}</title>
    <jsp:include page="../common/init_style.jsp"/>
</head>
<body class="gray-bg top-navigation">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <jsp:include page="../common/header.jsp"/>
        <div class="wrapper wrapper-content">
            <div class="container">
                <div class="row list-margin">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <c:if test="${type =='new'}">
                                <h5>创建项目</h5>
                            </c:if>
                            <c:if test="${type == 'old'}">
                                <h5>导入现有项目</h5>
                            </c:if>
                        </div>
                        <div class="ibox-content">
                            <!-- 查询表单 -->
                            <form class="form-horizontal m-t" id="submitForm" action="#" onsubmit="return submitForm();" method="post">
                                <div class="col-md-12 clear-float">

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">项目名称：</label>
                                        <div class="col-sm-8">
                                            <input type="text" placeholder="请输入项目名称" name="pj" class="form-control" required>
                                            <span class="help-block m-b-none"><i class="fa fa-info-circle">&nbsp;</i>项目名称请使用字母，用作资源目录名</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">项目类型：</label>
                                        <div class="col-sm-8">
                                            <select name="type" class="form-control">
                                                <option value="svn">svn</option>
                                                <%--<option value="http">http</option>--%>
                                                <%--<option value="http-mutil">http(多库)</option>--%>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">项目路径：</label>
                                        <div class="col-sm-8">
                                            <input type="text" placeholder="请输入项目路径" name="path" class="form-control" required>
                                            <span class="help-block m-b-none"><i class="fa fa-info-circle">&nbsp;</i>项目路径例如：/svn/repository</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">项目 Url ：</label>
                                        <div class="col-sm-8">
                                            <input type="text" placeholder="请输入项目Url" name="url" class="form-control" required>
                                            <span class="help-block m-b-none"><i class="fa fa-info-circle">&nbsp;</i>项目 Url 例如：svn://hpboys.com/repository</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">项目描述：</label>
                                        <div class="col-sm-8">
                                            <input type="text" placeholder="请输入项目描述" name="des" class="form-control" required>
                                            <span class="help-block m-b-none"><i class="fa fa-info-circle">&nbsp;</i>SVN项目的简单描述信息</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <input type="hidden" name="addType" value="${type}">
                                            <button class="btn btn-primary" type="submit">创建</button>
                                            <button class="btn btn-white" type="reset">重置</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/init_script.jsp"/>
<script type="text/javascript">
    seajs.use("${appPath}/script/modules/svn/pj_create");
</script>
</body>
</html>