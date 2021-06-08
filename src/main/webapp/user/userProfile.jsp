<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>User profile</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
          rel="stylesheet" type="text/css"/>
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/profile.css" rel="stylesheet"/>
</head>
<body id="page-top">
<div class="container-fluid px-0">
    <nav class="navbar navbar-expand-sm navbar-dark bg-black py-0 px-0"><a class="navbar-brand" href="#"><img id="logo"
                                                                                                              src="https://i.imgur.com/K7Nwq4V.jpg">
        &nbsp;&nbsp;&nbsp;Bbookk</a> <span class="v-line"></span>
        <button class="navbar-toggler mr-3" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="?action=userMenu">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="/books">Books</a></li>
                <li class="nav-item"><a class="nav-link" href="/shelves">Shelf</a></li>
                <li class="nav-item"><a class="nav-link" href="/home?action=mainMenu">About</a></li>
                <li class="nav-item active"><a class="nav-link" href="/home">Sign Out</a></li>
            </ul>
        </div>
    </nav>
</div>

<!-- Masthead-->
<header class="masthead">
    <div class="container px-5 px-lg-6 h-100 position-relative">
        <div class="gx-4 gx-lg-1 h-80 align-items-start text-start text-weight-bold">
            <h1 class=" row text-white font-weight-bold">A SOFA,</h1>
            <h1 class=" row text-white font-weight-bold"> A GOOD </h1>
            <h1 class=" row text-white font-weight-bold"> BOOK,</H1>
            <h1 class=" row text-white font-weight-bold"> AND YOU.</H1>
        </div>
    </div>
</header>

<%--Profile info--%>
<form action="?action=edit" method="post">
<div id="profile" class="wrapper bg-white mt-sm-5">
    <%--Alert--%>
    <c:if test="${message == 'success'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Congratulation!</strong> Added successfully
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <c:if test="${message == 'error'}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Ops</strong> This book is already in this shelf
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <h4 class="pb-4 border-bottom">Account settings</h4>
    <div class="d-flex align-items-start py-3 border-bottom"> <img src="https://images.pexels.com/photos/1037995/pexels-photo-1037995.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" class="img" alt="">
        <div class="pl-sm-4 pl-4" id="img-section" style="margin-left: 10px "> <b>Profile Photo</b>
            <p>Accepted file type .png. Less than 1MB</p> <button id="upload-button" class="btn button border" ><b>Upload</b></button>
        </div>
    </div>
    <div class="py-2">
        <div class="row py-2">
            <div class="col-md-6"> <label for="name">Full Name</label> <input name="name" type="text" class="bg-light form-control" placeholder="${user.getName()}"> </div>
            <div class="col-md-6 pt-md-0 pt-3"> <label for="lastname">Date of birth</label> <input name="dob" type="text" class="bg-light form-control" placeholder="${user.getdOb()}"> </div>
        </div>
        <div class="row py-2">
            <div class="col-md-6"> <label for="email">Email Address</label> <input type="text" name="email" class="bg-light form-control" placeholder="${user.getEmail()}"> </div>
            <div class="col-md-6 pt-md-0 pt-3"> <label for="phone">Phone Number</label> <input name="phoneNumber" type="tel" class="bg-light form-control" placeholder="${user.getPhoneNumber()}"> </div>
        </div>
        <div class="row py-2">
            <div class="col-md-6"> <label for="avatarURL">Avatar URL</label> <input type="text" name="avatarURL" class="bg-light form-control" placeholder="${user.getAvatarURL()}"> </div>
            <div class="col-md-6 pt-md-0 pt-3" id="lang"> <label for="language">Language</label>
                <div class="arrow"> <select name="language" id="language" class="bg-light">
                    <option value="english" selected>English</option>
                    <option value="english_us">English (United States)</option>
                    <option value="enguk">English UK</option>
                    <option value="arab">Vietnamese</option>
                </select> </div>
            </div>
        </div>
        <div class="py-3 pb-4 border-bottom">
            <button type="submit" class="btn btn-primary mr-3" style="background-color: #0779e4"><a style="text-decoration: none; color: white">Save Changes</a></button>
            <button type="reset" class="btn border button">Cancel</button> </div>
        <div class="d-sm-flex align-items-center pt-3" id="changePass">
            <div> <b>Change your password</b>
                <p>Be careful with this function</p>
            </div>
            <div style="margin-left: 20px">
                <a href="/home?action=changePassword" class="btn btn-danger btn-sm active" role="button" aria-pressed="true">Change password</a>
            </div>

        </div>
    </div>
</div>
</form>
<!-- Footer-->
<footer>
    <div class="row justify-content-around mb-0 pt-5 mx-4">
        <div class="col-xl-2 col-md-4 order-xl-1 order-4 mr-xl-0 my-auto">
            <ul class="list-unstyled mt-md-3 mt-5">
                <li>Social Media</li>
                <li class="social"> <span> <i class="fa fa-facebook" aria-hidden="true"></i></span> <span> <i class="fa fa-instagram" aria-hidden="true"></i> </span> <span> <i class="fa fa-twitter" aria-hidden="true"></i> </span> </li>
            </ul>
            <ul class="list-unstyled my-xl-4 my-md-3">
                <li>Copyright</li>
                <li>&#9400; Codegym 2021</li>
            </ul>
        </div>
        <div class="col-xl-2 col-md-3 pt-4 order-1">
            <ul class="list-unstyled">
                <li class="mt-md-0 mt-4">Our Solution</li>
                <li>Intergrated Security </li>
                <li>Core Features</li>
                <li>Product Features</li>
                <li>Pricing</li>
            </ul>
        </div>
        <div class="col-xl-2 col-md-3 pt-4 order-2">
            <ul class="list-unstyled">
                <li class="mt-md-0 mt-4">Your needs</li>
                <li>Intergrated Security </li>
                <li>Core Features</li>
                <li>Product Features</li>
                <li>Pricing</li>
            </ul>
        </div>
        <div class="col-xl-auto col-md-3 pt-4 my-sm-0 order-md-3 order-sm-1 ">
            <ul class="list-unstyled">
                <li class="mt-md-0 mt-4">Offer</li>
                <li>Intergrated Security </li>
                <li>Core Features</li>
                <li>Product Features</li>
                <li>Pricing</li>
            </ul>
        </div>
        <div class="col-xl-auto col-md-6 col-12 pt-4 my-sm-0 order-6 ">
            <div class="form-group "><label for="email" class="mb-3"><b>Subscribe to our newsletter and Get 10% off</b></label><input type="email" class="form-control form-control-lg" placeholder="Enter email" id="email"></div><button type="button" class="btn btn-primary btn-lg btn-block my-2 Subscribe mt-4 mb-3">Subscribe</button>
        </div>
    </div>
    <div class="row justify-content-center px-3 py-3 pt-5">
        <div class="col text-center">
            <p class="mb-0">*These statement have not evaluated by the Food and Drug Addministrations.</p>
            <p>This product is not intented to diagonse,treat,cure, or prevent any disease.</p>
        </div>
    </div>
</footer>


<!-- SimpleLightbox plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<!-- Core theme JS-->
<script src="../js/mainMenu.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
</body>
</html>
