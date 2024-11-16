<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.DAO.*" %>
<%@ page import="org.model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All User Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        td {
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <center>
        <h1>All User Details</h1>
        <form action="" method="get">
            <input type="text" name="data" placeholder="Search by Name, Email, etc." required>
            <input type="submit" value="Search">
        </form>
        <br><br>
    </center>

    <table>
        <tr>
            <th>UserID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Pin</th>
            <th>Mobile Number</th>
            <th>Aadhar Number</th>
            <th>Address</th>
            <th>Amount</th>
            <th>Gender</th>
            <th>Account Number</th>
            <th>Pan Number</th>
            <th>Branch</th>
            <th>IFSC Code</th>
            <th>Status</th>
        </tr>

        <%
            AdminDAO user = new AdminDAOImpl();
            List<BankUserDetails> bud = user.allUserDetail(); 
            String value = request.getParameter("data");

            boolean isNumeric = value != null && value.matches("-?\\d+(\\.\\d+)?");

            if (value != null) {
                for (BankUserDetails b : bud) {
                    if (b.getName().equals(value) || 
                        b.getEmail().equals(value) || 
                        b.getStatus().equals(value) || 
                        b.getAddress().equals(value) || 
                        b.getGender().equalsIgnoreCase(value) || 
                       (isNumeric && (b.getAccountnumber() == Long.parseLong(value) || 
                        b.getAadhar() == Long.parseLong(value) || 
                        b.getMobile() == Long.parseLong(value)))) { %>

                        <tr>
                            <td><%=b.getId() %></td>
                            <td><%=b.getName() %></td>
                            <td><%=b.getEmail() %></td>
                            <td><%=b.getPin() %></td>
                            <td><%=b.getMobile() %></td>
                            <td><%=b.getAadhar() %></td>
                            <td><%=b.getAddress() %></td>
                            <td><%=b.getAmount() %></td>
                            <td><%=b.getGender() %></td>
                            <td><%=b.getAccountnumber() %></td>
                            <td><%=b.getPan() %></td>
                            <td><%=b.getBranch() %></td>
                            <td><%=b.getIfsc() %></td>
                            <td><%=b.getStatus() %></td>
                        </tr>

                    <% }
                }
            } else {
                if (bud != null) {
                    for (BankUserDetails b : bud) {
                        if (b.getStatus().equals("Approved")) { %>

                        <tr>
                            <td><%=b.getId() %></td>
                            <td><%=b.getName() %></td>
                            <td><%=b.getEmail() %></td>
                            <td><%=b.getPin() %></td>
                            <td><%=b.getMobile() %></td>
                            <td><%=b.getAadhar() %></td>
                            <td><%=b.getAddress() %></td>
                            <td><%=b.getAmount() %></td>
                            <td><%=b.getGender() %></td>
                            <td><%=b.getAccountnumber() %></td>
                            <td><%=b.getPan() %></td>
                            <td><%=b.getBranch() %></td>
                            <td><%=b.getIfsc() %></td>
                            <td><%=b.getStatus() %></td>
                        </tr>

                    <% }
                    }
                } else { %>

                <tr>
                    <td colspan="14" style="color: red; text-align: center;">No Data Available</td>
                </tr>

        <% } } %>

    </table>

</body>
</html>
