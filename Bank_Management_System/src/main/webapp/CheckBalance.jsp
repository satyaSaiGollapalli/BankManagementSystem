<%@page import="org.DAO.USerDAOHelper"%>
<%@page import="org.DAO.UserDAO"%>
<%@page import="org.model.BankUserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 400px;
            text-align: center;
        }
        .container h2 {
            font-size: 1.2rem;
            color: #555;
        }
        .container h2 span {
            color: #000;
            font-weight: normal;
        }
    </style>
</head>
<body>
<%
    BankUserDetails bankUserDetails = (BankUserDetails) session.getAttribute("userDetails");
      UserDAO dao = USerDAOHelper.getUserDAO();
    double amount = dao.getAmount(bankUserDetails.getAccountnumber());
%>
    <div class="container">
        <h2>User Name: <span><%= bankUserDetails.getName() %></span></h2>
        <h2>Account Number: <span><%= bankUserDetails.getAccountnumber() %></span></h2>
        <h2>Current Balance: <span>&#8377;<%= amount %></span></h2>
        <h2><a href="Home.jsp">Go Back to DashBoard</a></h2>
    </div>
</body>
</html>
