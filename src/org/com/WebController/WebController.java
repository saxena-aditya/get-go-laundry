package org.com.WebController;


import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpSession;
import org.com.DAO.orderDetailsDAO;
import org.com.ItemPrices.ItemPrices;
import org.com.getterSetterObjs.LoginGetterandSetters;
import org.com.getterSetterObjs.Ordergetter;
import org.com.getterSetterObjs.getterRegisterDetails;
import org.com.jdbcDAO.jdbcDAO;
import org.com.jdbcDAO.orderDetailsDAOImpl;
import org.com.jdbcDAO.orderSaveDAOImpl;
import org.com.jdbcDAO.addUserDAOImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class WebController {
	private jdbcDAO jdbc;
	private addUserDAOImpl jdb;
	private orderSaveDAOImpl saveOrder_Impl;
	private orderDetailsDAOImpl orderList; 
	private ItemPrices item = new ItemPrices();
	public int orderCost = 0;
	String username;
	long orderid;
	long orderID;
	String lastOrderid;
	boolean isOrderPlaced = false;
	int item_number;
	int category_count = 0;
	int LatestOcost;
	int cost;
	orderDetailsDAO le;
	
	List<Integer> costList = new ArrayList<>();
	List<String> currentOrder = new ArrayList<>();
	List<String> cOrder = new ArrayList<>();
	List<orderDetailsDAO> lastOrderDetails = new ArrayList<>();
	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Spring.xml");
	

	
	private void getLastOrderDetails(){
		
	
		orderList = ctx.getBean("orderDetailsDAOImpl", orderDetailsDAOImpl.class);	

		lastOrderDetails = orderList.latestesOrder(getUsername());
		if (lastOrderDetails.size() == 0)
			System.out.println("Sorry not Latest orders! ");
		else{
			for (orderDetailsDAO temp : lastOrderDetails) {
				LatestOcost = orderList.orderCost(temp.getOrder_id());
					
			}
		}
		

		
	}
	
	
	
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
				
				session.setAttribute("loggedinUser", User.getUsername());
				setUsername(User.getUsername());
				return LoginSucessModel(User.getUsername());
			}
			else
				return LoginFailedModel();
	}
	
	@RequestMapping(value = "login")
	protected ModelAndView login_page(){
		
		ModelAndView model = new ModelAndView("welcome");
		isOrderPlaced = false;
		getLastOrderDetails();
		model.addObject("username", getUsername());
		model.addObject("item", item);
		model.addObject("latestoList", lastOrderDetails);
		model.addObject("LatestOcost", LatestOcost);
		
		return model;
	}
	
	@RequestMapping(value = "order_cancel" )
	protected ModelAndView order_cancel(){
		ModelAndView model = new ModelAndView("welcome");
		saveOrder_Impl = ctx.getBean(orderSaveDAOImpl.class);

		saveOrder_Impl.deleteOrder(getUsername());
		getLastOrderDetails();
		model.addObject("LatestOcost", LatestOcost);
		model.addObject("latestoList", lastOrderDetails);

		model.addObject("username", getUsername());
		return model;
	}
	
	
	@RequestMapping(value = "registerMe")
	protected ModelAndView myFromClass2( ){
		return new ModelAndView("registerPage");
		}
	
	
	@RequestMapping(value = "formSubmission", method = RequestMethod.POST)
	protected ModelAndView ForForm(@ModelAttribute("registerUser") getterRegisterDetails reg){
		
		jdb = ctx.getBean("addUserDAOImpl", addUserDAOImpl.class);
		ModelAndView model_success = new ModelAndView("mainPage");
		ModelAndView model_fail = new ModelAndView("registerPage");
		
		if(jdb.userAlreadyPresent(reg.getPhone())){
			model_fail.addObject("MsgDisplay", "Sorry, phone number already registered!");
			model_fail.addObject("id_number", 0);
			return model_fail;
		}
		else{
		
		jdb.addNewUser(reg);
		model_success.addObject("MsgDisplay", "Please Login with your Phone Number and Password!");
		return model_success;
	}
	
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
		placed_Order.addObject("username",getUsername());
		
		return placed_Order;
	}
	
	@RequestMapping(value = "order_history", method = RequestMethod.GET)
	protected ModelAndView orderHistory(HttpSession session){
		
		ModelAndView model = new ModelAndView("order_history");
		
		  /*1->getting all the orders by the username (phone number)
		   *2-> storing then in the List<generic> type.
		   *3-> calculating the cost for each order by order ID
		   *4-> storing the order cost for each order in a array serial-wise
		   *5-> passing the object model List<>, array and username to the jsp
		   *6-> getting the last order_id and setting it to the variable! (for current order)
		  **/
		
	//	getLists();
		orderList = ctx.getBean("orderDetailsDAOImpl", orderDetailsDAOImpl.class);	
		List<orderDetailsDAO> oList = orderList.findOrder(getUsername());
		if(oList.size() == 0)
		{
			//do something
		}
		
		List<Integer> costList = new ArrayList<Integer>();
		int cost;
		for (orderDetailsDAO temp : oList) {
			cost = orderList.orderCost(temp.getOrder_id());
			costList.add(cost);		
		}
		
		model.addObject("costList", costList);
		model.addObject("oList", oList);
		model.addObject("username", getUsername());

		
		return model;
	}
	
	ItemPrices itm = new ItemPrices();
	@RequestMapping(value = "prices", method = RequestMethod.GET)
	protected ModelAndView pricesPage(HttpSession session, Model model){
		
		if(session.getAttribute("loggedinUser")==null){
			model.addAttribute("MsgDisplay", "Please Login First!");
			return new ModelAndView("mainPage");
		}
		ModelAndView m = new ModelAndView("pricesPage");
		session.setAttribute("itm", itm);
		m.addObject("username", getUsername());
		return m;
		}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	protected String returnHome(){
		
		return "mainPage";
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
		getLastOrderDetails();
		isOrderPlaced = false;
		ModelAndView model1 = new ModelAndView("welcome");
		model1.addObject("username", username);
		model1.addObject("item", item);
		model1.addObject("latestoList", lastOrderDetails);
		model1.addObject("LatestOcost", LatestOcost);
		
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