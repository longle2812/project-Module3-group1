<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shelf Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
<%--Bootstrap--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>

<%--Nav bar--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/shelves">Shelf</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/books">Books</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
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

<%--Create new shelf--%>
<div>
    <div class="card" style="width: 18rem;">
        <img src="img/shelf.png" class="card-img-top" alt="Create new shelf">
        <div class="card-body">
            <h5 class="card-title">Book shelf</h5>
            <p class="card-text">Create your customize book shelf</p>
            <a href="?action=create" class="btn btn-primary">Create</a>
        </div>
    </div>
</div>

<%--Show all shelf--%>
<c:forEach items='${requestScope["positionList"]}' var="position">
    <div style="display: inline-block">
        <div class="card" style="width: 20rem;">
            <img src="img/shelf.png" class="card-img-top" alt="Shelf">
            <div class="card-body">
                <h5 class="card-title">${position.getName()}</h5>
                <p class="card-text">${position.getUsing()} / ${position.getCapacity()}</p>
                <a href="?action=view&shelfID=${position.getId()}" class="btn btn-primary">View</a>
                <a href="?action=view" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</c:forEach>


</body>
</html>
