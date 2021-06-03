<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/3/2021
  Time: 5:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book list</title>
    <style>
        table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 8px
        }

        th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
        }
        img{
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/books?action=create">Create new books</a>
</p>
<form action="/books?action=search" method="post">
    <input type="text" name="nameSearch" id="nameSearch" placeholder="Enter book name" >
    <button >Search book by name</button>
</form>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Image</th>
        <th>Status</th>
        <th>Category</th>
        <th>Publisher</th>
        <th>Position</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items='${books}' var="book">
        <tr>
            <td >${book.id}</td>
            <td><a href="/books?action=view&id=${book.id}">${book.name}</a></td>
            <td>${book.description}</td>
            <td><img src="${book.imageURL}" alt="book image"></td>
            <td>${book.status}</td>
            <td>${book.category_id}</td>
            <td>${book.publisher}</td>
            <td>${book.position}</td>
            <td><a href="/products?action=edit&id=${product.id}">Edit</a></td>
            <td><a href="/products?action=delete&id=${product.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
