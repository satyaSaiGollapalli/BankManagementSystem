package org.DAO;

import java.util.List;

import org.model.BankUserDetails;

public interface AdminDAO {
	List<BankUserDetails> allUserDetail();
	List<BankUserDetails> allPendingDetails();
	int approveUserAccounr(BankUserDetails bankUserDetails);
	int rejectUserAccount(BankUserDetails bankUserDetails);
	public BankUserDetails selectPerson(int id);
	
}
