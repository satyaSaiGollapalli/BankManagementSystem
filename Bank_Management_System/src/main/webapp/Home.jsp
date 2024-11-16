<%@page import="org.model.BankUserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Bank Dashboard</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	width: 100vw;
	height: 100vh;
	background-color: #f0f4f7;
	background-image: linear-gradient(to bottom right, #e0e7ff, #7fb1f7);
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Arial', sans-serif;
}

#container {
	width: 80vw;
	height: 80vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 2vw;
	position: relative;
	top:3vw;
}

.child {
	width: 30vw;
	height: 30vh;
	background-color: #fff;
	border: 2px solid #d1d5db;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.5vw;
	font-weight: bold;
	color: #007acc;
	text-transform: uppercase;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.child:hover {
	background-color: #007acc;
	color: #fff;
	cursor: pointer;
}

h1 {
	position: absolute;
	top: 1vw;
	left: 50%;
	transform: translateX(-50%);
	font-size: 2.5vw;
	text-transform: uppercase;
	color: #1e3a8a;
}

#profile {
	width: 18vw;
	height: 15vh;
	position: absolute;
	top: 2vw;
	right: 2vw;
	background-color: #fff;
	border: 2px solid #e5e7eb;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	display: flex;
	align-items: center;
	padding: 1vw;
}

.childs {
	width: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
}

i {
	font-size: 4vw;
	color: #007acc;
}

#details {
	display:flex;
	flex-direction:row;
	gap:1vw;
	font-size: 1.2vw;
	text-align: left;
	color: #374151;
	padding-left: 1vw;
}

h3 {
	font-size: 1vw;
	margin-bottom: 0.5vw;
}

a {
	text-decoration: none;
	color: inherit;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
<% BankUserDetails bankUserDetails = (BankUserDetails)session.getAttribute("userDetails");
   session.setAttribute("object", bankUserDetails);
%>
	<h1>Bank Dashboard</h1>
	<div id="profile">
		<div class="childs"><i class="fa-regular fa-user"></i></div>
		<div class="childs" id="details">
			<h3>Name: <%= bankUserDetails.getName() %></h3>
			<h3>Account No: <%= bankUserDetails.getAccountnumber() %></h3>
		</div>
	</div>

	<div id="container">
		<div class="child"><a href="Credit.jsp">CREDIT</a></div>
		<div class="child"><a href="CheckBalance.jsp">CHECK BALANCE</a></div>
		<div class="child"><a href="Debit.jsp">DEBIT</a></div>
		<div class="child"><a href="BankStatement.jsp">STATEMENT</a></div>
	</div>
</body>
</html>
