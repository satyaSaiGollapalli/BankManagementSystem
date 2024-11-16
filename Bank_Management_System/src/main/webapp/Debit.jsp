<%@page import="org.DAO.BankStatementDAO"%>
<%@page import="org.DAO.BankStatementDAOImpl"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.model.BankStatementDetails"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.DAO.USerDAOHelper"%>
<%@page import="org.DAO.UserDAO"%>
<%@page import="org.model.BankUserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amount Debit</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f3f4f6;
            font-family: Arial, sans-serif;
            color: #333;
        }

        /* Container Styling */
        .container {
            width: 90%;
            max-width: 500px;
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Form Styling */
        h1 {
            font-size: 1.5rem;
            color: #1d4ed8;
            margin-bottom: 1rem;
        }

        input[type="number"] {
            width: 100%;
            padding: 0.75rem;
            margin-top: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 1rem;
            color: #374151;
        }

        button {
            width: 100%;
            padding: 0.75rem;
            font-size: 1rem;
            color: #ffffff;
            background-color: #1d4ed8;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #2563eb;
        }

        /* Hidden Container */
        #accountContainer {
            display: none;
        }

        /* Placeholder Styling */
        input::placeholder {
            color: #6b7280;
        }
    </style>
</head>
<body>
    <% 
        BankUserDetails bankUserDetails = (BankUserDetails) session.getAttribute("object");
        UserDAO dao1 = USerDAOHelper.getUserDAO();
        double amount = dao1.getAmount(bankUserDetails.getAccountnumber());
    %>

    <div class="container" id="amountContainer">
        <h1>Amount Debit</h1>
        <input id="amount" type="number" placeholder="Enter amount" required>
        <input id="dbAmount" type="hidden" value="<%= amount %>">
        <button onclick="validateAmount()">Debit</button>
    </div>

    <div class="container" id="accountContainer">
        <form method="get">
            <h1>Account Verification</h1>
            <input id="accountNumber" type="number" placeholder="Enter Account Number" required>
            <input id="dbAccountNumber" type="hidden" name="acnum" value="<%= bankUserDetails.getAccountnumber() %>">
            <input id="userAmount" type="hidden" name="useramount">
            <button type="submit" onclick="validateAccountNumber()">Submit</button>
        </form>
    </div>

    <%
        String acc = request.getParameter("acnum");
        String amo = request.getParameter("useramount");
        long accountNumber = 0;
        double userAmount = 0.0;
        double balanceAmount = 0.0;
        response.setContentType("text/html");

        if (acc != null && amo != null) {
            accountNumber = Long.parseLong(acc);
            userAmount = Double.parseDouble(amo);
            balanceAmount = amount - userAmount;
            UserDAO dao = USerDAOHelper.getUserDAO();
            int res = dao.updateUserDetails(accountNumber, balanceAmount);
            if (res != 0) {
                BankStatementDetails bankStatementDetails = new BankStatementDetails();
                bankStatementDetails.setAccountnumber(bankUserDetails.getAccountnumber());
                bankStatementDetails.setTransactionAmount(userAmount);
                bankStatementDetails.setBalanceAmount(balanceAmount);
                bankStatementDetails.setStatus("DEBIT");
                bankStatementDetails.setDateOfTransaction(LocalDate.now());
                bankStatementDetails.setTimeOfTransaction(LocalTime.now());
                BankStatementDAO bso = new BankStatementDAOImpl();
                int result = bso.insertStetementDetails(bankStatementDetails);
                if (result != 0) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Home.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
        }
    %>

    <script>
        function validateAmount() {
            const amountInput = document.getElementById("amount").value;
            const availableAmount = document.getElementById("dbAmount").value;

            if (amountInput) {
                if (Number(amountInput) <= 0) {
                    alert("Invalid Amount");
                } else if (Number(amountInput) > Number(availableAmount)) {
                    alert("Insufficient funds");
                } else {
                    document.getElementById("amountContainer").style.display = "none";
                    document.getElementById("accountContainer").style.display = "block";
                    document.getElementById("userAmount").value = amountInput;
                }
            }
        }

        function validateAccountNumber(event) {
            const inputAccount = document.getElementById("accountNumber").value;
            const actualAccount = document.getElementById("dbAccountNumber").value;

            if (inputAccount !== actualAccount) {
                event.preventDefault();
                alert("Invalid Account Number");
            }
        }
    </script>
</body>
</html>
