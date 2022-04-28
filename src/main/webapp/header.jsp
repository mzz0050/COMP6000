<%@ page import="com.sun.xml.internal.ws.api.server.WSEndpoint" %>
<%@ page import="com.example.comp6000.Models.AccountModel" %><%--
  Created by IntelliJ IDEA.
  User: Chan
  Date: 2022/4/27
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<link href="main.css" rel="stylesheet" type="text/css">
<%
        AccountModel account = null;
        if(session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");

        }
            else{
                account = (AccountModel)session.getAttribute("account");}
            %>
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-grid">
                            <a href="index.jsp" class="btn ">
                                <img src="pics/ATM.png" alt="ATM" width="50" height="50"/>
                            </a>

                        </div>
                        <h5 class="my-3">Actions</h5>
                        <div class="fm-menu">
                            <div class="list-group list-group-flush">
                                <%if (account.is_manager()){%>
                                <a href="manager.jsp" class="list-group-item py-1">
                                    <img src="pics/Manager.png" alt="Manager" width="30" height="30" />
                                    </i><span style="margin-left: 10px; padding:2px">Manager View</span></a>
                                <%}%>
                                <a href="deposit.jsp" class="list-group-item py-1">
                                    <img src="pics/deposit.png" alt="Deposit" width="30" height="30" />
                                    </i><span style="margin-left: 10px; padding:2px">Deposit</span></a>
                                <a href="withdraw.jsp" class="list-group-item py-1">
                                    <img src="pics/withdraw.png" alt="Withdraw" width="30" height="30" />
                                    </i><span  style="margin-left: 10px; padding:2px"> Withdraw</span></a>
                                <a href="transfer.jsp" class="list-group-item py-1">
                                    <img src="pics/transfer.png" alt="Transfer" width="30" height="30" />
                                    </i><span  style="margin-left: 10px; padding:2px"> Transfer</span></a>
                                <a href="history.jsp" class="list-group-item py-1">
                                    <img src="pics/history.png" alt="History" width="30" height="30" />
                                    </i><span  style="margin-left: 10px; padding:2px"> History</span></a>
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
                        <div class="ms-auto"><h6>Hi <%=account.is_manager()?"Manager":"Clerk"%>  <%=account.getEmail()%></h6>
                        </div>