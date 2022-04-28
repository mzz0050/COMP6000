<%--
  Created by IntelliJ IDEA.
  User: Chan
  Date: 2022/4/27
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          crossorigin="anonymous">
</head>

<body>


<div class="container">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-5">
            <div class="card cardbox">
                <div class="card-header">Login</div>
                <div class="card-body">


                    <div class="form-group">

                        <form id="login-nav" method="post" action="Login" class="form">

                            <div class="form-group">
                                <label class="sr-only">Email</label>
                                <input type="text" id="email" onchange='check()' name="email"
                                       class="form-control" value="" placeholder="Email" required>
                            </div>

                            <!-- password group -->
                            <div class="form-group">

                                <!-- password label -->
                                <label class="sr-only">Password</label>
                                <!-- password input -->
                                <div class="input-group">
                                    <input type="password" id="password" name="password"
                                           class="form-control" data-placement="bottom" data-toggle="popover"
                                           data-container="body" data-html="true" value="" placeholder="Password"
                                           onchange='check()' required>

                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="button-append1"
                                                onclick="togglePassword()">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </div>


                                <!-- password-confirm error message -->
                                <div class="help-block text-right">
                                    <i style="color:#9B1B30 ">${error}</i>
                                </div>

                            </div>

                            <div class="login-or">
                                <hr class="hr-or">
                            </div>
                            <!-- Submit -->
                            <div class="form-group">
                                <button id="log_submit" name="submit" value="1" class="btn btn-block btn-primary"
                                        disabled="true" >
                                    Login</button>
                            </div>




                            <div class="login-or">
                                <hr class="hr-or">
                                <span class="span-or">or</span>
                            </div>

                            <!-- Links -->
                            <div class="bottom text-center">
                                Don't have an account? <a href="register.jsp"><b>Sign up</b></a>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    // togglePassword
    function togglePassword() {

        var element = document.getElementById('password');
        element.type = (element.type == 'password' ? 'text' : 'password');

    }
    var check = function () {
        document.getElementById('log_submit').disabled = !(document.getElementById('email').value && document.getElementById('password'));
    }
</script>
</body>

</html>