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
    <title>UpdateUser</title>
</head>
<body>
<h1>Update User</h1>
<p><a href="/admin">All Users</a> |
    <a href="/admin/add">add Users</a> |
    <a href="/admin/delete">Delete Users</a> |
    <a href="/helloUser">User psge</a> |
    <a href="/logout">logout</a>
</p>
<form action="/admin/update" method="post">
    <p>Id for update User: <input type="number" name="testId"  disabled value="${param.id}"/>
        NewName: <input type="text" name="newName" value="${param.name}"/>
        NewMail: <input type="text" name="newMail"value="${param.mail}" /></p>
    <p>NewPassword: <input type="password" name="newPassword" value="${param.password}">
        Role:<select type="text" name="role" >
            <option value="user">User</option>
            <option value="admin">Admin</option>
        </select>
    </p><br/><br/>
    <button>Update user</button>
</form>

</body>
</html>
