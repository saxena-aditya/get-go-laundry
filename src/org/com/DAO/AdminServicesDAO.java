package org.com.DAO;

import org.com.getterSetterObjs.AdminServicesGetCompanyDetails;
import org.com.getterSetterObjs.AdminServicesGetNewBannerText;
import org.com.getterSetterObjs.AdminServicesGetNewPerItemCosts;
import org.com.getterSetterObjs.AdminServicesMinimumOrderCost;
import org.com.getterSetterObjs.AdminServicesOffOffer;

public interface AdminServicesDAO {
	
	void updateBannerText(AdminServicesGetNewBannerText bannerText);
	void updateCompanyDetails(AdminServicesGetCompanyDetails companyDetails);
	void updatePerItemCost(AdminServicesGetNewPerItemCosts perItemCosts);
	void updateOffPercentage(AdminServicesOffOffer offPercentage);
	void updateMinimumOrderCost(AdminServicesMinimumOrderCost minimumOrderCost);

}
