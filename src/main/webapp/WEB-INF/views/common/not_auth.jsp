<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>无权限访问 - ${applicationScope.sysName}</title>
    <meta name="renderer" content="webkit">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <style type="text/css">
        /* error page style */
        a {
            text-decoration: none;
        }
        .e404 {
            text-align: center;
            padding: 40px 0 60px;
            font-size: 16px;
            min-height: 500px;
            margin-top: 60px;
            color: #5F5E5E;
        }
        .e404 img {
            max-width: 100%
        }
        .e404 h3 {
            font-size: 20px;
            margin: 50px auto;
            max-width: 480px;
            color: red;
        }
    </style>
</head>

<body>
<div class="e404"><img src="http://7xpwl1.com1.z0.glb.clouddn.com/%40%2Fcommon%2Fhfb_bank_404.png">

    <%--<h1>500，server not explain your request! </h1>--%>

    <h3>该页面无权限访问，请联系管理员。</h3>
    <br>
</div>
</body>
</html>
