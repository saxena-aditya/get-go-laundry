package org.com.DAO;

import java.util.List;

import org.com.getterSetterObjs.AdminServicesGetCompanyDetails;
import org.com.getterSetterObjs.AdminServicesGetNewBannerText;
import org.com.getterSetterObjs.AdminServicesGetNewPerItemCosts;
import org.com.getterSetterObjs.AdminServicesMinimumOrderCost;
import org.com.getterSetterObjs.AdminServicesOffOffer;
import org.com.getterSetterObjs.TypeOrderDetails;
import org.com.getterSetterObjs.TypeUserDetails;

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
