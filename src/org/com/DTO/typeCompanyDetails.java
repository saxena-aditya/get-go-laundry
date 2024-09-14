package org.com.DTO;

public class TypeCompanyDetails {

  public String company_name;
  public String company_symbol;
  public int off_percentage;
  public String banner_text;
  public int init;
  public int minimum_order_cost;

  public int getMinimum_order_cost() {
    return minimum_order_cost;
  }

  public void setMinimum_order_cost(int minimum_order_cost) {
    this.minimum_order_cost = minimum_order_cost;
  }

  public int getInit() {
    return init;
  }

  public void setInit(int init) {
    this.init = init;
  }

  public String getCompany_name() {
    return company_name;
  }

  public void setCompany_name(String company_name) {
    this.company_name = company_name;
  }

  public String getCompany_symbol() {
    return company_symbol;
  }

  public void setCompany_symbol(String company_symbol) {
    this.company_symbol = company_symbol;
  }

  public int getOff_percentage() {
    return off_percentage;
  }

  public void setOff_percentage(int off_percentage) {
    this.off_percentage = off_percentage;
  }

  public String getBanner_text() {
    return banner_text;
  }

  public void setBanner_text(String banner_text) {
    this.banner_text = banner_text;
  }
}
