package org.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DAO.AdminDAOImpl;
import org.model.BankUserDetails;
@WebServlet("/approve")
public class ApproveUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Random random=new Random();
		int pin=random.nextInt(10000);
		if(pin<1000) {
			pin+=1000;
		}
		long accountnumber=(long)random.nextInt(1000000);
		if(accountnumber<100000) {
			accountnumber+=100000;
		}
		String status="Approved";
		String id=request.getParameter("idname");
		BankUserDetails bankUserDetails=new BankUserDetails();
		BankUserDetails bankUserDetails1=new AdminDAOImpl().selectPerson(Integer.parseInt(id));
		bankUserDetails.setPin(pin);
		bankUserDetails.setAccountnumber(accountnumber);
		bankUserDetails.setStatus(status);
		bankUserDetails.setId(Integer.parseInt(id));
		int res=new AdminDAOImpl().approveUserAccounr(bankUserDetails);
		PrintWriter writer=response.getWriter();
		response.setContentType("text/html");
		if(res!=0) {
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("PendingUserDetails.jsp");
			dispatcher.include(request, response);
			writer.println("<h2> UserName:"+bankUserDetails1.getName()+"</h2>"
					+      "<h2>Email :"+bankUserDetails1.getEmail()+"</h2"
					     + "<h2></h2>"
					     + "<h1 style='color:green;'>User Is Accepted</h1>");
		}else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("PendingUserDetails.jsp");
			dispatcher.include(request, response);
			writer.println("<center><h3>Failed to accept</h3></center>");
		}
	}
}
