package org.com.jdbcDAO;

import javax.sql.DataSource;

import org.com.DAO.addUserDAO;
import org.com.getterSetterObjs.getterRegisterDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
@Controller
public class addUserDAOImpl implements addUserDAO{
	
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
	public int addNewUser(getterRegisterDetails grd) {
		// TODO Auto-generated method stub
		final String query = "INSERT INTO reg_users(firstName, lastName, phone, pass, address1, address2)VALUES (?,?,?,?,?,?)";
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(query, grd.getFirstName(),grd.getLastName(), grd.getPhone(), grd.getPass(), 
				                   grd.getAddress1(), grd.getAddress2());
		
		
		return 0;
	}
	@Override
	public boolean userAlreadyPresent(String phn_number) {
		// TODO Auto-generated method stub
		
		String str = "SELECT COUNT(*) FROM reg_users WHERE phone = ?";
		jdbcTemplate.setDataSource(getDataSource());
		int i = jdbcTemplate.queryForInt(str, phn_number);
		
		if(i == 0)
			return false;
		else
			return true;
	}

}
