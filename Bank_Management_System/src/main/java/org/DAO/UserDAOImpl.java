package org.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.model.BankUserDetails;

public class UserDAOImpl implements UserDAO {
	String url="jdbc:mysql://localhost:3306/teca62_projects?user=root&password=root";
	Connection connection;
	@Override
	public int insertUserDetails(BankUserDetails bud) {
		String insert="insert into bank_user_details( Name, Email,  Mobile_Numer, Aadhar_Number, Address, Amount, Gender,  IFSC_CODE, Branch, PAN_Number, Status) values (?,?,?,?,?,?,?,?,?,?,?)";
		//BankUserDetails bud=new BankUserDetails();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement ps=connection.prepareStatement(insert);
			//System.out.println(bud.getName());
			ps.setString(1, bud.getName());
			ps.setString(2, bud.getEmail());
			ps.setLong(3, bud.getMobile());
			ps.setLong(4, bud.getAadhar());
			ps.setString(5, bud.getAddress());
			ps.setDouble(6, bud.getAmount());
			ps.setString(7, bud.getGender());
			ps.setString(8, bud.getIfsc());
			ps.setString(9, bud.getBranch());
			ps.setString(10, bud.getPan());
			ps.setString(11, bud.getStatus());
			return ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	
	}
	@Override
	public BankUserDetails loginDetails(String email, int pin) {
		String select="select * from bank_user_details where Email=? and Pin=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			preparedStatement.setString(1, email);
			preparedStatement.setInt(2, pin);
			ResultSet resultSet=preparedStatement.executeQuery();
			BankUserDetails bankUserDetails=new BankUserDetails();
			if(resultSet.next()) {
				bankUserDetails.setId(resultSet.getInt("Id"));
				bankUserDetails.setName(resultSet.getString("Name"));
				bankUserDetails.setEmail(resultSet.getString("Email"));
				bankUserDetails.setPin(resultSet.getInt("Pin"));
				bankUserDetails.setMobile(resultSet.getLong("Mobile_Numer"));
				bankUserDetails.setAadhar(resultSet.getLong("Aadhar_Number"));
				bankUserDetails.setAddress(resultSet.getString("Address"));
				bankUserDetails.setAmount(resultSet.getDouble("Amount"));
				bankUserDetails.setGender(resultSet.getString("gender"));
				bankUserDetails.setAccountnumber(resultSet.getLong("Account_Number"));
				bankUserDetails.setPan(resultSet.getString("PAN_Number"));
				bankUserDetails.setStatus(resultSet.getString("Status"));
				return bankUserDetails;
			}else {
				return null;
			}
					
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	@Override
	public int updateUserDetails(long accountnumber, double amount) {
		String update="update bank_user_details set Amount=? where Account_Number=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(update);
			preparedStatement.setDouble(1, amount);
			preparedStatement.setLong(2, accountnumber);
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public double getAmount(long accountnumber) {
		String getAmount="select Amount from bank_user_details where Account_Number=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(getAmount);
			preparedStatement.setDouble(1, accountnumber);
			ResultSet resultSet= preparedStatement.executeQuery();
			double amount=0;
			if(resultSet.next()) {
				amount=resultSet.getDouble("Amount");
				return amount;
			}else {
				return 0;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
				
	}
	

}
