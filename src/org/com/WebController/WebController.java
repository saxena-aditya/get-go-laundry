package org.com.WebController;


import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.com.DAO.OrderDetailsDAO;
import org.com.DAOImpl.CompanyDetailsDAOImpl;
import org.com.DAOImpl.UserDetailsDAOImpl;
import org.com.DAOImpl.AddUserDAOImpl;
import org.com.DAOImpl.jdbcDAO;
import org.com.DAOImpl.OrderDetailsDAOImpl;
import org.com.DAOImpl.OrderSaveDAOImpl;
import org.com.DTO.LoginGetterandSetters;
import org.com.DTO.Ordergetter;
import org.com.DTO.GetterRegisterDetails;
import org.com.DTO.TypeCompanyDetails;
import org.com.DTO.ItemPrices.ItemPrices;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;


@Controller
public class WebController {
	private jdbcDAO jdbc;
	private AddUserDAOImpl jdb;
	private OrderSaveDAOImpl saveOrder_Impl;
	private OrderDetailsDAOImpl orderList; 
	private CompanyDetailsDAOImpl cmp_details;	
	public int orderCost = 0;
	public boolean isOrderPlaced = false;
	public int item_number;
	public int category_count = 0;
	public int LatestOcost;
	public int cost;
	public String username;
	public String orderid;
	public String orderID;
	public String lastOrderid;
	private String add1;
	private String add2;
	public OrderDetailsDAO le;
	public 	UserDetailsDAOImpl userDetails;
	public UtilityFuctions utils = new UtilityFuctions();

	List<Integer> costList = new ArrayList<>();
	List<String> currentOrder = new ArrayList<>();
	List<String> cOrder = new ArrayList<>();
	List<OrderDetailsDAO> lastOrderDetails = new ArrayList<>();
	List<ItemPrices> pricesList = new ArrayList<>();
	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Spring.xml");
	
	// gets all the cloth prices from the database and saves them in the List(procesList)
	public void getItemPricesForContext(){
		orderList = ctx.getBean("orderDetailsDAOImpl", OrderDetailsDAOImpl.class);	
		pricesList = orderList.getItemPrices();
	}
	
	public TypeCompanyDetails getCompanyDetails(){
	
		cmp_details = ctx.getBean(CompanyDetailsDAOImpl.class);
		TypeCompanyDetails c_details = cmp_details.getCompanyDetail();
		
	return c_details;		
	
	}
	
	private void getLastOrderDetails(){
		
		// an instance of the bean that will connect to the database is included here!!		
		orderList = ctx.getBean("orderDetailsDAOImpl", OrderDetailsDAOImpl.class);	

		lastOrderDetails = orderList.latestOrder(getUsername());
		if (lastOrderDetails.size() == 0)
			System.out.println("Sorry not Latest orders! ");
		else{
			for (OrderDetailsDAO temp : lastOrderDetails) {
				LatestOcost = orderList.orderCost(temp.getOrder_id());
					
			}
		}
	}
	@RequestMapping(value = "home", method = RequestMethod.GET)
	protected ModelAndView returnHome(){
		
		ModelAndView model = new ModelAndView("mainPage");
		model.addObject("company_details", getCompanyDetails());
		
		return model; 
	}
	@RequestMapping(value = "about-us")
	protected ModelAndView about(HttpSession session){
		ModelAndView model = new ModelAndView("about-us");
		model.addObject("company_details", getCompanyDetails());

		
		return model;
	}
	@RequestMapping(value = "/")
	protected ModelAndView myFromClass1(){
		ModelAndView model = new ModelAndView("mainPage");
		model.addObject("company_details", getCompanyDetails());

		return model;	
		}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	protected ModelAndView myFromClass1(@ModelAttribute("User") LoginGetterandSetters User,
										HttpSession session){
		
			jdbc = ctx.getBean("jdbcDAO", jdbcDAO.class);
			
			int x = jdbc.getCount(User.getUsername(),User.getPass());
			if(x == 1 ){
				
				session.setAttribute("loggedinUser", User.getUsername());
				setUsername(User.getUsername());
				return LoginSucessModel(User.getUsername());
			}
			else
				return LoginFailedModel();
	}
	
	@RequestMapping(value = "login")
	protected ModelAndView login_page(HttpSession session){
		if(session.getAttribute("loggedinUser") == null){
			 return new ModelAndView("mainPage")
					 .addObject("company_details", getCompanyDetails());
		}
		ModelAndView model = new ModelAndView("welcome");
		isOrderPlaced = false;
		getLastOrderDetails();
		model.addObject("username", getUsername())
			.addObject("latestoList", lastOrderDetails)
			.addObject("item_price", pricesList)
			.addObject("item_prices", getPricesListInJSON())
			.addObject("company_details", getCompanyDetails())	
			.addObject("LatestOcost", LatestOcost)
			.addObject("clothList", utils.getClothList())
			.addObject("jsonList", new Gson().toJson(utils.getClothList()))
			.addObject("add1", getAdd1())
			.addObject("add2", getAdd2());
		
		
		return model;
	}
	
	@RequestMapping(value = "order_cancel" )
	protected ModelAndView order_cancel(){
		ModelAndView model = new ModelAndView("welcome");
		saveOrder_Impl = ctx.getBean(OrderSaveDAOImpl.class);

		saveOrder_Impl.deleteOrder(getUsername());
		getLastOrderDetails();
		   model.addObject("LatestOcost", LatestOcost)
				.addObject("latestoList", lastOrderDetails)
				.addObject("username", getUsername())
				.addObject("item_price", pricesList)

				.addObject("company_details", getCompanyDetails())
				.addObject("clothList", utils.getClothList())
				.addObject("jsonList", new Gson().toJson(utils.getClothList()))
				.addObject("add1", getAdd1())
				.addObject("add2", getAdd2());
				

		return model;
	}
	
	
	@RequestMapping(value = "registerMe")
	protected ModelAndView myFromClass2( ){
		ModelAndView model = new ModelAndView("registerPage");
		model.addObject("company_details", getCompanyDetails());

		return model;
		}
	
	
	@RequestMapping(value = "formSubmission", method = RequestMethod.POST)
	protected ModelAndView ForForm(@ModelAttribute("registerUser") GetterRegisterDetails reg){
		
		jdb = ctx.getBean("addUserDAOImpl", AddUserDAOImpl.class);
		ModelAndView model_success = new ModelAndView("mainPage");
		ModelAndView model_fail = new ModelAndView("registerPage");
	
		

		
		if(jdb.userAlreadyPresent(reg.getPhone())){
			model_fail.addObject("MsgDisplay", "Sorry, phone number already registered!");
			model_fail.addObject("id_number", 0);
			model_fail.addObject("company_details", getCompanyDetails());
			return model_fail;
		}
		else{
		
		jdb.addNewUser(reg);
		model_success.addObject("MsgDisplay", "Please Login with your Phone Number and Password!");
		model_success.addObject("company_details", getCompanyDetails());
		
		
		return model_success;
	}
	
	}
	
	
	@RequestMapping(value = "placeOrder", method = RequestMethod.POST)
	protected ModelAndView takingOrder(@ModelAttribute("ordPlaced") Ordergetter odr) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, SecurityException{
		ModelAndView placed_Order = new ModelAndView("OrderShow");
		placed_Order.addObject("takenOrder", odr);
		
		//orderCost = calculateOrderCost(odr, item);
		System.out.println( "order is = "+ odr.getAdd1() + "\n" + odr.getAdd2());
		
		saveOrder_Impl = ctx.getBean(OrderSaveDAOImpl.class);
		
		if(saveOrder_Impl.firstOrder(getUsername()))
				placed_Order.addObject("isFirstOrder", "yes");
		
			saveOrder_Impl.exhaustUser(getUsername());
			
		 /* adding (order object) for object reflection!!
		  * the reflection then loops through the object details and adds it to 
		  * the database. 
		  * */
			
			
			/* Adding the user to a diffrent table, so that they can be counted as
			 * "done" for the 40% oFF offer!
			 * */
			
			
		placed_Order.addObject("ordItem", odr);
		if(!isOrderPlaced){
			orderID = generateOrderID();
			setOrderID(orderID);
			getObject(odr);
			// HERE GOES THE ORDER ADDRESS!!
			saveOrder_Impl.saveOrderAddress(odr.getAdd1(), odr.getAdd2(), getOrderID());
		}isOrderPlaced = true;
		
		
		
		/* Checking if the place order is the first one or not? 
		 * the function will return true is it is otherwise will return false.
		 */
		
		System.out.println("the fistrOrder check : " + saveOrder_Impl.firstOrder(getUsername()));
		
		/* Have not calculated and saved the seperate order cost in the data base! so 
		 * in the order history table for first order cost-- check if the order id is first 
		 * order id and then do the OFF OFFER!
		 * */
		
		placed_Order.addObject("order"
				+ "Cost", orderList.orderCost(getOrderID()))
					.addObject("orderID", getOrderID())
					.addObject("username",getUsername())
					.addObject("company_details", getCompanyDetails())
					.addObject("item_price", getPricesListInJSON())
					.addObject("add1", getAdd1())
					.addObject("add2", getAdd2())
					.addObject("clothList", utils.getClothList())
					.addObject("jsonList", new Gson().toJson(utils.getClothList()));


		
		return placed_Order;
	}
	
	@RequestMapping(value = "order_history", method = RequestMethod.GET)
	protected ModelAndView orderHistory(HttpSession session){
		int cost;
		if(session.getAttribute("loggedinUser") == null){
			 return new ModelAndView("mainPage")
					 .addObject("company_details", getCompanyDetails());
		}
		
		ModelAndView model = new ModelAndView("order_history");
		
		  /*1->getting all the orders by the username (phone number)
		   *2-> storing then in the List<generic> type.
		   *3-> calculating the cost for each order by order ID
		   *4-> storing the order cost for each order in a array serial-wise
		   *5-> passing the object model List<>, array and username to the jsp
		   *6-> getting the last order_id and setting it to the variable! (for current order)
		  **/
		
	//	getLists();
		orderList = ctx.getBean("orderDetailsDAOImpl", OrderDetailsDAOImpl.class);	
		List<OrderDetailsDAO> oList = orderList.findOrder(getUsername());
		
		
		
		if(oList.size() == 0)
		{
			//do something
		}
		
		List<Integer> costList = new ArrayList<Integer>();
		
		for (OrderDetailsDAO temp : oList) {
			cost = orderList.orderCost(temp.getOrder_id());
			costList.add(cost);		
		}
		
		model.addObject("costList", costList);
		model.addObject("oList", oList);
		model.addObject("username", getUsername());
		model.addObject("company_details", getCompanyDetails())
		.addObject("clothList", utils.getClothList())
		.addObject("jsonList", new Gson().toJson(utils.getClothList()))
		.addObject("add1", getAdd1())
		.addObject("add2", getAdd2());

		
		return model;
	}
	
	
	@RequestMapping(value = "prices", method = RequestMethod.GET)
	protected ModelAndView pricesPage(HttpSession session, Model model){
		
		if(session.getAttribute("loggedinUser")==null){
			model.addAttribute("MsgDisplay", "Please Login First!");
			return new ModelAndView("mainPage")
					.addObject("company_details", getCompanyDetails());
		}
		
		
		ModelAndView m = new ModelAndView("pricesPage");
		m.addObject("item_price", pricesList);
		
		for(ItemPrices i:pricesList)
			System.out.println(i.getItem_name() + "" + i.getItem_cost());
			
		
		m.addObject("username", getUsername())
	     .addObject("company_details", getCompanyDetails())
		.addObject("clothList", utils.getClothList())
		.addObject("jsonList", new Gson().toJson(utils.getClothList()))
		.addObject("add1", getAdd1())
		.addObject("add2", getAdd2());;

		return m;
		}
	
	
	
	public void setUsername(String username2){
		this.username = username2;
		}
	public String getUsername() {
		return username;
	}

	public String generateOrderID() {
		Random genereateRandomInt = new Random();
	    String orderID = ""+genereateRandomInt.nextInt(999999);
		return orderID;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	protected ModelAndView logout(HttpSession session){
		ModelAndView model = new ModelAndView("mainPage");
		session.removeAttribute("loggedinUser");
		model.addObject( "company_details", getCompanyDetails());
		return model;
	}
	
	private String getPricesListInJSON() {
		// TODO Auto-generated method stub
			String str = "";	
		try{
			
			 str = new Gson().toJson(pricesList);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}

	protected ModelAndView LoginSucessModel(String username){
		
		
		getLastOrderDetails();
		getItemPricesForContext();
		getAddress();
		isOrderPlaced = false;
		ModelAndView model1 = new ModelAndView("welcome");
		
		
		model1.addObject("username", username);
		model1.addObject("latestoList", lastOrderDetails);
		model1.addObject("LatestOcost", LatestOcost);
		model1.addObject("item_price", getPricesListInJSON());
		model1.addObject("company_details", getCompanyDetails());
		
		model1.addObject("clothList", utils.getClothList())
		.addObject("item_price", pricesList)

		
		.addObject("jsonList", new Gson().toJson(utils.getClothList()))
				.addObject("add1", getAdd1())
				.addObject("add2", getAdd2());
		
		
		
		return model1;
		}
	
	protected ModelAndView LoginFailedModel(){
		
		ModelAndView model2 = new ModelAndView("mainPage");
		model2.addObject("MsgDisplay", "Error. Please Try Again!");
		model2.addObject("company_details", getCompanyDetails());

		return model2;
	}
	
	private void setOrderID(String orderID){
		  this.orderid = orderID;
		}
		public String getOrderID(){
			return orderid;
		}
	
		
		public String getLastOrderid() {
			return lastOrderid;
		}

		public void setLastOrderid(String lastOrderid) {
			this.lastOrderid = lastOrderid;
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
    		category_count++;
    		}
    	}
	
	System.out.println("Use have Entered : "+ category_count +" categories!" );
   
	
	
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


public boolean isItemCountValid(Object obj, Field field) throws IllegalArgumentException, IllegalAccessException{
	
	if(field.getType().equals(int.class))
		if(field.getInt(obj)!=0 )
		 return true;
		
		return false;
	}

public void getAddress(){
	
	userDetails = ctx.getBean(UserDetailsDAOImpl.class);
	String arr = userDetails.getUserAddress(getUsername());
	
	String Str[] = arr.split(":");
	setAdd1(Str[0]);
	setAdd2(Str[1]);
	System.out.println("Add1 : " + getAdd1() + "Add2 : " + getAdd2());
}

/**
 * @return the add1
 */
public String getAdd1() {
	return add1;
}

/**
 * @param add1 the add1 to set
 */
public void setAdd1(String add1) {
	this.add1 = add1;
}

/**
 * @return the add2
 */
public String getAdd2() {
	return add2;
}

/**
 * @param add2 the add2 to set
 */
public void setAdd2(String add2) {
	this.add2 = add2;
}


}