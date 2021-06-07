<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/1/2021
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book's detail</title>
    <link rel="stylesheet" href="../css/view-detail.css">
<body>
<header id="pageHeader">Header</header>
<article id="mainArticle">
    <div class="bookTitle"><h1>${book.name}</h1></div>
    <div class="bookAuthor">By Matt Haig</div>
    <div class="descriptionContainer">
        <div>Short description:</div>
        <div>${book.description}</div>
    </div>
    <div class="details">
        <h3>Details:</h3>
        <div>Hardcover, 288 pages</div>
        <div>Published September 29th 2020 by ${book.publisher} (first published August 13th 2020)</div>
        <table>
            <tr>
                <td class="infoBoxRowItem">Original Title</td>
                <td> ${book.name}</td>
            </tr>
            <tr>
                <td class="infoBoxRowItem">Setting</td>
                <td>Bedford, Bedfordshire, England</td>
            </tr>
            <tr>
                <td class="infoBoxRowItem">Edition Language</td>
                <td>English</td>
            </tr>
            <tr>
                <td class="infoBoxRowItem">Literary Awards</td>
                <td>Choice Award for Fiction (2020)</td>
            </tr>
        </table>
    </div>
</article>
<nav id="mainNav"><img src="${book.imgURL}" alt="book's image" width="100%" height="80%">
    <div style="margin-top:15px"><a href="/books?userID=${userID}">Back to book list</a></div>
</nav>
<footer id="pageFooter">Footer</footer>
</body>
</html>
