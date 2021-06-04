<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/1/2021
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new book</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Add new book</h1>
<p>
    <c:if test='${message!=null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/books">Back to book list</a>
</p>

<form action="" method="post">
    <fieldset>
        <legend>Book input information</legend>
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
                <td>Image URL</td>
                <td><input type="text" name="imgURL" id="imgURL"></td>
            </tr>
            <tr>
                <td>Status</td>
                <td>
                    <label class="container">New
                        <input type="radio" checked="checked" name="status" value="new">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">Old
                        <input type="radio" name="status" value="old">
                        <span class="checkmark"></span>
                    </label>
                </td>
            </tr>
            <tr>
                <td>Category</td>
                <td>
                    <select name="category_id" id="category_id">
                        <c:forEach items="${categories.entrySet()}" var="category">
                            <option value="${category.getKey()}">
                                <c:out value="${category.getValue()}"/>
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Publisher</td>
                <td><input type="text" name="publisher" id="publisher"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button>Add book</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
