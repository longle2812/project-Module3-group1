<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <!-- Main css -->
    <link rel="stylesheet" href="../css/signUpMenu.css">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>

<div class="main">
    <div class="container">
        <div class="signup-content">
            <form method="POST" id="signup-form" class="signup-form" class="needs-validation" novalidate>
                <h2>Sign up </h2>
                <p class="desc">Sponsor by Batman </p>
                <c:if test="${message == 'Success'}">
                    <div class="alert alert-success" role="alert">
                        Your account has been created successfully
                    </div>
                </c:if>
                <c:if test="${message == 'Error'}">
                    <div class="alert alert-danger" role="alert">
                        Something wrong with your account
                    </div>
                </c:if>

                <div class="form-group">
                    <input type="email" class="form-input" name="email" placeholder="Email" required/>
                    <c:if test="${emailErr == true}">
                        <td><span style="color: yellow">Invalid Email</span></td>
                    </c:if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-input" name="password" id="password" placeholder="Password"/>
                    <c:if test="${passErr == true}">
                        <td> <span style="color: yellow">Invalid Password</span></td>
                    </c:if>
                    <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                </div>
                <div class="form-group">
                    <input type="text" class="form-input" name="name" id="name" placeholder="Your name"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-input" name="dob" id="dob" placeholder="Your date of birth"/>
                </div>
                <div class="form-group">
                    <input type="number" class="form-input" name="phoneNumber" id="phoneNumber"
                           placeholder="Your phone"/>
                </div>
                <div class="form-group">
                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"/>
                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in
                        <a href="#" class="term-service">Terms of service</a></label>
                    <div class="invalid-feedback">You must agree before submitting.</div>
                </div>
                <div class="form-group">
                    <input type="submit" name="submit" id="submit" class="form-submit submit" value="Sign up"/>
                    <a href="/home" class="submit-link submit">Sign in</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- JS -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../js/signUp.js"></script>
</body><!-- This templates was made by Colorlib-->
</html>