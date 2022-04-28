<%@ page import="com.example.comp6000.Models.AccountModel" %>
<%@ page import="java.nio.file.attribute.UserPrincipalLookupService" %>
<%@ page import="com.example.comp6000.Service.MySQLdb" %>
<%@ page import="com.example.comp6000.Models.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="main.css" rel="stylesheet" type="text/css">
</head>
<body>
<link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
<%
	AccountModel account = null;
	if(session.getAttribute("account") == null) {
		response.sendRedirect("login.jsp");

	}
	else{
		account = (AccountModel)session.getAttribute("account");
		if (!account.is_manager()) {
			response.sendRedirect("login.jsp");
		}
	}
	MySQLdb	db = new MySQLdb();
	List<UserModel> userList = db.fetchUserList();
	int totalUser = userList.size();
	float totalMoney = 0;
	for (UserModel user:userList){
		totalMoney += user.getBalance();
		}
%>
<div class="container">
<div class="row">
    <div class="col-12 col-lg-3">
		<div class="card">
			<div class="card-body">
				<div class="d-grid"> 
					<a href="manager.jsp" class="btn ">
					<img src="pics/ATM.png" alt="ATM" width="50" height="50"/>
				</a>

				</div>
				<h5 class="my-3">Actions</h5>
				<div class="fm-menu">
					<div class="list-group list-group-flush"> 
						<a href="manager.jsp" class="list-group-item py-1">
							<img src="pics/Manager.png" alt="Deposit" width="30" height="30" />
							</i><span style="margin-left: 10px; padding:2px"> Manager View</span></a>
						<a href="index.jsp" class="list-group-item py-1">
							<img src="pics/ATM.png" alt="Withdraw" width="30" height="30" />
							</i><span  style="margin-left: 10px; padding:2px"> Clerk View</span></a>
		
						<a href="Logout" class="list-group-item py-1">
							<img src="pics/logout.png" alt="Logout" width="30" height="30" />
							</i><span  style="margin-left: 10px; padding:2px"> Log out</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-12 col-lg-9">
		<div class="card">
			<div class="card-body">
				<div class="ms-auto"><h6>Hi Manager</h6>
				</div>


				<div class="row mt-3">
					<div class="col-12 col-lg-4">
						<div class="card shadow-none border radius-15">
							<div class="card-body">
							
								<h5 class="mt-3 mb-0">Total Balance<i class="bx ms-2"></i></h5>
								<p class="mb-1 mt-4"><span><%=totalMoney%></span>
								</p>
								<div class="progress" style="height: 7px;">
									<div class="progress-bar bg-primary" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-4">
						<div class="card shadow-none border radius-15">
							<div class="card-body">
								<h5 class="mt-3 mb-0">Total Users<i class="bx ms-2"></i></h5>
								<p class="mb-1 mt-4"><span>
								<%=totalUser%>
								</span>
								</p>
								<div class="progress" style="height: 7px;">
									<div class="progress-bar bg-danger" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-4">
						<div class="card shadow-none border radius-15">
							<div class="card-body">
								<h5 class="mt-3 mb-0">Today activities<i class="bx ms-2"></i></h5>
								<p class="mb-1 mt-4"><span><%=db.countToday()%></span>
								</p>
								<div class="progress" style="height: 7px;">
									<div class="progress-bar bg-warning" role="progressbar" style="width: 100%;" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!--end row-->
				<div class="d-flex align-items-center">
					<div>
						<h5 class="mb-0">Overview</h5>
					</div>

				</div>
				<div class="table-responsive mt-3">
					<table class="table table-striped table-hover table-sm mb-0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name <i class="bx ms-2"></i>
								</th>
								<th>Balances</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<%for (UserModel user:userList){%>
						<tr>
							<td><%=user.getUser_id()%></td>
							<td>
								<div class="d-flex align-items-center">
									<div class="font-weight-bold"><%=user.getName()%></div>
								</div>
							</td>
							<td>$<%=user.getBalance()%></td>
							<td><i class="fa fa-ellipsis-h font-24"></i>
							</td>
						</tr>
						<%}%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>