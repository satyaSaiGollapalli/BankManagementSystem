<%@page import="org.model.BankStatementDetails"%>
<%@page import="java.util.List"%>
<%@page import="org.DAO.BankStatementDAOImpl"%>
<%@page import="org.DAO.BankStatementDAO"%>
<%@page import="org.model.BankUserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Statement</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Basic Styling */
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            color: #374151;
        }

        /* Header */
        header {
            margin-bottom: 20px;
        }

        header a {
            font-size: 1.5rem;
            color: #1d4ed8;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        header a:hover {
            color: #2563eb;
        }

        /* Table Container */
        .table-container {
            width: 90%;
            max-width: 1000px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 16px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
        }

        th {
            background-color: #374151;
            color: #ffffff;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        tr:nth-child(even) {
            background-color: #f9fafb;
        }

        tr:hover {
            background-color: #f1f5f9;
        }

        /* No Data Row Styling */
        .no-data {
            text-align: center;
            padding: 20px;
            color: #9ca3af;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <% 
        BankUserDetails bankUserDetails = (BankUserDetails) session.getAttribute("userDetails"); 
        BankStatementDAO bankStatementDAO = new BankStatementDAOImpl();
        List<BankStatementDetails> statements = bankStatementDAO.getAllStatements(bankUserDetails.getAccountnumber());
    %>

    <header>
        <h1><a href="Home.jsp">Go Back To Dashboard</a></h1>
    </header>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Account Number</th>
                    <th>Transaction Amount</th>
                    <th>Balance Amount</th>
                    <th>Date of Transaction</th>
                    <th>Time of Transaction</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% if (statements != null && !statements.isEmpty()) {
                    for (BankStatementDetails bankStatementDetails : statements) { %>
                        <tr>
                            <td><%= bankStatementDetails.getId() %></td>
                            <td><%= bankStatementDetails.getAccountnumber() %></td>
                            <td><%= bankStatementDetails.getTransactionAmount() %></td>
                            <td><%= bankStatementDetails.getBalanceAmount() %></td>
                            <td><%= bankStatementDetails.getDateOfTransaction() %></td>
                            <td><%= bankStatementDetails.getTimeOfTransaction() %></td>
                            <td><%= bankStatementDetails.getStatus() %></td>
                        </tr>
                    <% }
                } else { %>
                    <tr>
                        <td colspan="7" class="no-data">No statements found for account number <%= bankUserDetails.getAccountnumber() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
