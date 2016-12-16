package org.com.jdbcDAO;

import java.util.List;

import javax.sql.DataSource;

import org.com.DAO.orderDetailsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class orderDetailsDAOImpl {

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
	
	
	public List<orderDetailsDAO> findOrder(String Username){

		String sql = "SELECT DISTINCT order_id, order_date FROM my_order WHERE user = ?";
		jdbcTemplate.setDataSource(getDataSource());
		List<orderDetailsDAO> Olist  = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper<orderDetailsDAO>(orderDetailsDAO.class), Username);
		

		return Olist;
	}
	
	public int orderCost(String Username){
		String str = "SELECT SUM(total_item_cost) from my_order where order_id = ?";
		jdbcTemplate.setDataSource(getDataSource());
		int cost = getJdbcTemplate().queryForInt(str, Username);
		return cost;
	}
	
	public List<orderDetailsDAO> latestesOrder(String Username) {
		// TODO Auto-generated method stub
		
		String str = "SELECT order_id, order_date FROM my_order WHERE user = ? ORDER BY init DESC LIMIT 1";
		jdbcTemplate.setDataSource(getDataSource());
		List<orderDetailsDAO> latestoList  = getJdbcTemplate().query(str,
				new BeanPropertyRowMapper<orderDetailsDAO>(orderDetailsDAO.class), Username);
		
			return latestoList;
	}
	
}
