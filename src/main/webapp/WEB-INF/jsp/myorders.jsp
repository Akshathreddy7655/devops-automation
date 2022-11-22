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
            $(".changeStatus").click(function () {
           //     alert("sadan");

                var tr = $(this).closest('tr');


              //  alert(tr.attr('id'));
                // var country = $('#country').val();
                $.get("/products/addreturn/" + tr.attr('id'), function (data, status) {
                    alert("returned");
                    location.href="/products/home/${email}"


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
            <li><a style="color:white"><span class="glyphicon glyphicon-user"></span> ${email}</a></li>
            <li><a href="http://localhost:8080/products/userCart/${email}" style="color:white"><span
                    class="glyphicon glyphicon-user"></span> Cart</a></li>
            <li><a href="http://localhost:8080/products/myorders/${email}" style="color:white"><span
                    class="glyphicon glyphicon-user"></span> Orders</a></li>

            <li><a href="http://localhost:8080/user/login" style="color:white"><span
                    class="glyphicon glyphicon-user"></span> Logout</a></li>
        </ul>
    </div>
</nav>


<div class="container">
    <div class="row">


        <table class="table">
            <thead>
            <tr>
                <th scope="col">#Order Id</th>
                <th scope="col">Cart Items</th>
                <th scope="col">Total</th>
                <th scope="col">Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="value">
                <tr id="${value.orderId}">


                    <th scope="row">${value.orderId}</th>
                    <td>
                        <c:forEach items="${value.cartList}" var="ivalue">
                            <span style="margin-right: 30px"> Product Name : ${ivalue.productname}</span>
                            <span> Quantity : ${ivalue.quantity}</span>
                            <br>
                        </c:forEach>
                    </td>
                    <td>$ ${value.sum}</td>
                    <th scope="col">${value.status}</th>

                    <th scope="col">
                        <c:if test="${value.status == ' Order Delivered'}">
                            <button class="primary-btn changeStatus" type="submit" >
                                    ${value.returnStatus}
                            </button>
                        </c:if>
                    </th>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>


</div>
</div>

</body>

</html>