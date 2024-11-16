package org.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.model.BankUserDetails;

import com.mysql.cj.jdbc.Driver;

public class AdminDAOImpl implements AdminDAO {
	String url="jdbc:mysql://localhost:3306/teca62_projects?user=root&password=root";
	Connection connection;
	@Override
	public List<BankUserDetails> allUserDetail() {
		String select="select * from bank_user_details ";
		List<BankUserDetails> bud=new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			ResultSet resultSet=preparedStatement.executeQuery();
			if(resultSet.isBeforeFirst()) {
				while(resultSet.next()) {
					BankUserDetails bankUserDetails=new BankUserDetails();
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
					bud.add(bankUserDetails);
				}
				return bud;
				
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
	public List<BankUserDetails> allPendingDetails() {
		String select="select * from bank_user_details where Status='Pending'";
		List<BankUserDetails> bud=new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			ResultSet resultSet=preparedStatement.executeQuery();
			if(resultSet.isBeforeFirst()) {
				while(resultSet.next()) {
					BankUserDetails bankUserDetails=new BankUserDetails();
					bankUserDetails.setId(resultSet.getInt("Id"));
					bankUserDetails.setName(resultSet.getString("Name"));
					bankUserDetails.setEmail(resultSet.getString("Email"));
					bankUserDetails.setMobile(resultSet.getLong("Mobile_Numer"));
					bankUserDetails.setAadhar(resultSet.getLong("Aadhar_Number"));
					bankUserDetails.setAddress(resultSet.getString("Address"));
					bankUserDetails.setAmount(resultSet.getDouble("Amount"));
					bankUserDetails.setGender(resultSet.getString("gender"));
					bankUserDetails.setPan(resultSet.getString("PAN_Number"));
					bankUserDetails.setStatus(resultSet.getString("Status"));
					bud.add(bankUserDetails);
				}
				return bud;
				
			}else {
				return null;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
		
	}
	@Override
	public int approveUserAccounr(BankUserDetails bankUserDetails) {
		String update="update bank_user_details set Status=?,Account_Number=?,Pin=? where Id=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(update);
			preparedStatement.setString(1, bankUserDetails.getStatus());
			preparedStatement.setLong(2, bankUserDetails.getAccountnumber());
			preparedStatement.setInt(3, bankUserDetails.getPin());
			preparedStatement.setInt(4, bankUserDetails.getId());
			 return preparedStatement.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
			return 0;
		}
		
	}
	@Override
	public int rejectUserAccount(BankUserDetails bankUserDetails) {
		String delete="delete from bank_user_details where Id=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(delete);
			preparedStatement.setInt(1, bankUserDetails.getId());
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	
	}
	@Override
	public BankUserDetails selectPerson(int id) {
		BankUserDetails bankUserDetails=new BankUserDetails();
		String select="select * from bank_user_details where Id=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection= DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			preparedStatement.setInt(1, id);
			ResultSet resultSet=preparedStatement.executeQuery();
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
	
}
