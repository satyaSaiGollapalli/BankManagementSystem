package org.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("adminmail");
		String password=request.getParameter("adminpassword");
		//System.out.println(email);
		String select="select * from admin where Admin_emailID=? and Admin_Password=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/teca62_projects?user=root&password=root");
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			ResultSet resultSet=preparedStatement.executeQuery();
			PrintWriter writer=response.getWriter();
			response.setContentType("text/html");
			if(resultSet.isBeforeFirst()) {
				RequestDispatcher dispatcher=request.getRequestDispatcher("AdminResponse.jsp");
				dispatcher.forward(request, response);
			}else
			{
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.include(request, response);
				writer.println("<center><h3 style='color:red;'>Invalid Admin Details</h3></center>");
			//	System.out.println("failed");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
