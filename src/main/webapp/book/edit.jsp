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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .edit-container {
            background: url(https://media.discordapp.net/attachments/416883390541725696/851112158577164308/login-background.jpg?width=711&height=473);
            height: 100vh;
            background-size: cover;
            display: flex;
            justify-content: flex-end;
        }

        .title {
            text-align: center;
            font-size: 39px;
            color: #757575;
            font-family: sans-serif;
            padding-top: 20px;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .edit-form {
            width: 400px;
            height: 100vh;
            background: #ffffff;
            padding: 20px;
        }

        .submit-wrapper {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }

        .btn {
            padding: 7px 18px;
            color: white;
            background-color: #007bff;
            border-width: 1px;
            border-radius: 3px;
        }

        input {
            width: 136%;
            padding: 10px 13px;
            border-radius: 5px;
            border: 1px solid #dbdbdb;
        }

        #category_id {
            width: 106px;
            height: 33px;
        }

        .input-status {
            width: 30%;
        }
        .input-wrapper{
            margin-bottom:10px;
        }
    </style>
</head>
<body>
<div class="edit-container">
    <div class="edit-form">
        <div class="title">Edit book</div>
        <p>
            <c:if test='${message!=null}'>
                <span>${message}</span>
            </c:if>
        </p>
        <form action="" method="post">
            <fieldset>
                <legend>Book information</legend>
                <table>
                    <tr>
                        <td>
                            <div class="input-wrapper">
                                Name:
                            </div>
                        </td>
                        <td>
                            <div class="input-wrapper">
                                <input type="text" name="name" id="name" value="${book.name}">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-wrapper">
                                Description:
                            </div>
                        </td>
                        <td>
                            <div class="input-wrapper"><input type="text" name="description" id="description"
                                                              value="${book.description}"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-wrapper">Image URL:</div>
                        </td>
                        <td>
                            <div class="input-wrapper"><input type="text" name="imgURL" id="imgURL"
                                                              value="${book.imgURL}"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-wrapper">Status:</div>
                        </td>
                        <td>
                            <div class="input-wrapper">
                                <label class="container">New book
                                    <c:if test='${((book.status).equals("new"))}'>
                                        <input type="radio" checked="checked" name="status" value="new"
                                               class="input-status">
                                    </c:if>
                                    <c:if test='${!((book.status).equals("new"))}'>
                                        <input type="radio" name="status" value="new" class="input-status">
                                    </c:if>
                                    <span class="checkmark"></span>
                                </label>
                                <label class="container">Old book
                                    <c:if test='${((book.status).equals("old"))}'>
                                        <input type="radio" name="status" checked="checked" value="old"
                                               class="input-status">
                                    </c:if>
                                    <c:if test='${!((book.status).equals("old"))}'>
                                        <input type="radio" name="status" value="old" class="input-status">
                                    </c:if>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-wrapper">Category:</div>
                        </td>
                        <td>
                            <div class="input-wrapper">
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
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input-wrapper">Publisher:</div>
                        </td>
                        <td>
                            <div class="input-wrapper"><input type="text" name="publisher" id="publisher"
                                                              value="${book.publisher}">
                            </div>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <div class="submit-wrapper">
                <button class="btn" type='submit'>Update book</button>
                <div><a href="/books">Back to user list</a></div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
