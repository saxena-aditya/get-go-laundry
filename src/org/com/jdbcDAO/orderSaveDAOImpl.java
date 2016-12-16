package org.com.jdbcDAO;


import javax.sql.DataSource;

import org.com.DAO.SaveOrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
@Controller
public class orderSaveDAOImpl implements SaveOrderDAO{
	
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
	
	@Override
	public int orderDataSave(String username, String date, String time, String odrString, long orderid, int cost) {
		
		final String saveqry = "INSERT INTO order_table (username, date_order, time_order,order_id, orderstring, order_cost) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(saveqry,username, date, time, orderid, odrString, cost);
		
		System.out.println("Odere ID in the oeorderDataSave = "+ orderid+" ===");
		
		
		return 0;
	}
	@Override
	public boolean my_orderSave(String username , String order_ID, String name, int value, int itm_cost ){
		
		final String saveqry1 = "INSERT INTO my_order (user, order_ID, cloth_code,total_item_cost, item_count) VALUES (?,?,?,?,?)";
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(saveqry1,username, order_ID, name, itm_cost, value);
		
		
		return true;
	}
	@Override
	public int calc_ItemCost(String Name, int itm_Number, String string) {
		// TODO Auto-generated method stub
		
		final String saveqry = "SELECT item_cost FROM item_prices WHERE item_name = ?";
		//final String saveqry1 = "SELECT item_count FROM my_order WHERE cloth_code = ? AND order_id = ?";
		jdbcTemplate.setDataSource(dataSource);

		int item_cost = jdbcTemplate.queryForInt(saveqry,Name);
		

		//int item_count= jdbcTemplate.queryForInt(saveqry1,Name, order_ID);
		return item_cost*itm_Number;
		//return 0;
		
		
		
	}
	
	public void save_Date(String DATE, String order_id) {
		// TODO Auto-generated method stub
		final String saveqry = "UPDATE my_order SET order_date = ? WHERE order_id = ?";
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(saveqry,DATE,order_id );

		
	}
	
	public void save_Time(String TIME, String order_ID) {
		// TODO Auto-generated method stub
		final String saveqry = "UPDATE my_order SET order_time = ? WHERE order_id = ?";
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(saveqry,TIME,order_ID );

		
	}
	public void testCallFunction() {
		// TODO Auto-generated method stub
		
	}
	public void deleteOrder(String username) {
		// TODO Auto-generated method stub
		
		String Str = "DELETE e FROM my_order e WHERE order_id IN (SELECT order_id FROM (SELECT order_id FROM my_order WHERE user = ? ORDER BY init DESC LIMIT 1) x)";
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(Str, username);
		
		
		
	}
	public boolean firstOrder(String username) {
		// TODO Auto-generated method stub
		String str = "SELECT COUNT(*) FROM exhausted_users WHERE user = ?";
		jdbcTemplate.setDataSource(getDataSource());
		count = jdbcTemplate.queryForInt(str, username);
		System.out.println("The count is = " +count);
		
		if(count == 0 )
			return true;
		
		return false;
	}
	public void exhaustUser(String username) {
		// TODO Auto-generated method stub
		String str = "INSERT INTO exhausted_users (user) VALUES (?)";
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(str, username);
		
	}
	
}
