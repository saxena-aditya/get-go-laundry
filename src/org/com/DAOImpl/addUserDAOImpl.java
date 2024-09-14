package org.com.DAOImpl;

import javax.sql.DataSource;

import org.com.DAO.AddUserDAO;
import org.com.DTO.GetterRegisterDetails;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class AddUserDAOImpl implements AddUserDAO {

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
	public int addNewUser(GetterRegisterDetails grd) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		jdbcTemplate.update(sql.SAVE_USER, grd.getFirstName(), grd.getLastName(), grd.getPhone(), grd.getPass(),
				grd.getAddress1(), grd.getAddress2());

		return 0;
	}

	@Override
	public boolean userAlreadyPresent(String phn_number) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(getDataSource());
		int i = jdbcTemplate.queryForInt(sql.COUNT_USER_VALIDATE, phn_number);

		if (i == 0)
			return false;
		else
			return true;
	}

}
