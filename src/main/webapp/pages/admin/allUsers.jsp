<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Users</title>
</head>
<body>
<h1>All Users</h1>
<p><a href="/admin/add">Add Users</a> |
    <a href="/admin/update">Update Users</a> |
    <a href="/admin/delete">Delete Users</a> |
    <a href="/helloUser">User psge</a> |
    <a href="/logout">logout</a>
</p>
<c:if test="${list.size() > 0}">
    <table border="1px solid black">
        <tr>
            <td>Id</td>
            <td>Name</td>
            <td>Password</td>
            <td>Message</td>
            <td>Role</td>
        </tr>

        <c:forEach var="user" items="${list}">
            <tr>
                <td>${user.getId()}</td>
                <td>${user.getName()}</td>
                <td>${user.getPassword()}</td>
                <td>${user.getMessage()}</td>
                <td><c:forEach var="role" items="${user.getRoles()}">
                    ${role.toString()}<br>
                </c:forEach>
                </td>
                <td>
                    <a href="/admin/update?id=<c:out value='${user.getId()}' />&name=<c:out value='${user.getName()}'/>
                    &mail=<c:out value='${user.getMail()}' />&role=<c:out value='${user.getRole()}'/>
                     &password=<c:out value='${user.getPassword()}'/>">Update</a>
                    |
                    <a href="/admin/del?id=<c:out value='${user.getId()}' />">Delete</a>
                </td>
            </tr>

        </c:forEach>
    </table>
</c:if>
<c:if test="${list.size() == 0}">
    <h3>Table is empty</h3>
</c:if>
</body>
</html>
