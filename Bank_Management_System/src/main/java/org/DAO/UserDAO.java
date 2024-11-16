package org.DAO;

import java.util.List;

import org.model.BankUserDetails;

public interface UserDAO {
	
	int insertUserDetails(BankUserDetails bud);
	BankUserDetails loginDetails(String email,int pin);
	int updateUserDetails(long accountnumber, double amount);
	double getAmount(long accountnumber);
	
	

}
