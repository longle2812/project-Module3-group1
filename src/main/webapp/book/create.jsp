<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/1/2021
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new book</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        .message {
            color: green;
        }

        .create-container {
            background-image: url(https://cdn.discordapp.com/attachments/416883390541725696/851016096219791360/register-background.jpg);
            height: 100vh;
            background-size: cover;
            display: flex;
            justify-content: flex-end;
        }

        .create-container .create-form {
            width: 400px;
            height: 100vh;
            background: #ffffff;
            padding: 20px
        }

        #title {
            text-align: center;
            font-size: 39px;
            color: #757575;
            font-family: sans-serif;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        input {
            padding: 10px 13px;
            border-radius: 5px;
            border: 1px solid #dbdbdb;
            width: 96%;
        }

        .input-wrapper {
            margin-bottom: 10px;
        }

        #btn {
            padding: 7px 18px;
            color: white;
            background-color: #007bff;
            border-width: 1px;
            border-radius: 3px;
            padding: 7px 18px;
            color: white;
            background-color: #007bff;
            border-width: 1px;
            border-radius: 3px;
        }
        .submit-wrapper{
            display:flex;
            justify-content: space-between;
            margin-top: 15px;
        }
        #category_id {
            height: 30px;
            width: 166px;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="create-container">
    <div class="create-form">
        <div id="title">Add new book</div>
        <p>
            <c:if test='${message!=null}'>
                <span class="message">${message}</span>
            </c:if>
        </p>

        <form action="" method="post">
            <fieldset>
                <legend>Book input information</legend>
                <div class="input-wrapper">
                    <input type="text" name="name" id="name" placeholder="Name...">
                </div>
                <div class="input-wrapper">
                    <input type="text" name="description" id="description" placeholder="Description">
                </div>
                <div class="input-wrapper"><input type="text" name="imgURL" id="imgURL" placeholder="Image url"></div>
                <div class="input-wrapper">
                    <input type="text" name="publisher" id="publisher" placeholder="Publisher">
                </div>
                <div class="form-check form-check-inline ">
                    <div class="input-wrapper">
                        <input class="form-check-input input-status" type="radio" name="status"
                               id="inlineRadio1" checked="checked"
                               value="new">
                        <label class="form-check-label" for="inlineRadio1">New book</label>
                    </div>
                </div>
                <div class="form-check form-check-inline">
                    <div class="input-wrapper">
                        <input class="form-check-input input-status" type="radio" name="status"
                               id="inlineRadio2"
                               value="old">
                        <label class="form-check-label" for="inlineRadio2">Old book</label>
                    </div>
                </div>
                <div class="input-wrapper">
                    <select name="category_id" id="category_id">
                        <c:forEach items="${categories.entrySet()}" var="category">
                            <option value="${category.getKey()}">
                                <c:out value="${category.getValue()}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="submit-wrapper">
                    <button id="btn">Add book</button>
                    <div><a href="/books">Back to book list</a></div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
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
