<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Management Options</title>
<style>
    body {
        margin: 0;
        padding: 0;
        width: 100vw;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f4f4f4;
        font-family: Arial, sans-serif;
    }
    .container {
        display: flex;
        justify-content: space-between;
        width: 60vw;
    }
    .box {
        width: 40%;
        height: 200px;
        background-color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }
    .box:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    }
    h1 {
        font-size: 1.5rem;
        color: #007BFF;
    }
    a {
        text-decoration: none;
        color: #007BFF;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="box">
            <h1><a href="AllUSerDetails.jsp">All Bank User Details</a></h1>
        </div>
        <div class="box">
            <h1><a href="PendingUserDetails.jsp">Waiting for Approval</a></h1>
        </div>
    </div>
</body>
</html>
