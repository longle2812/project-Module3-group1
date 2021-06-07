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
    <link href="../css/changePassword.css" rel="stylesheet"/>
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
                <li class="nav-item"><a class="nav-link" href="#">Books</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Shelf</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
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
    <%--Change password form--%>
    <div class="container d-flex justify-content-center" style="margin-top: -400px; margin-right: -200px">
        <form method="post">
            <%--Alert--%>
            <c:if test="${message == 'success'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Congratulation!</strong> Added successfully
                    </div>
            </c:if>
            <c:if test="${message == 'error'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Ops</strong> Password Mismatch
                </div>
            </c:if>
            <%--Form--%>
            <div class="d-flex flex-column justify-content-between">
                <div class="card two bg-white px-5 py-4 mb-3">
                    <div class="form-group"><input class="form-control" type="text" placeholder="${user.getEmail()}"
                                                   readonly></div>
                    <div class="form-group"><input name="password" type="password" class="form-control" id="name"
                                                   required><label class="form-control-placeholder"
                                                                   for="name">Password</label></div>
                    <div class="form-group"><input name="confirmPassword" type="password" class="form-control"
                                                   id="password" required><label class="form-control-placeholder"
                                                                                 for="password">Retype password</label>
                    </div>
                    <button id="buttonUpdate" type="submit" class="btn btn-primary btn-block btn-lg mt-1 mb-2" ><span>Change password<i
                            class="fas fa-long-arrow-alt-right ml-2"></i></span></button>
                </div>
            </div>
        </form>

    </div>
</header>


<!-- Footer-->
<footer>
    <div class="row justify-content-around mb-0 pt-5 mx-4">
        <div class="col-xl-2 col-md-4 order-xl-1 order-4 mr-xl-0 my-auto">
            <ul class="list-unstyled mt-md-3 mt-5">
                <li>Social Media</li>
                <li class="social"><span> <i class="fa fa-facebook" aria-hidden="true"></i></span> <span> <i
                        class="fa fa-instagram" aria-hidden="true"></i> </span> <span> <i class="fa fa-twitter"
                                                                                          aria-hidden="true"></i> </span>
                </li>
            </ul>
            <ul class="list-unstyled my-xl-4 my-md-3">
                <li>Copyright</li>
                <li>&#9400; Codegym 2021</li>
            </ul>
        </div>
        <div class="col-xl-2 col-md-3 pt-4 order-1">
            <ul class="list-unstyled">
                <li class="mt-md-0 mt-4">Our Solution</li>
                <li>Intergrated Security</li>
                <li>Core Features</li>
                <li>Product Features</li>
                <li>Pricing</li>
            </ul>
        </div>
        <div class="col-xl-2 col-md-3 pt-4 order-2">
            <ul class="list-unstyled">
                <li class="mt-md-0 mt-4">Your needs</li>
                <li>Intergrated Security</li>
                <li>Core Features</li>
                <li>Product Features</li>
                <li>Pricing</li>
            </ul>
        </div>
        <div class="col-xl-auto col-md-3 pt-4 my-sm-0 order-md-3 order-sm-1 ">
            <ul class="list-unstyled">
                <li class="mt-md-0 mt-4">Offer</li>
                <li>Intergrated Security</li>
                <li>Core Features</li>
                <li>Product Features</li>
                <li>Pricing</li>
            </ul>
        </div>
        <div class="col-xl-auto col-md-6 col-12 pt-4 my-sm-0 order-6 ">
            <div class="form-group "><label for="email" class="mb-3"><b>Subscribe to our newsletter and Get 10% off</b></label><input
                    type="email" class="form-control form-control-lg" placeholder="Enter email" id="email"></div>
            <button type="button" class="btn btn-primary btn-lg btn-block my-2 Subscribe mt-4 mb-3">Subscribe</button>
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
