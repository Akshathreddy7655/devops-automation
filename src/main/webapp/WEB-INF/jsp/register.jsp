<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charSet=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
        .navbar-inverse .navbar-nav>li>a {
            color: #f8f8f8;
        }
        .navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
            color: #fff;
            background-color: #337ab7;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="color:white">Groceries Shopping</a>
        </div>

        <ul class="nav navbar-nav navbar-right">

            <li><a href="http://localhost:8080/user/login" style="color:white"><span class="glyphicon glyphicon-user"></span> Login</a></li>
        </ul>
    </div>
</nav>


<div class="container">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4" style="color:black;border:1px solid #337ab7;border-radius:10px;margin:10px">

            <h3 style="text-align:center">Customer Registration</h3>
            <h2>${errorMsg}</h2>
            <form:form method="post" action="addUser" modelAttribute="user" >
                <div class="form-group" style="text-align:left">
                    <label for="name" style="color:black">Name</label>
                    <form:input type="text"  class="form-control" path="name" required="true"/>

                </div>

                <div class="form-group" style="text-align:left">
                    <label for="name" style="color:black">Email</label>
                    <form:input type="text"  class="form-control" path="email" required="true"/>

                </div>

                <div class="form-group" style="text-align:left">
                    <label for="name" style="color:black">Phone Number</label>
                    <form:input type="number"  class="form-control" path="phoneNumber" required="true"/>

                </div>

                <div class="form-group" style="text-align:left">
                    <label for="name" style="color:black">Password</label>
                    <form:input type="password"  class="form-control" path="password" id='password' required="true"/>

                </div>

                <div class="form-group" style="text-align:left">
                    <label for="name" style="color:black">Confirm Password</label>
                    <input type="password"  class="form-control" id="cpassword" required="true"/>

                </div>

                <div class="form-group" style="text-align: center;">
                    <button class="btn btn-success"   value="submit" type="submit">Register</button>
                </div>


            </form:form>


        </div>
        <div class="col-md-4">

        </div>
    </div>
</div>




<%--x--%>
<%--<form:form method="post" action="addUser" modelAttribute="users" >--%>

<%--    <label>name</label>--%>
<%--    <form:input type="text" path="name"/>--%>
<%--    <br/>--%>
<%--    <br/>--%>
<%--    <label>email</label>--%>
<%--    <form:input type="text"  path="email"/>--%>
<%--    <br/>--%>
<%--    <br/>--%>
<%--    <label>password</label>--%>
<%--    <form:input type="password" path="password"/>--%>
<%--    <br/>--%>
<%--    <br/>--%>
<%--    <input type="submit" value="submit">--%>
<%--</form:form>--%>
<script>
    var password = document.getElementById("password")
        , confirm_password = document.getElementById("cpassword");

    function validatePassword(){
        if(password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>
</body>

</html>