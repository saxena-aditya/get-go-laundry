package org.com.jdbcDAO;

import java.util.List;

import javax.sql.DataSource;

import org.com.DAO.orderDetailsDAO;
import org.com.ItemPrices.ItemPrices;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class orderDetailsDAOImpl {
	MySQLStatements sql = new MySQLStatements();
	
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

		
		jdbcTemplate.setDataSource(getDataSource());
		List<orderDetailsDAO> Olist  = getJdbcTemplate().query(sql.TOTAL_ORDERS,
				new BeanPropertyRowMapper<orderDetailsDAO>(orderDetailsDAO.class), Username);
		

		return Olist;
	}
	
	public int orderCost(String orderID){
		
		jdbcTemplate.setDataSource(getDataSource());
		int cost = getJdbcTemplate().queryForInt(sql.ORDER_COST, orderID);
		return cost;
	}
	
	public List<orderDetailsDAO> latestOrder(String Username) {
		// TODO Auto-generated method stub
		
		jdbcTemplate.setDataSource(getDataSource());
		List<orderDetailsDAO> latestoList  = getJdbcTemplate().query(sql.LAST_ORDER,
				new BeanPropertyRowMapper<orderDetailsDAO>(orderDetailsDAO.class), Username);
		
			return latestoList;
	}
	
	public List<ItemPrices> getItemPrices(){
		
		jdbcTemplate.setDataSource(getDataSource());
		List<ItemPrices> item_prices = getJdbcTemplate().query(sql.GET_PRICES,
				new BeanPropertyRowMapper<ItemPrices>(ItemPrices.class));
		
		return item_prices;
		}
	
}
