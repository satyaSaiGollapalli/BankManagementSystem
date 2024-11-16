package org.DAO;

public class USerDAOHelper {
 public static UserDAO getUserDAO() {
	 return new UserDAOImpl();
 }
}
