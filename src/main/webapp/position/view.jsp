<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Shelf</title>
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

        img {
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
<h3> </h3>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Image</th>
        <th>Status</th>
        <th>Category</th>
        <th>Publisher</th>
        <th>Delete</th>
    </tr>
    <c:forEach items='${books}' var="book">
        <tr>
            <td>${book.getId()}</td>
            <td><a href="/books?action=view&id=${book.getId()}">${book.getName()}</a></td>
            <td>${book.getDescription()}</td>
            <td><img src="${book.getImgURL()}" alt="book image"></td>
            <td>${book.getStatus()}</td>
            <td>
                    ${categories.get(book.getCategory_id)}
            </td>
            <td>${book.getPublisher()}</td>
            <td><a href="/shelves?action=deleteBook&bookId=${book.getId()}&shelfId=${shelfId}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
