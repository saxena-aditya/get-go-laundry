package org.com.WebController;



import javax.servlet.http.HttpSession;

import org.com.ItemPrices.ItemPrices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class servicesController {

	
	ItemPrices itm = new ItemPrices();
	@RequestMapping(value = "prices", method = RequestMethod.GET)
	protected ModelAndView pricesPage(HttpSession session, Model model){
		
		if(session.getAttribute("loggedinUser")==null){
			model.addAttribute("MsgDisplay", "Please Login First!");
			return new ModelAndView("mainPage");
		}
		ModelAndView m = new ModelAndView("pricesPage");
		session.setAttribute("itm", itm);
		return m;
		}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	protected String returnHome(){
		return "mainPage";
	}
	
	
	
	
	

}
