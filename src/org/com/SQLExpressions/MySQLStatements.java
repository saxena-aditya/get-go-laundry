package org.com.SQLExpressions;

public class MySQLStatements {
	public final String SAVE_USER = "INSERT INTO reg_users(firstName, lastName, phone, pass, address1, address2)VALUES (?,?,?,?,?,?)";
	public final String COUNT_USER_REG = "SELECT COUNT(*) FROM reg_users where phone = ? AND pass = ?";
	public final String TOTAL_ORDERS = "SELECT DISTINCT order_id, order_date FROM my_order WHERE user = ?";
	public final String ORDER_COST = "SELECT SUM(total_item_cost) from my_order where order_id = ?";
	public final String LAST_ORDER = "SELECT order_id, order_date, order_stage FROM my_order WHERE user = ? ORDER BY init DESC LIMIT 1";
	public final String SAVE_ORDER = "INSERT INTO order_table (username, date_order, time_order,order_id, orderstring, order_cost) VALUES (?,?,?,?,?,?)";
	public final String SAVE_YOUR_ORDER = "INSERT INTO my_order (user, order_ID, cloth_code,total_item_cost, item_count) VALUES (?,?,?,?,?)";
	public final String SEE_COST = "SELECT item_cost FROM item_prices WHERE item_name = ?";
	public final String SAVE_ORDER_DATE = "UPDATE my_order SET order_date = ? WHERE order_id = ?";
	public final String SAVE_ORDER_TIME = "UPDATE my_order SET order_time = ? WHERE order_id = ?";
	public final String DELETE_ORDER = "DELETE e FROM my_order e WHERE order_id IN (SELECT order_id FROM (SELECT order_id FROM my_order WHERE user = ? ORDER BY init DESC LIMIT 1) x)";
	public final String COUNT_USER_ORDER = "SELECT COUNT(*) FROM exhausted_users WHERE user = ?";
	public final String EXHAUST_USER = "INSERT INTO exhausted_users (user) VALUES (?)";
	public final String SEE_ADD1 = "SELECT address1 FROM reg_users WHERE phone = ? ";
	public final String SEE_ADD2 = "SELECT address2 FROM reg_users WHERE phone = ? ";
	public final String COUNT_USER_VALIDATE = "SELECT COUNT(*) FROM reg_users WHERE phone = ?";
	public final String GET_PRICES = "SELECT * FROM item_prices";
	public final String GET_COMPANY_DETAILS = "SELECT * FROM company_details";
	public final String UPDATE_BANNER_TEXT = "UPDATE company_details SET banner_text = ? WHERE init=1";
	public final String UPDATE_COMPANY_DETAILS = "UPDATE company_details SET company_name=?, company_symbol=? WHERE init=1";
	public final String UPDATE_OFF_PERCENTAGE = "Update company_details SET off_percentage = ? where init=1";
	public final String UPDATE_MINIMUM_ORDER_COST =  "Update company_details SET minimum_order_cost =? WHERE init=1";
	public final String UPDATE_ITEM_PRICES = "UPDATE item_prices "+
			"SET item_cost = CASE item_name "+
            "WHEN 'shirt' THEN ? "+ 
            "WHEN 'tshirt' THEN ? "+
            "WHEN 'pant' THEN ? "+
            "WHEN 'jeans' THEN ? "+
            "WHEN 'ccoat' THEN ? "+
            "WHEN 'fcoat' THEN ? "+
            "WHEN 'jacket' THEN ? "+
            "WHEN 'sweater' THEN ? "+
            "WHEN 'blanketL' THEN ? "+
            "WHEN 'blanketH' THEN ? "+
            "WHEN 'blanketLU' THEN ? "+
            "WHEN 'other' THEN ? "+
            "ELSE item_cost "+
            "END "+
		"WHERE item_name IN('shirt', 'tshirt', 'pant', 'jeans', 'ccoat', 'fcoat', 'jacket', 'sweater', 'blanketL', 'blanketH', 'blanketLU', 'other')";

}
