package org.com.jdbcDAO;


import javax.sql.DataSource;

import org.com.DAO.SaveOrderDAO;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
@Controller
public class orderSaveDAOImpl implements SaveOrderDAO{
	MySQLStatements sql =  new MySQLStatements();
	private int count = 1;
	
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	// IGNORE!!
	@Override
	public int orderDataSave(String username, String date, String time, String odrString, long orderid, int cost) {
		
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(sql.SAVE_ORDER,username, date, time, orderid, odrString, cost);
		

		
		return 0;
	}
	@Override
	public boolean my_orderSave(String username , String order_ID, String name, int value, int itm_cost ){
		
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(sql.SAVE_YOUR_ORDER,username, order_ID, name, itm_cost, value);
		
		
		return true;
	}
	@Override
	public int calc_ItemCost(String Name, int itm_Number, String string) {
		// TODO Auto-generated method stub
		
		//final String saveqry1 = "SELECT item_count FROM my_order WHERE cloth_code = ? AND order_id = ?";
		jdbcTemplate.setDataSource(dataSource);

		int item_cost = jdbcTemplate.queryForInt(sql.SEE_COST,Name);
		

		//int item_count= jdbcTemplate.queryForInt(saveqry1,Name, order_ID);
		return item_cost*itm_Number;
		//return 0;
		
		
		
	}
	
	public void save_Date(String DATE, String order_id) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(sql.SAVE_ORDER_DATE,DATE,order_id );

		
	}
	
	public void save_Time(String TIME, String order_ID) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(sql.SAVE_ORDER_TIME,TIME,order_ID );

		
	}
	public void testCallFunction() {
		// TODO Auto-generated method stub
		
	}
	public void deleteOrder(String username) {
		// TODO Auto-generated method stub
		
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.DELETE_ORDER, username);
		
		
		
	}
	public boolean firstOrder(String username) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		count = jdbcTemplate.queryForInt(sql.COUNT_USER_ORDER, username);
		
		if(count == 0 )
			return true;
		
		return false;
	}
	// the query exerts some extra pressure on the database. It extends for multiple yet same users! 
	// can be optimised by some unique MySQL query or using a if else before exhausting the user.
	public void exhaustUser(String username) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.EXHAUST_USER, username);
		
	}
	
	public void saveOrderAddress(String add1, String add2, String orderID){
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.SAVE_ADDRESS, add1, add2, orderID);
		
		
	}
	
}
