<%--
  Created by IntelliJ IDEA.
  User: Chan
  Date: 2022/4/27
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>



<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      crossorigin="anonymous">

<div class="container">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-5">
            <div class="card cardbox">
                <div class="card-header">Register</div>
                <div class="card-body">

                    <div class="form-group">

                        <form id="login-nav" method="get" action="Register" class="form" accept-charset="UTF-8">

                            <!-- email group -->
                            <div class="form-group">
                                <label class="sr-only">E-mail Address</label>
                                <input type="email" id="email" name="email" class="form-control" value="" placeholder="xxx@xxx.com">
                            </div>

                            <!-- password group -->
                            <div class="form-group">

                                <!-- password label -->
                                <label class="sr-only">Password</label>
                                <!-- password input -->
                                <div class="input-group">
                                    <input type="password" id="password" onchange='check()' name="password" class="form-control"
                                           data-placement="bottom" data-toggle="popover" data-container="body" data-html="true" value=""
                                           placeholder="Password" required>

                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="button-append1"
                                                onclick="togglePassword()">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- password-confirm group -->
                            <div class="form-group">

                                <!-- password-confirm label -->
                                <label class="sr-only">Password Confirm</label>
                                <!-- password-confirm input -->
                                <div class="input-group">
                                    <input type="password" id="reg_userpasswordconfirm" onchange='check()' class="form-control" data-placement="bottom"
                                           data-toggle="popover" data-container="body" data-html="true" placeholder="Password Confirm"
                                           required>

                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="button-append2"
                                                onclick="toggleConPassword()">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </button>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label>Manager?</label>
                                    <input type="checkbox" id="type" name="type" value="1"/>
                                </div>

                                <!-- password-confirm error message -->
                                <div class="help-block text-right">
                                        <i id="message"></i>
                                </div>
                                <div class="help-block text-right">
                                    <i style="color:#9B1B30 ">${msg}</i>
                                </div>
                            </div>


                            <!-- Submit -->
                            <div class="form-group">
                                <button id="reg_submit" name="submit" value="1" class="btn btn-block btn-primary"
                                        disabled="false">Create user</button>
                            </div>

                        </form>
                    </div>

                    <div class="login-or">
                        <hr class="hr-or">
                    </div>
                    <!-- Links -->
                    <div class="bottom text-center">
                        Are you user? <a href="login.jsp"><b>Login</b></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function togglePassword() {

        var element = document.getElementById('password');
        element.type = (element.type == 'password' ? 'text' : 'password');

    };
    function toggleConPassword() {

        var element = document.getElementById('reg_userpasswordconfirm');
        element.type = (element.type == 'password' ? 'text' : 'password');

    };

    var check = function() {
        if (document.getElementById('password').value ==
            document.getElementById('reg_userpasswordconfirm').value) {
            document.getElementById('message').innerHTML = 'Confirm Password Matching';
            document.getElementById('message').style.color = '#88B04B';
            document.getElementById('reg_submit').disabled = false;
        } else {
            document.getElementById('message').innerHTML = 'Password Not Matching';
            document.getElementById('message').style.color = '#9B1B30';
            document.getElementById('reg_submit').disabled = true;
        }
    }
</script>
</body>

</html>