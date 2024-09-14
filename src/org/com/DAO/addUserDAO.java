package org.com.DAO;

import org.com.DTO.GetterRegisterDetails;

public interface AddUserDAO {
  public int addNewUser(GetterRegisterDetails grd);

  public boolean userAlreadyPresent(String phn_number);
}
