package org.com.jdbcDAO;

import javax.sql.DataSource;

import org.com.DAO.UserDetailsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
@Controller
public class UserDetailsDAOImpl implements UserDetailsDAO{

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
		final String qry1 = "SELECT address1 FROM reg_users WHERE phone = ? ";
		final String qry2 = "SELECT address2 FROM reg_users WHERE phone = ? ";
		
		Object[] inputs1 = new Object[] {username};
		Object[] inputs2 = new Object[] {username};
		jdbcTemplate.setDataSource(dataSource);  
		String add1 = getJdbcTemplate().queryForObject(qry1, inputs1, String.class);
        String add2 = getJdbcTemplate().queryForObject(qry2, inputs2, String.class);
        
        
        String address = add1 + ":" + add2;
        
        return address;
		
	}

}
