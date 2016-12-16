package org.com.jdbcDAO;

import javax.sql.DataSource;

import org.com.DAO.LoginPageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class jdbcDAO implements LoginPageDAO{
	
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
	public int getCount(String user,String pass){
	//	System.out.println("pass1 : "+pass+" user1 : "+user);
		String sql = "SELECT COUNT(*) FROM reg_users where phone = ? AND pass = ?";
		
		jdbcTemplate.setDataSource(getDataSource());

		return jdbcTemplate.queryForInt(sql, user,pass);
		
		
		
		
	}
	

}
