<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new shelf</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Add new shelf</h1>
<p>
    <c:if test='${message!=null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/shelves">Back to your shelf</a>
</p>


<form action="/shelves?action=create" method="post">
    <fieldset>
        <legend>Shelf input information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td>Capacity</td>
                <td><input type="text" name="capacity" id="capacity"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button>Add shelf</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
