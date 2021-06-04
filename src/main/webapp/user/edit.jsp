<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User Information</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Edit shelf</h1>
<p>
    <c:if test='${message!=null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/home?action=userMenu">Back to homepage</a>
</p>


<form method="post">
    <fieldset>
        <legend>User input information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" placeholder="${user.getName()}"></td>
            </tr>
            <tr>
                <td>Date of birth</td>
                <td><input type="text" name="dob" id="dob" placeholder="${user.getdOb()}"></td>
            </tr>
            <tr>
                <td>Phone number</td>
                <td><input type="text" name="phoneNumber" id="phone" placeholder="${user.getPhoneNumber()}"></td>
            </tr>
            <tr>
                <td>Avatar URL</td>
                <td><input type="text" name="avatarURL" id="avatar" placeholder="${user.getAvatarURL()}"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button>Edit</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
