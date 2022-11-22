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



                var firstName = $("#firstName").val();

                var emailId = $("#emailId").val();
                var cardNo = $("#cardNo").val();

                var price = $("#price").val();
                var cvv = $("#cvv").val();
                var orderId = $("#orderId").val();


                let data = {
                    firstName: firstName,
                    emailId: emailId,
                    price: parseInt(price),
                    cvv: parseInt(cvv),
                    cardNo: cardNo,
                    orderId: orderId

                };

                console.log(data)

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "/products/orderpayment",
                    data: JSON.stringify(
                        data
                    ),
                    dataType: 'text',
                    cache: false,
                    timeout: 600000,
                    success: function (data) {


                        alert("Ordered");
                        location.href="/products/home/"+$('#email').text();


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
            <li><a style="color:white"> <span class="glyphicon glyphicon-user" id="email">${email}</span> </a></li>


            <li><a href="http://localhost:8080/user/login" style="color:white"><span
                    class="glyphicon glyphicon-user"></span> Logout</a></li>
        </ul>
    </div>
</nav>


<div class="container">
    <h1>Payment</h1>
    <br>
    <br>
    <form>
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="orderId">orderId</label>
                <input type="text" class="form-control" id="orderId" placeholder="orderId" value="${orderId}"  readonly>
            </div>
            <div class="col-md-4 mb-3">
                <label for="firstName">First name</label>
                <input type="text" class="form-control" id="firstName" placeholder="First name" required>
            </div>
            <div class="col-md-4 mb-3">
                <label for="emailId">Email</label>
                <input type="text" class="form-control" id="emailId" placeholder="email" required>
            </div>
            <div class="col-md-4 mb-3">
                <label for="cardNo">cardNumber</label>
                <input type="text" class="form-control" id="cardNo" placeholder="cardNumber" required>
            </div>
            <div class="col-md-4 mb-3">
                <label for="price">price</label>
                <input type="number" class="form-control" id="price" value="${price}" placeholder="price" readonly>
            </div>
            <div class="col-md-4 mb-3">
                <label for="cvv">cvv</label>
                <input type="number" class="form-control" id="cvv" placeholder="cvv" required>
            </div>
        </div>
        <br>
        <div class="col-md-4 mb-3" style="margin-top: 20px">
            <button class="btn btn-primary" type="submit" id="order">confirm</button>
        </div>

    </form>


</div>

</body>

</html>