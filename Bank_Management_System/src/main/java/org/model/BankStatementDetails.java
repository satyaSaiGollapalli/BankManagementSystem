package org.model;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankStatementDetails {

	private int id;
	private long accountnumber;
	private double transactionAmount;
	private double balanceAmount;
	private String status;
	private LocalDate dateOfTransaction;
	private LocalTime timeOfTransaction;
	
}
