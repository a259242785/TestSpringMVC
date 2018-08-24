<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/3 0003
  Time: 下午 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("path",request.getContextPath());
%>
<html>
<head>
<title></title>
    <link href="${path}/statics/css/css/bootstrap.css" rel="stylesheet">
    <link href="${path}/statics/css/css/bootstrap-theme.css" rel="stylesheet">
    <script type="text/javascript" src="${path}/statics/js/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${path}/statics/js/js/bootstrap.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>用户管理</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <a class="btn btn-primary" href="${path }/emp/toAddEmp">新增</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>id</th>
                        <th>用户名</th>
                        <th>年龄</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.empid}</td>
                            <td>${emp.empname}</td>
                            <td>${emp.empage}</td>
                            <td>
                                <a type="button" href="${path}/emp/getEmp?id=${emp.empid}" class="btn btn-info btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </a>
                                <a type="button" href="${path}/emp/delEmp?id=${emp.empid}" class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>删除
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <hr style="height: 1px;border:none;border-top:1px solid #ccc;"/>
        <div class="row">
            <div class="col-md-6">
                当前第${pageInfo.pageNum}页|共${pageInfo.pages}页|共${pageInfo.total}条记录
            </div>
            <div class="row-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="${path}/emp/empPage">首页</a>
                        </li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${path}/emp/empPage?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="pagenum">
                            <c:if test="${pagenum==pageInfo.pageNum}">
                                <li class="active">
                                    <a href="#">${pagenum}</a>
                                </li>
                            </c:if>
                            <c:if test="${pagenum!=pageInfo.pageNum}">
                                <li><a href="${path}/emp/empPage?pn=${pagenum}">${pagenum}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${path}/emp/empPage?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li>
                            <a href="${path}/emp/empPage?pn=${pageInfo.pages}">末页</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
