<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Book Management</title>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="https://unpkg.com/@coreui/coreui/dist/css/coreui.min.css">
    <script src="https://unpkg.com/@coreui/coreui/dist/js/coreui.bundle.min.js"></script>
    <link href="/css/bookList.css">
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


<%--List--%>
<div class="container">
    <div class="row ">
        <c:forEach items='${books}' var="book">
            <div class="col-sm-4 ">
                <div class="card-columns-fluid">
                    <div class="card bg-light" style="width: 20rem; ">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="400"
                             xmlns="http://www.w3.org/2000/svg" aria-label="Placeholder: Image cap"
                             preserveAspectRatio="xMidYMid slice" role="img"><title>Placeholder</title>
                            <rect width="100%" height="200%" fill="#868e96"/>
                            <image xlink:href="${book.imgURL}"/>
                        </svg>
                        <div class="card-body">
                            <h5 class="card-title "><a href="/books?action=view&id=${book.id}"> ${book.name}</a></h5>
                            <p class="card-text">${book.description}</p>
                            <a href="/books?action=edit&id=${book.id}" class="btn btn-primary">Edit</a>
                            <button type="button" class="btn btn-success" data-toggle="modal"
                                    data-target="#exampleModal" data-add="${book.getId()}">
                                Add to shelf
                            </button>
                            <a href="/books?action=delete&id=${book.id}" class="btn btn-danger">Delete</a>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div> <!--container div  -->
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
                <div >
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
                <a id="add-button" class="btn btn-success" role="button">Add</a>
            </div>
        </div>
    </div>
</div>

<script>

</script>

<script>
    $(document).ready(function () {
        $('#exampleModal').on('show.bs.modal', function (e) {
            $("#dropDownList").change(function(){
                value = $(this).val();
            });
            var bookId = $(e.relatedTarget).data('add');
            $('#add-button').click(function () {
                event.preventDefault();
                window.location.href = '/books?action=add&bookId=' + bookId+'&shelfId='+value;
            });
            return false;
        });
    });
</script>
</body>
</html>