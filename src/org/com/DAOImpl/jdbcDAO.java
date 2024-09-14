package org.com.DAOImpl;

import javax.sql.DataSource;
import org.com.DAO.LoginPageDAO;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class jdbcDAO implements LoginPageDAO {

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
  public int getCount(String user, String pass) {
    jdbcTemplate.setDataSource(getDataSource());
    return jdbcTemplate.queryForInt(sql.COUNT_USER_REG, user, pass);
  }
}
