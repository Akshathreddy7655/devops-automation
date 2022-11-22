<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charSet=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- CSS only -->

    <style>
        .navbar-inverse {
            background-color: #337ab7;
            border-color: #337ab7;

        }

        .navbar-inverse .navbar-brand {
            color: #fff;
        }

        .navbar {
            border-radius: 0px;
        }

        .navbar-inverse .navbar-nav > li > a {
            color: #f8f8f8;
        }

        .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
            color: #fff;
            background-color: #337ab7;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>


    </script>


</head>

<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="color:white"> Groceries Shopping</a>
        </div>
        <ul class="nav navbar-nav">
            <li ><a href="http://localhost:8080/products/adminHome">Home</a></li>
            <li class="active"><a href="http://localhost:8080/products/addCategory">Add Category</a></li>
            <li ><a href="http://localhost:8080/products/addProduct">Add Product</a></li>
            <li ><a href="http://localhost:8080/products/adminViewOrders">Accept Orders</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">

            <li><a href="http://localhost:8080/user/login" style="color:white"><span
                    class="glyphicon glyphicon-user"></span> Logout</a></li>
        </ul>
    </div>
</nav>


<div class="container-fluid" style="margin: 20px">
    <h2>${error}</h2>
    <div class="row">




        <div class="row">
            <div class="col-md-6">
                <form:form method="post"   enctype="multipart/form-data" action="/products/saveCategory" modelAttribute="category">


                    <div class="form-group">
                        <label for="name">Category Name</label>
                        <form:input type="text" class="form-control" path="name" placeholder="Name"></form:input>
                    </div>
                    <div class="form-group">
                        <label for="imgUrl">Image Url</label>
                        <form:input type="file" class="form-control" path="imgUrl" placeholder="imgUrl"></form:input>
                    </div>




                    <div class="form-group" style="text-align: center;">
                        <button class="btn btn-success"   value="Add" type="Category">Add Category</button>
                    </div>

                </form:form>
            </div>
        </div>


        <%--            <div onclick="window.location.href='http://localhost:8080/companies/home'" class="col-sm-3 .bg-success.bg-gradient"  id="${value} ">--%>

        <%--                <h3>${value}</h3>--%>

        <%--            </div>--%>


    </div>
</div>

</body>

</html>