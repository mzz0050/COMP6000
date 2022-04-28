<%@ page import="com.example.comp6000.Service.MySQLdb" %>
<%@ page import="com.example.comp6000.Models.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>Deposit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
<%@include file="header.jsp"%>

				<!--end row-->
<%
	MySQLdb db = new MySQLdb();
	List<UserModel> users = db.fetchUserList();
%>
				<div class="form-group" style="margin-top:20px;">
				
					<form id="login-nav" method="post" action="Deposit" role="form" class="form" accept-charset="UTF-8">
				
						<div class="form-group">
							<label class="sr-only">Username</label>
							<select class="form-control" name="username" id="username" >
								<option value="" disabled selected hidden>Choose a User</option>
									<%
        							for (UserModel user : users) {
        							%>
								<option value="<%=user.getUser_id()%>"><%=user.getName()%></option>
									<%
            					}
        						%>
							</select>
						</div>


						<!-- password group -->
						<div class="form-group">
				
							<!-- password label -->
							<label class="sr-only">Quantity of Money</label>
							<!-- password input -->
							<div class="input-group">
								<input type="number" id="amount" name="amount" class="form-control"
									data-placement="bottom" data-toggle="popover" data-container="body" data-html="true"
									placeholder="Quantity of Money $100"  required>
							</div>
				
				
							<!-- password-confirm error message -->
							<div class="help-block text-right">
								<i>${msg}</i>
							</div>
				
						</div>
				
						<!-- Submit -->
						<div class="form-group">
							<button id="log_submit" name="submit" value="1" class="btn btn-block btn-primary" >
								Submit</button>
						</div>
				
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>