<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>SVN资源管理平台 - 修改密码</title>
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
                                <h5>修改密码</h5>
                            </div>
                            <div class="ibox-content">
                                <form class="form-horizontal m-t" id="submitForm" action="#" onsubmit="return submitForm();"  method="post">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">验证老密码：</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="oldPsw" id="oldPsw" class="form-control"
                                                   placeholder="请输入老密码"
                                                   required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">输入新密码：</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="newPsw" id="newPsw" class="form-control"
                                                   placeholder="请输入新密码"
                                                   required/>
                                            <span class="help-block m-b-none">新密码不能和老密码保持一致</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">重复新密码：</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="rePsw" id="rePsw" class="form-control"
                                                   placeholder="重复新密码"
                                                   required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">提示：</label>
                                        <div class="col-sm-8" style="padding: 6px 0 0 15px;">
                                            <p class="text-danger">更改密码后，本系统登录密码和所有SVN项目认证密码都会被更新</p>
                                          </div>
                                    </div>
                                    <div class="form-group"></div>
                                    <div class="form-group">
                                        <div class="col-sm-12 col-sm-offset-3">
                                            <button class="btn btn-primary" type="submit">确认修改</button>
                                            <button class="btn btn-white" type="reset">取消</button>
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
</div>
<jsp:include page="../common/init_script.jsp"/>
<script type="text/javascript">
    seajs.use("${appPath}/script/modules/usr/usr_update_pswd");
</script>
</body>
</html>