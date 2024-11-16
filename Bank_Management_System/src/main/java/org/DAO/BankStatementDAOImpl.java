package org.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.model.BankStatementDetails;

public class BankStatementDAOImpl  implements BankStatementDAO{
	private static final String url="jdbc:mysql://localhost:3306/techa62?user=root&password=root";
	private static final String insert="insert into bank_statement_details( Account_Number, Ttranscation_Amount, Balance_Amount, status, DOT, TOD) "
			+ "values (?,?,?,?,?,?)";
	Connection connection;
	@Override
	public int insertStetementDetails(BankStatementDetails bankStatementDetails) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(insert);
			preparedStatement.setLong(1, bankStatementDetails.getAccountnumber());
			preparedStatement.setDouble(2, bankStatementDetails.getTransactionAmount());
			preparedStatement.setDouble(3, bankStatementDetails.getBalanceAmount());
			preparedStatement.setString(4, bankStatementDetails.getStatus());
			preparedStatement.setDate(5, java.sql.Date.valueOf(bankStatementDetails.getDateOfTransaction()));
			preparedStatement.setTime(6, Time.valueOf(bankStatementDetails.getTimeOfTransaction()));
			
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	
	}
	@Override
	public List<BankStatementDetails> getAllStatements(long accountNumber) {
		String select="select * from bank_statement_details where Account_Number=? order by id DESC";
		List<BankStatementDetails> statements=new ArrayList<BankStatementDetails>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			preparedStatement.setLong(1, accountNumber);
			ResultSet resultSet=preparedStatement.executeQuery();
			if(resultSet.isBeforeFirst()) {
				while(resultSet.next()) {
					BankStatementDetails bankStatementDetails=new  BankStatementDetails();
					bankStatementDetails.setAccountnumber(accountNumber);
					bankStatementDetails.setId(resultSet.getInt("id"));
					bankStatementDetails.setTransactionAmount(resultSet.getDouble("Ttranscation_Amount"));
					bankStatementDetails.setBalanceAmount(resultSet.getDouble("Balance_Amount"));
					String date=resultSet.getDate("DOT")+"";
					bankStatementDetails.setDateOfTransaction(LocalDate.parse(date));
					String time=resultSet.getTime("TOD")+"";
					bankStatementDetails.setTimeOfTransaction(LocalTime.parse(time));
					bankStatementDetails.setStatus(resultSet.getString("status"));
					statements.add(bankStatementDetails);
				}
				return statements;
				
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
