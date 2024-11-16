<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.DAO.*" %>
<%@ page import="org.model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Pending User Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td {
            color: #333;
        }

        button {
            width: 80px;
            height: 30px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        button.reject {
            background-color: #f44336;
        }

        button.reject:hover {
            background-color: #e41e1e;
        }

        .no-data {
            color: red;
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Pending User Details</h1>

        <%
            AdminDAO user = new AdminDAOImpl();
            List<BankUserDetails> bud = user.allPendingDetails();
            if (bud != null && !bud.isEmpty()) {
        %>
        <table>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Aadhar Number</th>
                <th>Address</th>
                <th>Amount</th>
                <th>Gender</th>
                <th>Pan Number</th>
                <th>Branch</th>
                <th>IFSC Code</th>
                <th>Status</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
            <% for (BankUserDetails b : bud) { %>
            <tr>
                <td><%= b.getId() %></td>
                <td><%= b.getName() %></td>
                <td><%= b.getEmail() %></td>
                <td><%= b.getMobile() %></td>
                <td><%= b.getAadhar() %></td>
                <td><%= b.getAddress() %></td>
                <td><%= b.getAmount() %></td>
                <td><%= b.getGender() %></td>
                <td><%= b.getPan() %></td>
                <td><%= b.getBranch() %></td>
                <td><%= b.getIfsc() %></td>
                <td><%= b.getStatus() %></td>
                <td>
                    <form action="approve" method="post">
                        <input type="hidden" name="idname" value="<%= b.getId() %>">
                        <button type="submit">Accept</button>
                    </form>
                </td>
                <td>
                    <form action="reject" method="post">
                        <input type="hidden" name="idname" value="<%= b.getId() %>">
                        <button type="submit" class="reject">Reject</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <div class="no-data">No Data Available</div>
        <% } %>
    </div>

</body>
</html>
