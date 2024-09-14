package org.com.DAO;

import org.com.DTO.getterRegisterDetails;

public interface addUserDAO {
	
	public int addNewUser(getterRegisterDetails grd);
	public boolean userAlreadyPresent(String phn_number);
	
}
