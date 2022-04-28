<%@ page import="com.example.comp6000.Service.MySQLdb" %>
<%@ page import="com.example.comp6000.Models.History" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
	<meta charset="utf-8">
	<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
	<!--  All snippets are MIT license http://bootdey.com/license -->
	<title>History</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="main.css">
</head>

<body>
	<link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
	<%@include file="header.jsp"%>

	<!--end row-->
	<%
	MySQLdb db = new MySQLdb();
	List<History> historyList = db.fetchHistory();
		%>


						<!--end row-->
						<div class="d-flex align-items-center">
							<div>
								<h5 class="mb-0">Recent</h5>
							</div>

						</div>
						<div class="table-responsive mt-3">
							<table class="table table-striped table-hover table-sm mb-0">
								<thead>
									<tr>
										<th>History ID
										</th>

										<th>Name
										</th>
										<th>Type
										<th>Actions</th>
										<th>Date</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<%
									for (History history:historyList){
										if(history.getType().equals("Withdraw")){
								%>
									<tr class="text-danger">
								<%
										}if(history.getType().equals("Deposit")){%>
								<tr class="text-success">
										<%}else if (history.getType().equals("Transfer")){%>
								<tr class="text-primary">
									<%
									}

									%>

									<td><%=history.getOperation_id()%></td>

									<td>
											<div class="d-flex align-items-center">
												<div><i class="bx me-2 font-24"></i>
												</div>
												<div class="font-weight-bold"><%=history.getUsername()%></div>
											</div>
										</td>
										<td><%=history.getType()%></td>
										<td><%=history.getIn_exp()%></td>
										<td><%=history.getOperation_date()%></td>
										</td>
									</tr>
								<%
									}

								%>


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