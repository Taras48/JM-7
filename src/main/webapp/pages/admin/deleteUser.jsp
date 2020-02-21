<%--
  Created by IntelliJ IDEA.
  User: TARAZ
  Date: 09.10.2019
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DeleteUser</title>
</head>
<body>
<h1>Delete User</h1>
<p><a href="/admin">All Users</a> |
    <a href="/admin/update">Update Users</a> |
    <a href="/admin/add">Add Users</a> |
    <a href="/helloUser">User psge</a> |
    <a href="/logout">logout</a>
</p>
<form action="/admin/delete" method="post">
    Id:<input type="number" name="id" value="${param.id}">><br/><br/>
    <button>Delete user</button>
</form>

</body>
</html>
