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

import org.DAO.USerDAOHelper;
import org.model.BankUserDetails;

@WebServlet("/registration")
public class UserRegistration extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String aadharnumber=request.getParameter("aadhar");
		String address=request.getParameter("add");
		String pannumber=request.getParameter("pan");
		String amount=request.getParameter("amount");
		String gender=request.getParameter("gender");
		//System.out.println(name);
		//System.out.println(email);
		BankUserDetails bud=new BankUserDetails();
		bud.setName(name);
		bud.setEmail(email);
		bud.setMobile(Long.parseLong(mobile));
		bud.setAadhar(Long.parseLong(aadharnumber));
		bud.setAddress(address);
		bud.setPan(pannumber);
		bud.setAmount(Double.parseDouble(amount));
		bud.setGender(gender);
		PrintWriter writer=response.getWriter();
		response.setContentType("text/html");
		
		int result=USerDAOHelper.getUserDAO().insertUserDetails(bud);
		if(result!=0) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("UserRegistration.jsp");
			dispatcher.include(request, response);
			writer.println("<center><h1>Registration Failed</h1></center>");
		}
	}
	


	
}
