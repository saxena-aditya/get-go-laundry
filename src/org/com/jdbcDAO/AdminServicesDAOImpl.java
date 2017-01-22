package org.com.jdbcDAO;

import javax.sql.DataSource;

import org.com.DAO.AdminServicesDAO;
import org.com.SQLExpressions.MySQLStatements;
import org.com.getterSetterObjs.AdminServicesGetCompanyDetails;
import org.com.getterSetterObjs.AdminServicesGetNewBannerText;
import org.com.getterSetterObjs.AdminServicesGetNewPerItemCosts;
import org.com.getterSetterObjs.AdminServicesMinimumOrderCost;
import org.com.getterSetterObjs.AdminServicesOffOffer;
import org.springframework.beans.factory.annotation.Autowired;
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

}
