<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Main menu</title>
    <style>
      .button{
        text-decoration: none;
        color: black;
      }
    </style>
  </head>
  <body>
  <h3> WELCOME</h3>
  <h4> Login Panel</h4>
  <form action="/userServlet?action=signIn" method="post">
    <table>
      <tr>
        <td>Username</td>
        <td><input type="text" name="email"></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><input type="text" name="password"></td>
      </tr>
      <tr>
        <td>
          <button> <a href="/userServlet?action=signUp" class="button"> Create new account</a></button>
        </td>
        <td> <input type="submit" value="Login"></td>
      </tr>
    </table>
  </form>
  </body>
</html>
