<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charSet=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
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
            $("#addProduct").click(function () {


                // $.post("/products/cart" , {
                //     quantity:$("#quantity").val(),
                //     id:123
                // },function (result){
                //     alert("added to cart")
                // },"text");
                let productId = $('.getId').attr('id')

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "/products/cart",
                    data: JSON.stringify(
                        {
                            quantity: $("#quantity").val(),
                            productId: productId,
                            user:$("#email").text(),
                            productname:$("#productname").text()

                        }),
                    dataType: 'text',
                    cache: false,
                    timeout: 600000,
                    success: function (data) {


                        alert("Added to Cart");


                    },
                    error: function (e) {


                        console.log("ERROR : ", e);


                    }
                });


            });
        });
    </script>


</head>

<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="color:white"> Groceries Shopping</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="http://localhost:8080/products/home/${email}">Home</a></li>
            <%--            <li ><a href="http://localhost:8080/weather/weatherDetails">Weather Search</a></li>--%>

        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li><a   style="color:white"><span class="glyphicon glyphicon-user" id="email">${email} </span> </a></li>
            <li><a  href="http://localhost:8080/products/userCart/${email}" style="color:white"><span class="glyphicon glyphicon-user"></span> Cart</a></li>
            <li><a  href="http://localhost:8080/products/myorders/${email}" style="color:white"><span class="glyphicon glyphicon-user"></span> Orders</a></li>

            <li><a href="http://localhost:8080/user/login" style="color:white"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
        </ul>
    </div>
</nav>


<div class="container getId" id="${product.id}">
    <div class="row">

        <div class="col-md-6">
            <h2 id="productname">${product.name}</h2>
            <div>
                <img src="/uploads/${product.imgUrl}">
            </div>
            <br>
            <br>

            <label for="price">Price</label>
            <p id="price">$ ${product.price}</p>

            <br>

            <label for="category">category</label>
            <p id="category">${product.category}</p>
            <br>
            <span><label for="desc">description</label></span>
            <p id="desc">${product.description}</p>

            <br>
            <span><label for="quantity">quantity</label></span>
            <br>
            <input type="number" id="quantity" placeholder=0>

            <button class="btn btn-success" id="addProduct" value="submit" type="submit">Add Product to Cart</button>
        </div>

    </div>
</div>

</body>

</html>