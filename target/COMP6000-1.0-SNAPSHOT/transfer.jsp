<%@ page import="com.example.comp6000.Models.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.comp6000.Service.MySQLdb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>Transfer</title>
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
				
					<form id="login-nav" method="post" action="Transfer" class="form" accept-charset="UTF-8">

						<div class="form-group">
							<label class="sr-only">From Username</label>
							<select class="form-control" name="from_username" id="from_username" >
								<option value="" disabled selected hidden>From Username</option>
								<%
									for (UserModel user : users) {
								%>
								<option value="<%=user.getUser_id()%>"><%=user.getName()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label class="sr-only">To Username</label>
							<select class="form-control" name="to_username" id="to_username" >
								<option value="" disabled selected hidden>To Username</option>
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
									   placeholder="Quantity of Money $100"  >
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

<style type="text/css">
body{
margin-top:20px;
background-color: #f7f7ff;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0px solid rgba(0, 0, 0, 0);
    border-radius: .25rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
}
.fm-file-box {
    font-size: 25px;
    background: #e9ecef;
    width: 44px;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: .25rem;
}
.ms-2 {
    margin-left: .5rem!important;
}

.fm-menu .list-group a {
    font-size: 16px;
    color: #5f5f5f;
    display: flex;
    align-items: center;
}
.list-group-flush>.list-group-item {
    border-width: 0 0 1px;
}
.list-group-item+.list-group-item {
    border-top-width: 0;
}
.py-1 {
    padding-top: .25rem!important;
    padding-bottom: .25rem!important;
}
.list-group-item {
    position: relative;
    display: block;
    padding: .5rem 1rem;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid rgba(0, 0, 0, .125);
}

.ms-auto {
    margin-left: auto!important;
}

.user-groups img {
    margin-left: -14px;
    border: 1px solid #e4e4e4;
    padding: 2px;
    cursor: pointer;
}

</style>

</body>
</html>