<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SignUp</title>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<h3>SignUp Panel</h3>
<form method="post">
    <table>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
            <c:if test="${emailErr == true}">
            <td class="error"> Invalid Email </td>
            </c:if>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"></td>
            <c:if test="${passErr == true}">
                <td class="error"> Invalid Password </td>
            </c:if>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"></td>
            <td></td>
        </tr>
        <tr>
            <td>Date of birth</td>
            <td><input type="text" name="dob"></td>
            <td></td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td><input type="text" name="phoneNumber"></td>
            <td></td>
        </tr>
        <tr>
            <td>
            </td>
            <td> <input type="submit" value="Create account"></td>
            <c:if test='${requestScope["message"] == "Error"}'>
                <td style="color: red"> <span >${requestScope["message"]}</span> </td>
            </c:if>
            <c:if test='${requestScope["message"] == "Success"}'>
                <td style="color: green"> <span >${requestScope["message"]}</span> </td>
            </c:if>
        </tr>
    </table>
</form>
</body>
</html>
