<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/3 0003
  Time: 下午 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>
<html>
<script type="text/javascript">
    function addEmp() {
        var form = document.forms[0];
        form.action="<%=basePath %>emp/addEmp";
        form.method="post";
        form.submit();
    }
</script>
<head>
    <title>添加用户</title>
</head>
<body>
    <h1>添加用户</h1>
    <form action="" name="empForm">
        姓名：<input type="text" name="empname">
        密码：<input type="password" name="emppwd">
        年龄：<input type="text" name="empage">
        职位：<input type="text" name="empdeptid">
        <input type="button" value="添加" onclick="addEmp()">
    </form>
</body>
</html>
