package org.com.DTO;

public class GetterRegisterDetails {

  public String firstName;
  public String lastName;
  public String phone;
  public String address1;
  public String address2;
  public String pass;

  public String getAddress1() {
    return address1;
  }

  public void setAddress1(String address1) {
    this.address1 = address1;
  }

  public String getAddress2() {
    return address2;
  }

  public void setAddress2(String address2) {
    this.address2 = address2;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getPass() {
    return pass;
  }

  public void setPass(String pass) {
    this.pass = pass;
  }

  GetterRegisterDetails() {
    setFirstName(firstName);
    setLastName(lastName);
    setPass(pass);
    setAddress1(address1);
    setAddress1(address2);
    setPhone(phone);
  }
}
