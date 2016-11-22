package org.com.WebController;


import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.com.ItemPrices.ItemPrices;
import org.com.getterSetterObjs.LoginGetterandSetters;
import org.com.getterSetterObjs.Ordergetter;
import org.com.getterSetterObjs.getterRegisterDetails;
import org.com.jdbcDAO.jdbcDAO;
import org.com.jdbcDAO.orderSaveDAOImpl;
import org.com.jdbcDAO.addUserDAOImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebController {
	private jdbcDAO jdbc;
	private addUserDAOImpl jdb;
	private orderSaveDAOImpl saveOrder_Impl;
	private ItemPrices item = new ItemPrices();
	public int orderCost = 0;
	String username;
	long orderid;
	long orderID;
	boolean isOrderPlaced = false;
	int item_number;
	

	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Spring.xml");
	@RequestMapping(value = "/")
	protected String myFromClass1(){
		return "mainPage";	
		}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	protected ModelAndView myFromClass1(@ModelAttribute("User") LoginGetterandSetters User,
										HttpSession session){
		
			jdbc = ctx.getBean("jdbcDAO", jdbcDAO.class);
			int x = jdbc.getCount(User.getUsername(),User.getPass());
			if(x == 1 ){
				session.setAttribute("loggedinUser", User);
				setUsername(User.getUsername());
				return LoginSucessModel(User.getUsername());
			}
			else
				return LoginFailedModel();
	}
	
	
	
	@RequestMapping(value = "registerMe")
	protected ModelAndView myFromClass2( ){
		return new ModelAndView("registerPage");
		}
	
	
	@RequestMapping(value = "formSubmission", method = RequestMethod.POST)
	protected ModelAndView ForForm(@ModelAttribute("registerUser") getterRegisterDetails reg){
		
		jdb = ctx.getBean("addUserDAOImpl", addUserDAOImpl.class);
		jdb.addNewUser(reg);
		
		ModelAndView model2 = new ModelAndView("mainPage");
		model2.addObject("MsgDisplay", "Please Login with your Phone Number and Password!");
		return model2;
	
	}
	
	@RequestMapping(value = "placeOrder", method = RequestMethod.POST)
	protected ModelAndView takingOrder(@ModelAttribute("ordPlaced") Ordergetter odr) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException{
		ModelAndView placed_Order = new ModelAndView("OrderShow");
		
		//orderCost = calculateOrderCost(odr, item);
		//System.out.println( "order is = "+ calculateOrderCost(odr, item));
		saveOrder_Impl = ctx.getBean(orderSaveDAOImpl.class);
		 
		placed_Order.addObject("ordItem", odr);
		if(!isOrderPlaced){
			orderID = generateOrderID();
			
		    
			setOrderID(orderID);
			getObject(odr);
			
			
		
		}isOrderPlaced = true;
		placed_Order.addObject("orderID", getOrderID());
		//System.out.println(odr.timeSpan + " : " + odr.date+ " : " + odr.tshirt + " :" + getUsername());
		
	   //System.out.println( "order String is = "+ getOrderString(odr, item));
		return placed_Order;
	}
	

	public void setUsername(String username2){
		this.username = username2;
		}
	public String getUsername() {
		return username;
	}

	public long generateOrderID() {
		Random genereateRandomInt = new Random();
	    long orderID = genereateRandomInt.nextInt(999999);
		return orderID;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	protected String logout(HttpSession session){
		session.removeAttribute("loggedinUser");
		return "mainPage";
	}
	
	
	protected ModelAndView LoginSucessModel(String username){
		isOrderPlaced = false;
		ModelAndView model1 = new ModelAndView("welcome");
		model1.addObject("username", username);
		model1.addObject("item", item);
		
		
		
		
		return model1;
		}
	
	
	protected ModelAndView LoginFailedModel(){
		
		ModelAndView model2 = new ModelAndView("mainPage");
		model2.addObject("MsgDisplay", "Error. Please Try Again!");
		return model2;
	}
	
	private void setOrderID(long orderID){
		  this.orderid = orderID;
		}
		public long getOrderID(){
			return orderid;
		}
	
	
	public int getObject(Object obj ) throws IllegalArgumentException, IllegalAccessException,
								NoSuchFieldException, SecurityException {
    /*
     * JAVA REFLECTION IS SO **AWESOME** :D 
     */
	
	/*
	 * Iterating through all the decleared items in the Ordergetter.java and 
	 * saving all the non-zero entries into the database :- logindata.my_order
	 */
	
	for (Field field : obj.getClass().getDeclaredFields()) {
        
    	if( isItemCountValid(obj, field)){
    		int itm_cost = saveOrder_Impl.calc_ItemCost(field.getName().toString(), 
    							field.getInt(obj), getOrderID());
    		saveOrder_Impl.my_orderSave( getUsername(),getOrderID(), 
    						field.getName().toString(), field.getInt(obj), itm_cost );
    		
    		
    		
    		
    		
    		
    		
    		}
    	}
    /*Demo function for getting and saving all query result (coloums) in a list */
	saveOrder_Impl.testCallFunction();
	
	
    /* 
     * Getting and saving the DATE entered seperately, to avoid overwriting 
     * in the database table (my_order) 
     */
    Field date = obj.getClass().getDeclaredField("date");
    saveOrder_Impl.save_Date((String) date.get(obj), getOrderID());
    
    /* Getting and saving the TIME entered seperately, to avoid overwriting
     * in the database table (my_order)
     */
    Field time = obj.getClass().getDeclaredField("timeSpan"); 
    saveOrder_Impl.save_Time((String) time.get(obj), getOrderID());
    
    return 0;
}


public boolean isItemCountValid(Object obj, Field field) 
		throws IllegalArgumentException, IllegalAccessException{
	
	if(field.getType().equals(int.class) )
		if(field.getInt(obj)!=0 )
		 return true;
		else 
		 return false;
	else
		return false;
	
	
	
}


}