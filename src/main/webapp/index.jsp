<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main menu</title>
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

<h3> WELCOME</h3>
<h4> Login Panel</h4>
<%--<div>--%>
<%--    <form action="/userServlet?action=signIn" method="post">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td>Username</td>--%>
<%--                <td><input type="text" name="email"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Password</td>--%>
<%--                <td><input type="password" name="password"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <button><a href="/userServlet?action=signUp" class="button"> Create new account</a></button>--%>
<%--                </td>--%>
<%--                <td><input type="submit" value="Login"></td>--%>

<%--            </tr>--%>
<%--            <c:if test="${message != null}">--%>
<%--                <tr>--%>
<%--                    <td style="color: red">Invalid email or password</td>--%>
<%--                </tr>--%>
<%--            </c:if>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>
<%--New Menu--%>
    <form class="px-4 py-3" action="/home?action=signIn" method="post">
        <div class="mb-3">
            <label for="exampleDropdownFormEmail1" class="form-label">Email address</label>
            <input name="email" type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
        </div>
        <div class="mb-3">
            <label for="exampleDropdownFormPassword1" class="form-label">Password</label>
            <input name="password" type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
        </div>
        <div class="mb-3">
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="dropdownCheck">
                <label class="form-check-label" for="dropdownCheck">
                    Remember me
                </label>
            </div>
        </div>
<%--        <a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Sign In</a>--%>
        <button type="submit" class="btn btn-primary" >Sign in</button>
    </form>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="/home?action=signUp">New around here? Sign up</a>
    <a class="dropdown-item" href="#">Forgot password?</a>
</body>
</html>
