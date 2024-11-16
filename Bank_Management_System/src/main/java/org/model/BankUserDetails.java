package org.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Data
//@Setter
//@Getter
@AllArgsConstructor
@NoArgsConstructor
//@ToString
public class BankUserDetails {

	private String name;
	private String email;
	private long mobile;
	private long aadhar;
	private String address;
	private String pan;
	private double amount;
	private String gender;
	private final String ifsc="BMS00091";
	private String status="Pending";
	private final String branch="JNTU";
	private int id;
	private int pin;
	private long accountnumber;
	
	
}
