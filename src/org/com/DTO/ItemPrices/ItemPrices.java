package org.com.DTO.ItemPrices;

public class ItemPrices {

  public String item_cost;
  public String item_name;
  public String hoodie;
  public String type;

  public String getItem_cost() {
    return item_cost;
  }

  public String getHoodie() {
    return hoodie;
  }

  public void setHoodie(String hoodie) {
    this.hoodie = hoodie;
  }

  public void setItem_cost(String item_cost) {
    this.item_cost = item_cost;
  }

  public String getItem_name() {
    return item_name;
  }

  public void setItem_name(String item_name) {
    this.item_name = item_name;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }
}
