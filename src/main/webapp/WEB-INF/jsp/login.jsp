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
            <a class="navbar-brand" href="#" style="color:white"> Groceries Shopping</a>
        </div>

        <ul class="nav navbar-nav navbar-right">

            <li><a href="http://localhost:8080/user/login" style="color:white"><span class="glyphicon glyphicon-user"></span> Login</a></li>
        </ul>
    </div>
</nav>






<div class="container">
    <div class="row" >
        <div class="col-lg-4 posts-list" ></div>
        <div class="col-lg-4 posts-list" style="color:black;border:1px solid #337ab7;border-radius:10px;margin:30px">


            <div class="comment-form">
                <h4>Customer Login </h4>
                <h2>${errorMsg}</h2>
                <form method="post">

                    <div class="form-group ">
                        <input type="text" name="email" class="form-control" id="email"
                               placeholder="Enter Email" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = 'Enter Email'" required>
                    </div>

                    <div class="form-group">
                        <input type="password" name="password" class="form-control" id="pass" placeholder="Password"
                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required>
                    </div>



                    <button class="primary-btn" type="submit">Login</button>
                </form>

                <br>

                <a href="http://localhost:8080/user/register">Register Here</a>

            </div>
        </div>


    </div>
</div>



<%--<form method="post">--%>
<%--    <label>Email</label>--%>
<%--    <input type="text" name="email" placeholder="Email">--%>
<%--    <br/>--%>
<%--    <br/>--%>
<%--    <label>Password</label>--%>
<%--    <input type="password" name="password" placeholder="Password">--%>
<%--    <br/>--%>
<%--    <br/>--%>
<%--    <button>Submit</button>--%>
<%--</form>--%>



</body>

</html>