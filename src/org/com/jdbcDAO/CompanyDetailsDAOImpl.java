package org.com.jdbcDAO;


import javax.sql.DataSource;

import org.com.DAO.CompanyDetailsDAO;
import org.com.SQLExpressions.MySQLStatements;
import org.com.getterSetterObjs.typeCompanyDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class CompanyDetailsDAOImpl  implements CompanyDetailsDAO {
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
	public typeCompanyDetails getCompanyDetail() {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		typeCompanyDetails company_details = (typeCompanyDetails)jdbcTemplate.queryForObject(sql.GET_COMPANY_DETAILS
				, new BeanPropertyRowMapper<typeCompanyDetails>(typeCompanyDetails.class));
		
		
		return company_details;
	}
	
}