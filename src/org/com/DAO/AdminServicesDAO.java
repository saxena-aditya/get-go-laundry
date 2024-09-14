package org.com.DAO;

import java.util.List;
import org.com.DTO.AdminServicesGetCompanyDetails;
import org.com.DTO.AdminServicesGetNewBannerText;
import org.com.DTO.AdminServicesGetNewPerItemCosts;
import org.com.DTO.AdminServicesMinimumOrderCost;
import org.com.DTO.AdminServicesOffOffer;
import org.com.DTO.TypeOrderDetails;
import org.com.DTO.TypeUserDetails;

public interface AdminServicesDAO {
  void updateBannerText(AdminServicesGetNewBannerText bannerText);
  void updateCompanyDetails(AdminServicesGetCompanyDetails companyDetails);
  void updatePerItemCost(AdminServicesGetNewPerItemCosts perItemCosts);
  void updateOffPercentage(AdminServicesOffOffer offPercentage);
  void updateMinimumOrderCost(AdminServicesMinimumOrderCost minimumOrderCost);
  int getTotalNumberOfOrders();
  int getTotalProcessingOrders();
  int getTotalUsers();
  int getTotalOrderCost();
  int getTotalProcessingOrderCost();
  int getTotalServedOrders();
  TypeUserDetails getUserDetails(String phone);
  List<TypeOrderDetails> getOrderDetails(String order_id);
  List<TypeOrderDetails> getOdersByStage(String stage);
  List<TypeUserDetails> getUserDetailsList(String phone);
}
