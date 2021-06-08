<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Book list</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet"/>
    <link href="../css/simpleList.css" rel="stylesheet"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body id="page-top">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
        integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
        crossorigin="anonymous"></script>

<div class="container-fluid px-0">
    <nav class="navbar navbar-expand-sm navbar-dark bg-black py-0 px-0"><a class="navbar-brand" href="#"><img id="logo"
                                                                                                              src="https://i.imgur.com/K7Nwq4V.jpg">
        &nbsp;&nbsp;&nbsp;Bbookk</a> <span class="v-line"></span>
        <button class="navbar-toggler mr-3" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="/home?action=userMenu">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="/books">Books</a></li>
                <li class="nav-item"><a class="nav-link" href="/shelves">Shelf</a></li>
                <li class="nav-item"><a class="nav-link" href="/home?action=mainMenu">About</a></li>
            </ul>
        </div>
    </nav>
</div>

<!-- Masthead-->
<header class="masthead">
    <div class="container px-5 px-lg-6 h-100 position-relative">
        <div class="gx-4 gx-lg-1 h-80 align-items-start text-start text-weight-bold">
        </div>
    </div>
</header>

<%--Book List--%>
<jsp:include page="bookList.jsp">
    <jsp:param name="books" value="${books}" />
    <jsp:param name="categories" value="${categories}" />
    <jsp:param name="shelfList" value="${shelfList}" />
    <jsp:param name="message" value="${message}"/>
    <jsp:param name="q" value="#{q}"/>
    <jsp:param name="category_id" value="category_id"/>
</jsp:include>



<!-- Core theme JS-->
<script src="../js/mainMenu.js"></script>
</body>
</html>
