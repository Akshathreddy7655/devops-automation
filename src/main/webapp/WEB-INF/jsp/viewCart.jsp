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

            $("#order").click(function () {

                let arr = [];
                $(".items").each(function () {

                    var id = $(this).find(".getId").attr('id');
                    var name = $(this).find("#name").text();

                    var cost = $(this).find("#cost").text();
                    var quantity = $(this).find("#quantity").val();

                    var productId=$(this).find(".getpId").attr('id');

                    console.log(id);
                    console.log(name);
                    console.log(cost.split(","));
                    console.log(quantity);
                    console.log(productId);
                    arr.push({
                        cartId:id,
                        name:name,
                        cost:parseInt(cost.split(" ")[1]),
                        quantity:parseInt(quantity),
                        productId:productId,
                        user:$('#email').text()
                    })

                });
                console.log(arr)

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "/products/order",
                    data: JSON.stringify(

                           arr

                        ),
                    dataType: 'text',
                    cache: false,
                    timeout: 600000,
                    success: function (data) {


                    //    alert(data);
                        location.href="/products/payment/"+$('#email').text()+"/"+data;

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
            <li><a   style="color:white"><span class="glyphicon glyphicon-user" id="email">${email}</span> </a></li>
            <li><a  href="http://localhost:8080/products/userCart/${email}" style="color:white"><span class="glyphicon glyphicon-user"></span> Cart</a></li>
            <li><a  href="http://localhost:8080/products/myorders/${email}" style="color:white"><span class="glyphicon glyphicon-user"></span> Orders</a></li>

            <li><a href="http://localhost:8080/user/login" style="color:white"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
        </ul>
    </div>
</nav>


<div class="container">
    <h1>Cart</h1>
    <br>
    <br>

    <c:forEach items="${cart}" var="value">
        <div class="row items">
            <div
                    class="col-sm-12 .bg-success.bg-gradient getId" id="${value.id} ">

                <div class="col-sm-4 getpId" id="${value.productId}">
                    <img src="/uploads/${value.imgUrl}">
                </div>
                <div class="col-sm-4">
                    <h3 id="name">${value.productName}</h3>
                    <h3 id="cost">$ ${value.cost}</h3>
                </div>
                <div class="col-sm-4">
                    <input type="number" id="quantity" value="${value.quantity}">

                </div>


            </div>
        </div>
    </c:forEach>

    <button style="margin-left: 400px" class="btn btn-success" id="order" value="submit" type="submit">make payment</button>


</div>

</body>

</html>