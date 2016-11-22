package org.com.jdbcDAO;

import java.util.List;

import javax.sql.DataSource;

import org.com.DAO.SaveOrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
@Controller
public class orderSaveDAOImpl implements SaveOrderDAO{
	
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
	public boolean my_orderSave(String username , long order_ID, String name, int value, int itm_cost ){
		
		final String saveqry1 = "INSERT INTO my_order (user, order_ID, cloth_code,total_item_cost, item_count) VALUES (?,?,?,?,?)";
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(saveqry1,username, order_ID, name, itm_cost, value);
		
		
		return true;
	}
	public int calc_ItemCost(String Name, int itm_Number, long order_ID) {
		// TODO Auto-generated method stub
		
		final String saveqry = "SELECT item_cost FROM item_prices WHERE item_name = ?";
		//final String saveqry1 = "SELECT item_count FROM my_order WHERE cloth_code = ? AND order_id = ?";
		jdbcTemplate.setDataSource(dataSource);

		int item_cost = jdbcTemplate.queryForInt(saveqry,Name);
		

		//int item_count= jdbcTemplate.queryForInt(saveqry1,Name, order_ID);
		return item_cost*itm_Number;
		//return 0;
		
		
		
	}
	public void save_Date(String DATE, long order_ID) {
		// TODO Auto-generated method stub
		final String saveqry = "UPDATE my_order SET order_date = ? WHERE order_id = ?";
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(saveqry,DATE,order_ID );

		
	}
	public void save_Time(String TIME, long order_ID) {
		// TODO Auto-generated method stub
		final String saveqry = "UPDATE my_order SET order_time = ? WHERE order_id = ?";
		jdbcTemplate.setDataSource(dataSource);
		jdbcTemplate.update(saveqry,TIME,order_ID );

		
	}
	public void testCallFunction() {
		// TODO Auto-generated method stub
		final String qry = "SELECT cloth_code FROM my_order WHERE order_id = ?";
		jdbcTemplate.setDataSource(dataSource);
		
		
	long order_ID = 628080;                   
	List<String> string = jdbcTemplate.queryForList(qry, String.class, order_ID);
	
	if(string.size() >0){
		System.out.print("======================QUERY RECIEVED :) ======================================");
		
		for(int i =0; i < string.size() ; i++)
			System.out.println("== "+string.get(i)+" ==");
	}else{
		System.out.println("====================NO QUERY RECIEVED :( =================================");
	}
		
		
	}


}
