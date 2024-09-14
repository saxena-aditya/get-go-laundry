package org.com.DAOImpl;

import java.util.List;
import javax.sql.DataSource;
import org.com.DAO.OrderDetailsDAO;
import org.com.DTO.ItemPrices.ItemPrices;
import org.com.SQLExpressions.MySQLStatements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class OrderDetailsDAOImpl {

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

  public List<OrderDetailsDAO> findOrder(String Username) {
    jdbcTemplate.setDataSource(getDataSource());
    List<OrderDetailsDAO> Olist = getJdbcTemplate()
      .query(
        sql.TOTAL_ORDERS,
        new BeanPropertyRowMapper<OrderDetailsDAO>(OrderDetailsDAO.class),
        Username
      );

    return Olist;
  }

  public int orderCost(String orderID) {
    jdbcTemplate.setDataSource(getDataSource());
    int cost = getJdbcTemplate().queryForInt(sql.ORDER_COST, orderID);
    return cost;
  }

  public List<OrderDetailsDAO> latestOrder(String Username) {
    // TODO Auto-generated method stub

    jdbcTemplate.setDataSource(getDataSource());
    List<OrderDetailsDAO> latestoList = getJdbcTemplate()
      .query(
        sql.LAST_ORDER,
        new BeanPropertyRowMapper<OrderDetailsDAO>(OrderDetailsDAO.class),
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
