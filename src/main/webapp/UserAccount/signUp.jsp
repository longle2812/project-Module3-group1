<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SignUp</title>
</head>
<body>
<h3>SignUp Panel</h3>
<form method="post">
    <table>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="password"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Date of birth</td>
            <td><input type="text" name="dob"></td>
        </tr>
        <tr>
            <td>
            </td>
            <td> <input type="submit" value="Create account"></td>
        </tr>
    </table>
</form>
</body>
</html>
