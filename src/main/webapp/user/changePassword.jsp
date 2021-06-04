<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<h3> Change password</h3>
<body>
    <form method="post">
        <table>
            <tr>
                <td> Email: </td>
                <td> <c:out value="${user.getEmail()}"></c:out></td>
            </tr>
            <tr>
                <td> New password</td>
                <td> <input type="text" name="password"> </td>
            </tr>
            <tr>
                <td> Confirm new password</td>
                <td> <input type="text" name="confirmPassword"> </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <input type="submit" value="Update">
                </td>
            </tr>
            <tr>
                <c:if test='${requestScope["message"] != null}'>
                    <td style="color: red"><span>${requestScope["message"]}</span></td>
                </c:if>
            </tr>
        </table>
    </form>
</body>
</html>
