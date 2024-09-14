package org.com.WebController;

import java.util.ArrayList;
import java.util.List;

import org.com.DAOImpl.AdminServicesDAOImpl;
import org.com.DAOImpl.orderDetailsDAOImpl;
import org.com.DTO.ItemPrices.ItemPrices;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UtilityFuctions {
	public orderDetailsDAOImpl cloth_list;
	public AdminServicesDAOImpl admin;
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Spring.xml");

	
	public List<ItemPrices> getClothList(){
		List<ItemPrices> clothList = new ArrayList<>();
		cloth_list = ctx.getBean(orderDetailsDAOImpl.class);
		clothList = cloth_list.getItemPrices();
		
		return clothList;
	}
	
	int getTotalUsers(){
		
		admin = ctx.getBean(AdminServicesDAOImpl.class);
		return admin.getTotalUsers();
	}
	
	int getTotalOrderCount(){
		admin = ctx.getBean(AdminServicesDAOImpl.class);
		
		return admin.getTotalNumberOfOrders();
		
	}
	
	int getTotalOrderInProcess(){
		admin = ctx.getBean(AdminServicesDAOImpl.class);
		return admin.getTotalProcessingOrders();
		
	}
	
	int getTotalOrderDone(){
		admin = ctx.getBean(AdminServicesDAOImpl.class);
		return admin.getTotalServedOrders();
		
		
	}
	
	int getTotalOrderCostInProcess(){
		admin = ctx.getBean(AdminServicesDAOImpl.class);
		return admin.getTotalProcessingOrderCost();
		
	}
	int getTotalBuisenessDone(){
		admin = ctx.getBean(AdminServicesDAOImpl.class);
		return admin.getTotalOrderCost();
		
	}
	
}
