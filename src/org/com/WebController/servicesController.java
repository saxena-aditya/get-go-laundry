package org.com.WebController;




import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.com.ItemPrices.ItemPrices;
import org.com.getterSetterObjs.AdminServicesGetCompanyDetails;
import org.com.getterSetterObjs.AdminServicesGetNewBannerText;
import org.com.getterSetterObjs.AdminServicesGetNewPerItemCosts;
import org.com.getterSetterObjs.AdminServicesMinimumOrderCost;
import org.com.getterSetterObjs.AdminServicesOffOffer;
import org.com.jdbcDAO.AdminServicesDAOImpl;
import org.com.jdbcDAO.CompanyDetailsDAOImpl;
import org.com.jdbcDAO.orderDetailsDAOImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.testClasses.Person;
import com.org.testClasses.PersonListContainer;


@Controller
public class servicesController {
	public WebController webControllerServices = new WebController();
	ApplicationContext ctx = new ClassPathXmlApplicationContext("Spring.xml");
	public AdminServicesDAOImpl services = ctx.getBean(AdminServicesDAOImpl.class);
	
	public CompanyDetailsDAOImpl companyInfo;
	public orderDetailsDAOImpl cloth_list;
	
	
	@RequestMapping(value = "Sudo-I-am-admin", method = RequestMethod.GET)
	protected ModelAndView adminPage(){
		ModelAndView model = new ModelAndView("adminPage");
		companyInfo = ctx.getBean(CompanyDetailsDAOImpl.class);
		model.addObject("c_details", webControllerServices.getCompanyDetails());
		model.addObject("clothList", getClothList());
		return model;
	}
	
	@RequestMapping(value="changeCompanyDetails", method = RequestMethod.POST)
	protected ModelAndView updatingCompanyDetails(@ModelAttribute("companyDetails")
														AdminServicesGetCompanyDetails companyDetails){
		ModelAndView model = new ModelAndView("adminPage");
		services.updateCompanyDetails(companyDetails);
		model.addObject("c_details", webControllerServices.getCompanyDetails());
		model.addObject("clothList", getClothList());
		
		return model;
		
	}

	@RequestMapping(value="updatePerItemCosts", method = RequestMethod.POST)
	protected ModelAndView updatingPerIemCosts(@ModelAttribute("perItemCosts")
														AdminServicesGetNewPerItemCosts perItemCosts){
		ModelAndView model = new ModelAndView("adminPage");													
		services.updatePerItemCost(perItemCosts);
		
		model.addObject("c_details", webControllerServices.getCompanyDetails());
		model.addObject("clothList", getClothList());
		return model;
		
	}

	@RequestMapping(value="updateOff-Offer", method = RequestMethod.POST)
	protected ModelAndView updatingOffOffer(@ModelAttribute("offPercentage")
														AdminServicesOffOffer offPercentage){
		ModelAndView model = new ModelAndView("adminPage");													
		services.updateOffPercentage(offPercentage);
		model.addObject("c_details", webControllerServices.getCompanyDetails());
		model.addObject("clothList", getClothList());
		return model;
		
	}

	@RequestMapping(value="updateBannerText", method = RequestMethod.POST)
	protected ModelAndView updatingBannerText(@ModelAttribute("bannerText")
														AdminServicesGetNewBannerText bannerText){
		ModelAndView model = new ModelAndView("adminPage");													
		services.updateBannerText(bannerText);
		model.addObject("c_details", webControllerServices.getCompanyDetails());
		model.addObject("clothList", getClothList());
		return model;
		
	}
	
	@RequestMapping(value="updateMinimumOrderCost", method = RequestMethod.POST)
	protected ModelAndView updatingBannerText(@ModelAttribute("minimumOrderCost")
														AdminServicesMinimumOrderCost minimumOrderCost){
		ModelAndView model = new ModelAndView("adminPage");													
		services.updateMinimumOrderCost(minimumOrderCost);
		model.addObject("c_details", webControllerServices.getCompanyDetails());
		model.addObject("clothList", getClothList());
		return model;
		
	}


	
		public List<ItemPrices> getClothList(){
		List<ItemPrices> clothList = new ArrayList<>();
		cloth_list = ctx.getBean(orderDetailsDAOImpl.class);
		clothList = cloth_list.getItemPrices();
		
		return clothList;
	}

		@RequestMapping(value="/testForm", method= RequestMethod.GET)
		protected ModelAndView getForm(){
			ModelAndView model = new ModelAndView("testFile");
			
			
			
			return model;
			
		}
		

	    @RequestMapping("/value")
	    public String index(
	            ModelMap map, 
	            HttpSession session, 
	            HttpServletRequest request, 
	            @RequestParam(value="f", required=false) String flush,
	            @RequestParam(value="message", required=false) String message ) {
	        
	        if( flush != null )
	            session.setAttribute("personListContainer", getDummyPersonListContainer());
	        if( session.getAttribute("personListContainer") == null )
	            session.setAttribute("personListContainer", getDummyPersonListContainer());
	        map.addAttribute("personListContainer", (PersonListContainer)session.getAttribute("personListContainer"));
	        if( message != null )
	            map.addAttribute("message", message);
	        map.addAttribute("cp", request.getContextPath());
	        
	        return "index";
	    }
	    
	    @RequestMapping(value="/editpersonlistcontainer", method= RequestMethod.POST)
	    public String editpersonListContainer(@ModelAttribute PersonListContainer personListContainer, HttpSession session) {
	        for( Person p : personListContainer.getPersonList() ) {
	            //System.out.println("Name: " + p.getName());
	            //System.out.println("Age: " + p.getAge());
	        }
	        session.setAttribute("personListContainer",personListContainer);
	        return "redirect:/?message=Form Submitted Ok. Number of rows is: ["+personListContainer.getPersonList().size()+"]";
	    }
	    
	    private PersonListContainer getDummyPersonListContainer() {
	        List<Person> personList = new ArrayList<Person>();
	        for( int i=0; i<5; i++ ) {
	            personList.add( new Person("Person Name [" + i + "]", String.valueOf(i)) );
	        }
	        return new PersonListContainer(personList);
	    }
		
		
}
