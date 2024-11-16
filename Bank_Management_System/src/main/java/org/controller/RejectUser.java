package org.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DAO.AdminDAOImpl;
import org.model.BankUserDetails;
@WebServlet("/reject")
public class RejectUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("idname"));
		BankUserDetails bankUserDetails=new BankUserDetails();
		BankUserDetails	bankUserDetails1=new AdminDAOImpl().selectPerson(id);
		bankUserDetails.setId(id);
		int res=new AdminDAOImpl().rejectUserAccount(bankUserDetails);
		PrintWriter writer=response.getWriter();
		response.setContentType("text/html");
		if(res!=0) {
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("PendingUserDetails.jsp");
			dispatcher.include(request, response);
			writer.println("<h2> UserName:"+bankUserDetails1.getName()+"</h2>"
					+      "<h2>Email :"+bankUserDetails1.getEmail()+"</h2"
					     + "<h2></h2>"
					     + "<h1 style='color:red;'>User Is Rejected</h1>");
		}else {
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("PendingUserDetails.jsp");
			dispatcher.include(request, response);
			writer.println("<h2 style='color:red';>Failed reject User</h2>");
			
		}
		
	}
}
