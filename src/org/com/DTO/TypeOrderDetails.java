package org.com.DTO;

public class TypeOrderDetails {

  private String order_id;
  private String cloth_code;
  private int item_count;
  private int total_item_cost;
  private String order_time;
  private String order_date;
  private String order_stage;
  private String user;

  /**
   * @return the user
   */
  public String getUser() {
    return user;
  }

  /**
   * @param user the user to set
   */
  public void setUser(String user) {
    this.user = user;
  }

  /**
   * @return the order_id
   */
  public String getOrder_id() {
    return order_id;
  }

  /**
   * @param order_id the order_id to set
   */
  public void setOrder_id(String order_id) {
    this.order_id = order_id;
  }

  /**
   * @return the cloth_code
   */
  public String getCloth_code() {
    return cloth_code;
  }

  /**
   * @param cloth_code the cloth_code to set
   */
  public void setCloth_code(String cloth_code) {
    this.cloth_code = cloth_code;
  }

  /**
   * @return the item_count
   */
  public int getItem_count() {
    return item_count;
  }

  /**
   * @param item_count the item_count to set
   */
  public void setItem_count(int item_count) {
    this.item_count = item_count;
  }

  /**
   * @return the total_item_cost
   */
  public int getTotal_item_cost() {
    return total_item_cost;
  }

  /**
   * @param total_item_cost the total_item_cost to set
   */
  public void setTotal_item_cost(int total_item_cost) {
    this.total_item_cost = total_item_cost;
  }

  /**
   * @return the order_time
   */
  public String getOrder_time() {
    return order_time;
  }

  /**
   * @param order_time the order_time to set
   */
  public void setOrder_time(String order_time) {
    this.order_time = order_time;
  }

  /**
   * @return the order_date
   */
  public String getOrder_date() {
    return order_date;
  }

  /**
   * @param order_date the order_date to set
   */
  public void setOrder_date(String order_date) {
    this.order_date = order_date;
  }

  /**
   * @return the order_stage
   */
  public String getOrder_stage() {
    return order_stage;
  }

  /**
   * @param order_stage the order_stage to set
   */
  public void setOrder_stage(String order_stage) {
    this.order_stage = order_stage;
  }
}
