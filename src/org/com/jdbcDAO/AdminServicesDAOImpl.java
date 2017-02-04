package org.com.jdbcDAO;

import java.util.List;

import javax.sql.DataSource;

import org.com.DAO.AdminServicesDAO;
import org.com.ItemPrices.ItemPrices;
import org.com.SQLExpressions.MySQLStatements;
import org.com.getterSetterObjs.AdminServicesGetCompanyDetails;
import org.com.getterSetterObjs.AdminServicesGetNewBannerText;
import org.com.getterSetterObjs.AdminServicesGetNewPerItemCosts;
import org.com.getterSetterObjs.AdminServicesMinimumOrderCost;
import org.com.getterSetterObjs.AdminServicesOffOffer;
import org.com.getterSetterObjs.TypeOrderDetails;
import org.com.getterSetterObjs.TypeUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class AdminServicesDAOImpl implements AdminServicesDAO{

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
	
	@Override
	public void updateBannerText(AdminServicesGetNewBannerText bannerText) {
		
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.UPDATE_BANNER_TEXT, bannerText.getBanner_text());
		
	}

	@Override
	public void updateCompanyDetails(AdminServicesGetCompanyDetails companyDetails) {
		
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.UPDATE_COMPANY_DETAILS, companyDetails.getCompany_name(), companyDetails.getCompany_symbol());
		
	}

	@Override
	public void updatePerItemCost(AdminServicesGetNewPerItemCosts perItemCosts) {
		
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.UPDATE_ITEM_PRICES, perItemCosts.getShirt(), perItemCosts.getTshirt(), perItemCosts.getPant(),
								 perItemCosts.getJeans(), perItemCosts.getCcoat(), perItemCosts.getFcoat(),
								 perItemCosts.getJacket(), perItemCosts.getSweater(), perItemCosts.getBlanketL(),
								 perItemCosts.getBlanketH(), perItemCosts.getBlanketLU(), perItemCosts.getOther());
	}

	@Override
	public void updateOffPercentage(AdminServicesOffOffer offPercentage) {
		
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.UPDATE_OFF_PERCENTAGE, offPercentage.getOff_percentage());
		
	
	}
	@Override
	public void updateMinimumOrderCost(AdminServicesMinimumOrderCost minimumOrderCost) {
		
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.UPDATE_MINIMUM_ORDER_COST, minimumOrderCost.getMinimum_order_cost());
		
	}
	@Override
	public int getTotalNumberOfOrders() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		
		return jdbcTemplate.queryForInt(sql.TOTAL_ORDERS_MADE);
	}
	@Override
	public int getTotalProcessingOrders() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return jdbcTemplate.queryForInt(sql.TOTAL_PROCESSING_ORDERS);
	}
	@Override
	public int getTotalUsers() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return jdbcTemplate.queryForInt(sql.ALL_USERS);
	}
	@Override
	public int getTotalOrderCost() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return jdbcTemplate.queryForInt(sql.TOTAL_COST_UPTILL_NOW);
	}
	@Override
	public int getTotalProcessingOrderCost() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return jdbcTemplate.queryForInt(sql.TOTAL_PROCESSING_ORDER_COST);
	}
	@Override
	public int getTotalServedOrders() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return jdbcTemplate.queryForInt(sql.ORDER_SERVED);
	}
	@Override
	public TypeUserDetails getUserDetails(String phone) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return  getJdbcTemplate().queryForObject(sql.USER_DETAILS,
				new BeanPropertyRowMapper<TypeUserDetails>(TypeUserDetails.class), phone); 
		
	}
	@Override
	public List<TypeUserDetails> getUserDetailsList(String phone) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return  getJdbcTemplate().query(sql.USER_DETAILS,
				new BeanPropertyRowMapper<TypeUserDetails>(TypeUserDetails.class), phone); 
		
	}
	@Override
	public List<TypeOrderDetails> getOrderDetails(String order_id) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return getJdbcTemplate().query(sql.ORDER_DETAILS,
				new BeanPropertyRowMapper<TypeOrderDetails>(TypeOrderDetails.class), order_id);
	}
	@Override
	public List<TypeOrderDetails> getOdersByStage(String stage) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return getJdbcTemplate().query(sql.OREDER_BY_STAGE,
				new BeanPropertyRowMapper<TypeOrderDetails>(TypeOrderDetails.class), stage);
	}
	
	
	public List<TypeOrderDetails> getOdersByStageDistinct(String stage) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		return getJdbcTemplate().query(sql.ORDERS_BY_STAGE_DISTINCT,
				new BeanPropertyRowMapper<TypeOrderDetails>(TypeOrderDetails.class), stage);
	}
	
	
	
	

}
