<%@page import="org.DAO.BankStatementDAOImpl"%>
<%@page import="org.DAO.BankStatementDAO"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.model.BankUserDetails"%>
<%@page import="org.DAO.USerDAOHelper"%>
<%@page import="org.DAO.UserDAO"%>
<%@page import="org.model.BankStatementDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }
    body {
        width: 100vw;
        height: 100vh;
        display: grid;
        place-items: center;
        background-color: #f2f2f2;
        font-family: Arial, sans-serif;
    }
    button[type="submit"] {
        width: 100px;
        height: 35px;
        margin-top: 20px;
        position: relative;
        left: 20px;
        background-color: #007acc;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .container {
        width: 60%;
        max-width: 400px;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #amountContainer, #accountContainer {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        display: none;
        background-color: #fff;
    }
    #amountContainer {
        display: flex;
    }
    input {
        width: 80%;
        max-width: 250px;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ddd;
    }
    #amountContainer:hover, #accountContainer:hover {
        background-color: #e6f3ff;
    }
</style>
</head>
<body>
<% BankUserDetails details =(BankUserDetails)session.getAttribute("userDetails");
	UserDAO dao=USerDAOHelper.getUserDAO();	
    double amount=dao.getAmount(details.getAccountnumber());
%>
<div id="amountContainer" class="container">
    <input placeholder="Enter Amount" id="usramount" type="number" required>
    <input type="hidden" value="<%=amount %>>" id="dbamount">
    <button onclick="validAmount()" type="submit">Credit</button>
</div>
<div id="accountContainer" class="container">
    <form method="get">
        <input placeholder="Enter AccountNumber" id="useraccount" required>
        <input id="dbaccount" readonly value="<%= details.getAccountnumber()%>">
        <input type="hidden" id="useramount" name="useramount">
        <button type="submit" onclick="validateAccount()">Submit</button>
    </form>
</div>
<script type="text/javascript">
    var usrvalue = 0;
    function validAmount(){
    	usrvalue = Number(document.getElementById("usramount").value);
        if(usrvalue < 0){
            alert("Invalid amount to credit");
        } else {
            document.getElementById("amountContainer").style.display = "none";
            document.getElementById("accountContainer").style.display = "flex";
        }
    }
    
    function validateAccount(){
    	var acc=Number(document.getElementById("useraccount").value);
    	var dbacc=Number(document.getElementById("dbaccount").value)
    	if(acc==dbacc){
    		document.getElementById("useramount").setAttribute("value",usrvalue);
    	}else{
    		document.getElementById("useramount").setAttribute("value",0);
    		alert("Enter valid accountNum")
    	}
    }
</script>
<% String uAmount=request.getParameter("useramount");
   double useramount=0;
if(uAmount!=null && !uAmount.equals("")){
	useramount=Double.parseDouble(uAmount);
	int res=dao.updateUserDetails(details.getAccountnumber(), useramount+amount);
	double balance=amount+useramount;
	if(res!=0){
		BankStatementDetails bankStatementDetails=new BankStatementDetails();
		bankStatementDetails.setAccountnumber(details.getAccountnumber());
		bankStatementDetails.setTransactionAmount(useramount);
		bankStatementDetails.setBalanceAmount(balance);
		bankStatementDetails.setStatus("CREDIT");
		bankStatementDetails.setDateOfTransaction(LocalDate.now());
		bankStatementDetails.setTimeOfTransaction(LocalTime.now());
		BankStatementDAO bankStatementDAO=new BankStatementDAOImpl();
		int result=bankStatementDAO.insertStetementDetails(bankStatementDetails);
		if(result!=0){
			RequestDispatcher dispatcher=request.getRequestDispatcher("Home.jsp");
			dispatcher.forward(request, response);
		}
	}
	
}
%>
</body>
</html>
