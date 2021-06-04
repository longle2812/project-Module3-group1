<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit shelf</title>
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
    <a href="/shelves">Back to your shelf</a>
</p>


<form action="?action=edit&shelfId=${shelf.getId()}" method="post">
    <fieldset>
        <legend>Shelf input information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" placeholder="${shelf.getName()}"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description" id="description" placeholder="${shelf.getDescription()}"></td>
            </tr>
            <tr>
                <td>Capacity</td>
                <td><input type="text" name="capacity" id="capacity" placeholder="${shelf.getCapacity()}"> </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button>Edit shelf</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
