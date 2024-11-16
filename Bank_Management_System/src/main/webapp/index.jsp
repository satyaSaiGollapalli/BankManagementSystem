<!DOCTYPE html>
<%@page import="org.model.BankUserDetails"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.DAO.USerDAOHelper"%>
<%@page import="org.apache.tomcat.util.log.UserDataHelper"%>
<%@page import="org.DAO.UserDAO"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        h2 {
            color: #333;
            font-size: 2.5em;
            margin-bottom: 30px;
            font-weight: bold;
        }
        #container {
            display: flex;
            justify-content: space-around;
            width: 90%;
            max-width: 900px;
        }
        .login {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 45%;
            position: relative;
        }
        h3 {
            font-size: 1.5em;
            color: #007BFF;
            margin-bottom: 20px;
            text-align: center;
        }
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            color: #007BFF;
            text-decoration: none;
            margin-top: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        #admin{
        left:10vw;
        }
        #user{
        left:-10vw;
        }
    </style>
</head>
<body>
    <h2>Bank Management System</h2>
    <div id="container">
        <div id="user" class="login">
            <form action="">
                <h3>User Login</h3>
                <input type="email" placeholder="Enter your email ID" required name="useremail">
                <input type="password" placeholder="Enter your password" required name="password">
                <a href="UserRegistration.jsp">New User</a>
                <a href="">Forgot password</a>
                <input type="submit" value="Login">
            </form>
        </div>
        <div id="admin" class="login">
            <form action="adminlogin" method="get">
                <h3>Admin Login</h3>
                <input type="email" placeholder="Enter your email ID" name="adminmail" required>
                <input type="password" placeholder="Enter your password" name="adminpassword" required>
                <input type="submit" value="Login">
            </form>
        </div>
    </div>
    <% String useremail=request.getParameter("useremail");
       String pin=request.getParameter("password");
       UserDAO dao=USerDAOHelper.getUserDAO();
       PrintWriter writer=response.getWriter();
       response.setContentType("text/html");
       if(useremail!=null && pin!=null){
    	   BankUserDetails bankUserDetails=dao.loginDetails(useremail, Integer.parseInt(pin));
       if(bankUserDetails!=null){
    	   session.setAttribute("userDetails", bankUserDetails);
    	   RequestDispatcher dispatcher=request.getRequestDispatcher("Home.jsp");
    	   dispatcher.forward(request, response);
       }else{
    	   
    	   writer.println("<center><h2 style='color:red;'>Login Failed</h2></center>");
    	   
       }
       }
    %>
   
</body>
</html>
