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

        img {
            width: 200px;
            height: 200px;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/books?action=create">Create new books</a>
</p>
<form action=""  >
    <input type="text" name="q" id="nameSearch" placeholder="Enter book name">
    <button>Search book by name</button>
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
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items='${books}' var="book">
        <tr>
            <td>${book.id}</td>
            <td><a href="/books?action=view&id=${book.id}">${book.name}</a></td>
            <td>${book.description}</td>
            <td><img src="${book.imgURL}" alt="book image"></td>
            <td>${book.status}</td>
            <td>
                    ${categories.get(book.category_id)}
            </td>
            <td>${book.publisher}</td>
            <td>
                <a href="/books?action=edit&id=${book.id}">
                    <button type="button" class="btn btn-primary" style="width:72px">Edit</button>
                </a>
            </td>
            <td>
                    <%--                ${book.id}--%>
                    <%--                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
                    <%--                        Delete--%>
                    <%--                    </button>--%>
                    <%--                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"--%>
                    <%--                         aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
                    <%--                        <div class="modal-dialog" role="document">--%>
                    <%--                            <div class="modal-content">--%>
                    <%--                                <div class="modal-header">--%>
                    <%--                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>--%>
                    <%--                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
                    <%--                                        <span aria-hidden="true">&times;</span>--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="modal-body">--%>
                    <%--                                    Are you sure you want to delete this book?--%>
                    <%--                                </div>--%>
                    <%--                                <div class="modal-footer">--%>
                    <%--                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>--%>
                    <%--                                    ${book.id}<button type="button" class="btn btn-primary">Delete</button>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                <a href="/books?action=delete&id=${book.id}">
                    <button type="button" class="btn btn-primary" style="width:72px">Delete</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
