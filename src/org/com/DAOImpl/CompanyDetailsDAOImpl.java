package org.com.DAOImpl;

import javax.sql.DataSource;
import org.com.DAO.CompanyDetailsDAO;
import org.com.DTO.TypeCompanyDetails;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class CompanyDetailsDAOImpl implements CompanyDetailsDAO {

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
  public TypeCompanyDetails getCompanyDetail() {
    // TODO Auto-generated method stub
    jdbcTemplate.setDataSource(getDataSource());
    TypeCompanyDetails company_details =
      (TypeCompanyDetails) jdbcTemplate.queryForObject(
        sql.GET_COMPANY_DETAILS,
        new BeanPropertyRowMapper<TypeCompanyDetails>(TypeCompanyDetails.class)
      );

    return company_details;
  }
}
