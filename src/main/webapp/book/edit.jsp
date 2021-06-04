<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/1/2021
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit book</title>
    <style>
        span {
            color: green;
        }
    </style>
</head>
<body>
<h1>Edit book</h1>
<p>
    <c:if test='${message!=null}'>
        <span>${message}</span>
    </c:if>
</p>
<p>
    <a href="/books">Back to user list</a>
</p>
<form action="" method="post">
    <fieldset>
        <legend>Book information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" value="${book.name}"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description" id="description" value="${book.description}"></td>
            </tr>
            <tr>
                <td>Image URL</td>
                <td><input type="text" name="imgURL" id="imgURL" value="${book.imgURL}"></td>
            </tr>
            <tr>
                <td>Status</td>
                <td>
                    <label class="container">New
                        <c:if test='${((book.status).equals("new"))}'>
                            <input type="radio" checked="checked" name="status" value="new">
                        </c:if>
                        <c:if test='${!((book.status).equals("new"))}'>
                            <input type="radio" name="status" value="new">
                        </c:if>
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">Old
                        <c:if test='${((book.status).equals("old"))}'>
                            <input type="radio" name="status" checked="checked" value="old">
                        </c:if>
                        <c:if test='${!((book.status).equals("old"))}'>
                            <input type="radio" name="status" value="old">
                        </c:if>
                        <span class="checkmark"></span>
                    </label>
                </td>
            </tr>
            <tr>
                <td>Category</td>
                <td>
                    <select name="category_id" id="category_id">
                        <c:forEach items="${categories.entrySet()}" var="category">
                            <c:if test="${book.category_id == category.getKey()}">
                                <option value="${category.getKey()}" selected="selected">
                                    <c:out value="${category.getValue()}"/>
                                </option>
                            </c:if>
                            <c:if test="${!(book.category_id == category.getKey())}">
                                <option value="${category.getKey()}">
                                    <c:out value="${category.getValue()}"/>
                                </option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Publisher</td>
                <td><input type="text" name="publisher" id="publisher" value="${book.publisher}"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button>Update book</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
