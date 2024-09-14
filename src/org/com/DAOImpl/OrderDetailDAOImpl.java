package org.com.DAOImpl;

import java.util.List;
import javax.sql.DataSource;
import org.com.DAO.OrderDetailDAO;
import org.com.DTO.ItemPrices.ItemPrices;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class OrderDetailDAOImpl {

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

  public List<OrderDetailDAO> findOrder(String Username) {
    jdbcTemplate.setDataSource(getDataSource());
    List<OrderDetailDAO> Olist = getJdbcTemplate()
      .query(
        sql.TOTAL_ORDERS,
        new BeanPropertyRowMapper<OrderDetailDAO>(OrderDetailDAO.class),
        Username
      );

    return Olist;
  }

  public int orderCost(String orderID) {
    jdbcTemplate.setDataSource(getDataSource());
    int cost = getJdbcTemplate().queryForInt(sql.ORDER_COST, orderID);
    return cost;
  }

  public List<OrderDetailDAO> latestOrder(String Username) {
    // TODO Auto-generated method stub

    jdbcTemplate.setDataSource(getDataSource());
    List<OrderDetailDAO> latestoList = getJdbcTemplate()
      .query(
        sql.LAST_ORDER,
        new BeanPropertyRowMapper<OrderDetailDAO>(OrderDetailDAO.class),
        Username
      );

    return latestoList;
  }

  public List<ItemPrices> getItemPrices() {
    jdbcTemplate.setDataSource(getDataSource());
    List<ItemPrices> item_prices = getJdbcTemplate()
      .query(
        sql.GET_PRICES,
        new BeanPropertyRowMapper<ItemPrices>(ItemPrices.class)
      );

    return item_prices;
  }
}
