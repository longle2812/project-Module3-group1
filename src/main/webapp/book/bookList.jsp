<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Table V02</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/coreui/dist/css/coreui.min.css">
    <script src="https://unpkg.com/@coreui/coreui/dist/js/coreui.bundle.min.js"></script>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../css/utilBookList.css">
    <link rel="stylesheet" type="text/css" href="../css/bookList.css">
    <!--===============================================================================================-->
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
        integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
        crossorigin="anonymous"></script>


<div class="limiter">
    <div>
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
    </div>

    <div class="container-table100">
        <div style="margin-top: 20px; display: -webkit-inline-box; margin-left: 200px;">
            <a class="btn icon-btn btn-primary" href="/books?action=create"
               style="background-color: #3c4b64; border-color: #3c4b64">
                <span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"
                ></span>
                Create new book</a>
            <form class="form-inline">
                <input name="q" class="form-control mr-sm-2" type="nameSearch" placeholder="Enter book name"
                       aria-label="Search" style="width: 300px;margin-left: 360px;">
                <button id="searchBtn" class="btn btn-outline-success my-2 my-sm-0" type="submit"
                        style="color: white; line-height: 12px;">Search
                </button>
            </form>
        </div>
        <div class="wrap-table100" style="margin-top: 20px">
            <div class="table">
                <div class="row header">
                    <div class="cell">
                        ID
                    </div>
                    <div class="cell">
                        Name
                    </div>
                    <div class="cell">
                        Image
                    </div>
                    <div class="cell">
                        Status
                    </div>
                    <div class="cell" style="width: 100px;">
                        Description
                    </div>
                    <div class="cell">
                        Category
                    </div>
                    <div class="cell">
                        Publisher
                    </div>
                    <div class="cell">
                        Edit
                    </div>
                    <div class="cell">
                        Delete
                    </div>
                    <div class="cell">
                        Add to shelf
                    </div>
                </div>

                <c:forEach items='${books}' var="book">
                    <div class="row">
                        <div class="cell" data-title="ID">
                                ${book.id}
                        </div>
                        <div class="cell" data-title="Name">
                                ${book.name}
                        </div>
                        <div class="cell" data-title="Image">
                            <img src="${book.imgURL}" alt="book image" style="width: 100px;height: 100px">
                        </div>
                        <div class="cell" data-title="Status">
                            <c:if test="${book.status == 'new'}">
                                <span class="label label-default"
                                      style="color: white; background-color: #777"> New </span>
                            </c:if>
                            <c:if test="${book.status == 'old'}">
                                <span class="label label-warning"
                                      style="color: white; background-color: #5bc0de"> Old </span>
                            </c:if>
                        </div>
                        <div class="cell" data-title="Description">
                                ${book.description}
                        </div>
                        <div class="cell" data-title="Category">
                                ${categories.get(book.category_id)}
                        </div>
                        <div class="cell" data-title="Publisher">
                                ${book.publisher}
                        </div>
                        <div class="cell" data-title="Edit" style="padding: 10px">
                            <a class="btn btn-info" href="/books?action=edit&id=${book.id}" aria-label="Settings">
                                <i style="color: black" class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="cell" data-title="Delete">
                            <a id="deleteButton" class="btn btn-danger" href="/books?action=delete&id=${book.id}"
                               aria-label="Settings">
                                <i style="color: #000;" class="fa fa-trash" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="cell">
                            <button type="button" class="btn btn-success" data-toggle="modal"
                                    data-target="#exampleModal" data-add="${book.getId()}"
                                    style="background-color: #6c7ae0">
                                Add
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Which's shelf to add?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong> Choose your shelf to add:</strong>
                </div>
                <div>
                    <select class="form-control" id="dropDownList" name="dropDownList">
                        <option selected value="default"> Please select an option</option>
                        <c:forEach var="shelf" items="${shelfList}">
                            <option value="${shelf.getId()}"> ${shelf.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a id="addShelf" class="btn btn-success" role="button">Add</a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#exampleModal').on('show.bs.modal', function (e) {
            $("#dropDownList").change(function () {
                value = $(this).val();
            });
            var bookId = $(e.relatedTarget).data('add');
            $('#addShelf').click(function () {
                event.preventDefault();
                window.location.href = '/books?action=add&bookId=' + bookId + '&shelfId=' + value;
            });
            return false;
        });
    });
</script>
<!--===============================================================================================-->
<!--===============================================================================================-->
<script src="../vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="../js/bookList.js"></script>

</body>
</html>