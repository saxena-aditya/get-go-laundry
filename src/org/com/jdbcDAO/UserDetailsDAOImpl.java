package org.com.jdbcDAO;

import javax.sql.DataSource;

import org.com.DAO.UserDetailsDAO;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
@Controller
public class UserDetailsDAOImpl implements UserDetailsDAO{
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
	public String getUserAddress(int username) {
		// TODO Auto-generated method stub
		
		
		Object[] inputs1 = new Object[] {username};
		Object[] inputs2 = new Object[] {username};
		jdbcTemplate.setDataSource(dataSource);  
		String add1 = getJdbcTemplate().queryForObject(sql.SEE_ADD1, inputs1, String.class);
        String add2 = getJdbcTemplate().queryForObject(sql.SEE_ADD2, inputs2, String.class);
        
        
        String address = add1 + ":" + add2;
        
        return address;
		
	}

}
