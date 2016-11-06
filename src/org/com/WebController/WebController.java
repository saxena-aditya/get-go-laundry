package org.com.WebController;


import javax.servlet.http.HttpSession;

import org.com.ItemPrices.ItemPrices;
import org.com.getterSetterObjs.LoginGetterandSetters;
import org.com.getterSetterObjs.getterRegisterDetails;
import org.com.jdbcDAO.addUserDAOImpl;
import org.com.jdbcDAO.jdbcDAO;
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
	private ItemPrices item = new ItemPrices();
	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Spring.xml");
	@RequestMapping(value = "/")
	protected String myFromClass1(){
		return "mainPage";	
		}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	protected ModelAndView myFromClass1(@ModelAttribute("User") LoginGetterandSetters User, HttpSession session){
	  jdbc = ctx.getBean("jdbcDAO", jdbcDAO.class);
			int x = jdbc.getCount(User.getUsername(),User.getPass());
		//	System.out.println("pass : "+User.getPass()+" username : "+User.getUsername());
			
			if(x == 1 ){
				session.setAttribute("loggedinUser", User);
				return LoginSucessModel();
			}else
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
		
		//	System.out.println("firstName is : "+reg.getFirstName()+" lastName is : "
		//	+reg.getLastName());
		ModelAndView model2 = new ModelAndView("mainPage");
		model2.addObject("MsgDisplay", "Please Login with your Phone Number and Password!");
		return model2;
		
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	protected String logout(HttpSession session){
		
		session.removeAttribute("loggedinUser");
		return "mainPage";
	}
	
	
	protected ModelAndView LoginSucessModel(){
		
		ModelAndView model1 = new ModelAndView("welcome");
		model1.addObject("item", item);
		return model1;
		}
	
	protected ModelAndView LoginFailedModel(){
		ModelAndView model2 = new ModelAndView("mainPage");
		model2.addObject("MsgDisplay", "Error. Please Try Again!");
		
		return model2;
	
	}
	}

