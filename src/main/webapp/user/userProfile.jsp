<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
<%--Sign out button--%>
<form action="/userServlet"><input type="submit" value="Sign Out"></form>

<%--User Detail Form--%>
<p>
    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        <c:out value="${user.getName()}"></c:out>
    </a>
</p>
<div class="collapse" id="collapseExample">
    <div class="card card-body">
        <table id="userDetail">
            <tr>
                <td> Name:</td>
                <td><c:out value="${user.getName()}"></c:out></td>
            </tr>
            <tr>
                <td> Email:</td>
                <td><span name="email"><c:out value="${user.getEmail()}"></c:out></span></td>
            </tr>
            <tr>
                <td> Date of Birth:</td>
                <td><c:out value="${user.getdOb()}"></c:out></td>
            </tr>
            <tr>
                <td> Phone Number:</td>
                <td><c:out value="${user.getPhoneNumber()}"></c:out></td>
            </tr>
            <tr>
                <td> Avatar URL:</td>
                <td><c:out value="${user.getAvatarURL()}"></c:out></td>
            </tr>
            <tr>

                <td>
                    <a href="/userServlet?action=changePassword&email=${user.getEmail()}" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Change password</a>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</div>

<%--Nav bar--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Shelf</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Books</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    User Profile
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
</body>
</html>