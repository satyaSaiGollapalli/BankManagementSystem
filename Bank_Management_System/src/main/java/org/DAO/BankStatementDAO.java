package org.DAO;

import java.util.List;

import org.model.BankStatementDetails;

public interface BankStatementDAO {

	int insertStetementDetails(BankStatementDetails bankStatementDetails);
	List<BankStatementDetails> getAllStatements(long accountNumber);
}
