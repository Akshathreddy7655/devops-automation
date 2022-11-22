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
        $(document).ready(function () {
            <%--var error=${error};--%>
            <%--if(error =='Product updated'){--%>
            <%--    alert("Product updated")--%>
            <%--}--%>
            $("#delete").click(function () {
                var id = $("#id").val();

                // alert(id);
                $.get("/products/delete/" + id, function (data, status) {
                    //  alert("Data: " + data.name + "\nStatus: " + status);
                    alert("deleted");
                    location.href="/products/adminHome";
                });


            });


            $.get("/products/getdistinct", function (data, status) {
                //  alert("Data: " + data.lat + "\nStatus: " + status);

                var s = '<option value="-1">Please Select a Category</option>';
                for (var i = 0; i < data.length; i++) {
                    s += '<option value="' + data[i].name + '">' + data[i].name + '</option>';
                }


                $("#category").html(s);

                $("#category option[value='${product.category}']").attr("selected", "selected");

            });


        })

    </script>


</head>

<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="color:white"> Groceries Shopping</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="http://localhost:8080/products/adminHome">Home</a></li>
            <li ><a href="http://localhost:8080/products/addCategory">Add Category</a></li>
            <li ><a href="http://localhost:8080/products/addProduct">Add Product</a></li>
            <li ><a href="http://localhost:8080/products/adminViewOrders">Accept Orders</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">

            <li><a href="http://localhost:8080/user/login" style="color:white"><span
                    class="glyphicon glyphicon-user"></span> Logout</a></li>
        </ul>
    </div>
</nav>


<div class="container" style="margin: 20px">
    <h2>${error}</h2>
    <div class="row">


        <div class="row">
            <div class="col-md-6">

                <%--                <img src="${product.imgUrl}">--%>
                <%--                <h2>${product.name}</h2>--%>
                <%--                <h3>$ ${product.price}</h3>--%>
                <%--                <h3>${product.category}</h3>--%>
                <%--                <h3>${product.description}</h3>--%>

                <form:form method="post" enctype="multipart/form-data" action="/products/updateProduct"
                           modelAttribute="product">
                    <div class="form-group">
                        <label for="id">Id</label>
                        <form:input type="text" class="form-control" path="id" placeholder="id" readonly="true"></form:input>
                    </div>

                    <div class="form-group">
                        <label for="name">Name</label>
                        <form:input type="text" class="form-control" path="name" placeholder="Name"></form:input>
                    </div>
                    <div class="form-group">
                        <label for="imgUrl">Image Url</label>
                        <form:input type="file" class="form-control" path="imgUrl" placeholder="imgUrl"></form:input>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <form:input type="text" class="form-control" path="description"
                                    placeholder="description"></form:input>
                    </div>
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select class="form-control" id="category" name="category"></select>

                    </div>

                    <div class="form-group">
                        <label for="price">Price</label>
                        <form:input type="number" class="form-control" path="price" placeholder="price"></form:input>
                    </div>


                    <div class="form-group" style="text-align: center;">
                        <button class="btn btn-success" value="Add" type="Product">Update Product</button>
                    </div>

                </form:form>
                    <div class="form-group" style="text-align: center;">
                        <button class="btn btn-success"   id="delete" type="delete">delete</button>
                    </div>
            </div>
        </div>




    </div>
</div>

</body>

</html>