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
    <link href="../css/thumbList.css">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
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


<div style="background-image: url(../images/blur-background-og.jpg); background-size: cover; background-repeat: no-repeat; background-position: bottom center">
    <%--Create new shelf--%>
    <div style="margin-left: 50px; padding-top: 20px ">
        <div class="card" style="width: 18rem;">
            <img src="../images/goodreads.png" class="card-img-top" alt="Create new shelf">
            <div class="card-body">
                <h5 class="card-title">Book shelf</h5>
                <p class="card-text">Create your customize book shelf</p>
                <a href="?action=create" class="btn btn-primary">Create</a>
            </div>
        </div>
    </div>

    <%--Show all shelf--%>
    <c:forEach items='${requestScope["positionList"]}' var="position">
        <div style="display: inline-block; margin-left: 50px; margin-top: 20px">
            <div class="card" style="width: 20rem;">
                <img src="../images/shelf.png" class="card-img-top" alt="Shelf">
                <div class="card-body">
                    <h5 class="card-title">${position.getName()}</h5>
                    <p class="card-text">${position.getUsing()} / ${position.getCapacity()}</p>
                    <a href="?action=view&shelfID=${position.getId()}" class="btn btn-primary">View</a>
                    <button id="deleteButton" type="button" class="btn btn-danger" data-toggle="modal"
                            data-target="#exampleModal" data-delete="${position.getId()}">
                        Delete
                    </button>
                    <a href="?action=edit&shelfID=${position.getId()}" class="btn btn-warning"> Edit </a>
                </div>
            </div>
        </div>
    </c:forEach>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Are you sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Be Careful</strong> Deleted shelf can not be recover!
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background-color: #4e555b">Please don't</button>
                    <a id="del-button" class="btn btn-danger" role="button" style="color: white">Delete</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#exampleModal').on('show.bs.modal', function (e) {
            var deleteid = $(e.relatedTarget).data('delete');
            $('#del-button').click(function () {
                window.location.href = '/shelves?action=delete&id=' + deleteid;
                return false;
            });
        });
    });
</script>

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
</body>
</html>