package org.com.DAO;


public interface SaveOrderDAO {
	
	public int orderDataSave(String username, String date, String timeSpan ,String odrString, long orderID, int cost);
	public int calc_ItemCost(String Name, int itm_Number, long order_ID) ;
	
	boolean my_orderSave(String username, long order_ID, String name, int value, int itm_cost);
	
	/*JDBC TEMPLATE queryForList(query, args1,arg2..) testing*/
	public void testCallFunction();
}
