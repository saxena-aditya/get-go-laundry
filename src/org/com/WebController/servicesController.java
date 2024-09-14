package org.com.WebController;

import com.google.gson.Gson;
import com.org.testClasses.Person;
import com.org.testClasses.PersonListContainer;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.com.DAOImpl.AdminServicesDAOImpl;
import org.com.DAOImpl.CompanyDetailsDAOImpl;
import org.com.DAOImpl.OrderDetailDAOImpl;
import org.com.DTO.AdminServicesGetCompanyDetails;
import org.com.DTO.AdminServicesGetNewBannerText;
import org.com.DTO.AdminServicesGetNewPerItemCosts;
import org.com.DTO.AdminServicesMinimumOrderCost;
import org.com.DTO.AdminServicesOffOffer;
import org.com.DTO.ItemPrices.ItemPrices;
import org.com.DTO.TypeOrderDetails;
import org.com.DTO.TypeUserDetails;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServicesController {

  public WebController webControllerServices = new WebController();
  ApplicationContext ctx = new ClassPathXmlApplicationContext("Spring.xml");
  public AdminServicesDAOImpl services = ctx.getBean(
    AdminServicesDAOImpl.class
  );
  public UtilityFuctions utils = new UtilityFuctions();
  public CompanyDetailsDAOImpl companyInfo;
  public OrderDetailDAOImpl cloth_list;

  @RequestMapping(value = "queryByOrderID", method = RequestMethod.POST)
  protected ModelAndView queryByOrderID(@RequestParam String order_id) {
    ModelAndView model = new ModelAndView("OrderView");
    List<TypeOrderDetails> order_details = services.getOrderDetails(order_id);

    if (order_details.size() == 0) {
      return new ModelAndView("noOrderFound").addObject("order_id", order_id);
    } else {
      TypeUserDetails user_details = services.getUserDetails(
        order_details.get(0).getUser()
      );

      model
        .addObject("order_details", order_details)
        .addObject("user_details", user_details)
        .addObject("order_id", order_id);

      return model;
    }
  }

  @RequestMapping(value = "queryByOrderStage", method = RequestMethod.POST)
  protected ModelAndView queryByOrderStage(@RequestParam String order_stage) {
    ModelAndView model = new ModelAndView("ordersByStage");
    List<TypeOrderDetails> order_by_stage = services.getOdersByStageDistinct(
      order_stage
    );
    model
      .addObject("order_by_stage", order_by_stage)
      .addObject("stage", order_stage);

    return model;
  }

  @RequestMapping(value = "Sudo-I-am-admin", method = RequestMethod.GET)
  protected ModelAndView adminPage() {
    ModelAndView model = new ModelAndView("adminPage");
    companyInfo = ctx.getBean(CompanyDetailsDAOImpl.class);
    model.addObject("c_details", webControllerServices.getCompanyDetails());
    model
      .addObject("clothList", utils.getClothList())
      .addObject("all_users", utils.getTotalUsers())
      .addObject("all_orders", utils.getTotalOrderCount())
      .addObject("processing_orders", utils.getTotalOrderInProcess())
      .addObject("done_orders", utils.getTotalOrderDone())
      .addObject("total_served_order_cost", utils.getTotalBuisenessDone())
      .addObject("processing_order_cost", utils.getTotalOrderCostInProcess());

    return model;
  }

  @RequestMapping(value = "changeCompanyDetails", method = RequestMethod.POST)
  protected ModelAndView updatingCompanyDetails(
    @ModelAttribute(
      "companyDetails"
    ) AdminServicesGetCompanyDetails companyDetails
  ) {
    ModelAndView model = new ModelAndView("adminPage");
    services.updateCompanyDetails(companyDetails);
    model.addObject("c_details", webControllerServices.getCompanyDetails());
    model
      .addObject("clothList", utils.getClothList())
      .addObject("all_users", utils.getTotalUsers())
      .addObject("all_orders", utils.getTotalOrderCount())
      .addObject("processing_orders", utils.getTotalOrderInProcess())
      .addObject("done_orders", utils.getTotalOrderDone())
      .addObject("total_served_order_cost", utils.getTotalBuisenessDone())
      .addObject("processing_order_cost", utils.getTotalOrderCostInProcess());

    return model;
  }

  @RequestMapping(value = "updatePerItemCosts", method = RequestMethod.POST)
  protected ModelAndView updatingPerIemCosts(
    @ModelAttribute("perItemCosts") AdminServicesGetNewPerItemCosts perItemCosts
  ) {
    ModelAndView model = new ModelAndView("adminPage");
    services.updatePerItemCost(perItemCosts);

    model.addObject("c_details", webControllerServices.getCompanyDetails());
    model
      .addObject("clothList", utils.getClothList())
      .addObject("all_users", utils.getTotalUsers())
      .addObject("all_orders", utils.getTotalOrderCount())
      .addObject("processing_orders", utils.getTotalOrderInProcess())
      .addObject("done_orders", utils.getTotalOrderDone())
      .addObject("total_served_order_cost", utils.getTotalBuisenessDone())
      .addObject("processing_order_cost", utils.getTotalOrderCostInProcess());
    return model;
  }

  @RequestMapping(value = "updateOff-Offer", method = RequestMethod.POST)
  protected ModelAndView updatingOffOffer(
    @ModelAttribute("offPercentage") AdminServicesOffOffer offPercentage
  ) {
    ModelAndView model = new ModelAndView("adminPage");
    services.updateOffPercentage(offPercentage);
    model.addObject("c_details", webControllerServices.getCompanyDetails());
    model
      .addObject("clothList", utils.getClothList())
      .addObject("all_users", utils.getTotalUsers())
      .addObject("all_orders", utils.getTotalOrderCount())
      .addObject("processing_orders", utils.getTotalOrderInProcess())
      .addObject("done_orders", utils.getTotalOrderDone())
      .addObject("total_served_order_cost", utils.getTotalBuisenessDone())
      .addObject("processing_order_cost", utils.getTotalOrderCostInProcess());
    return model;
  }

  @RequestMapping(value = "updateBannerText", method = RequestMethod.POST)
  protected ModelAndView updatingBannerText(
    @ModelAttribute("bannerText") AdminServicesGetNewBannerText bannerText
  ) {
    ModelAndView model = new ModelAndView("adminPage");
    services.updateBannerText(bannerText);
    model.addObject("c_details", webControllerServices.getCompanyDetails());
    model
      .addObject("clothList", utils.getClothList())
      .addObject("all_users", utils.getTotalUsers())
      .addObject("all_orders", utils.getTotalOrderCount())
      .addObject("processing_orders", utils.getTotalOrderInProcess())
      .addObject("done_orders", utils.getTotalOrderDone())
      .addObject("total_served_order_cost", utils.getTotalBuisenessDone())
      .addObject("processing_order_cost", utils.getTotalOrderCostInProcess());
    return model;
  }

  @RequestMapping(value = "updateMinimumOrderCost", method = RequestMethod.POST)
  protected ModelAndView updatingBannerText(
    @ModelAttribute(
      "minimumOrderCost"
    ) AdminServicesMinimumOrderCost minimumOrderCost
  ) {
    ModelAndView model = new ModelAndView("adminPage");
    services.updateMinimumOrderCost(minimumOrderCost);
    model.addObject("c_details", webControllerServices.getCompanyDetails());
    model
      .addObject("clothList", utils.getClothList())
      .addObject("all_users", utils.getTotalUsers())
      .addObject("all_orders", utils.getTotalOrderCount())
      .addObject("processing_orders", utils.getTotalOrderInProcess())
      .addObject("done_orders", utils.getTotalOrderDone())
      .addObject("total_served_order_cost", utils.getTotalBuisenessDone())
      .addObject("processing_order_cost", utils.getTotalOrderCostInProcess());
    return model;
  }

  @RequestMapping(value = "/testForm", method = RequestMethod.GET)
  protected ModelAndView getForm() {
    ModelAndView model = new ModelAndView("testFile");
    model
      .addObject("clothList", utils.getClothList())
      .addObject("jsonList", new Gson().toJson(utils.getClothList()));

    return model;
  }

  @RequestMapping("/value")
  public ModelAndView index(
    HttpSession session,
    HttpServletRequest request,
    @RequestParam(value = "f", required = false) String flush,
    @RequestParam(value = "message", required = false) String message
  ) {
    ModelAndView modal = new ModelAndView("index");

    modal.addObject("personListContainer", getDummyPersonListContainer());
    if (message != null) modal.addObject("message", message);

    return modal;
  }

  @RequestMapping(
    value = "/editpersonlistcontainer",
    method = RequestMethod.POST
  )
  public ModelAndView editpersonListContainer(
    @ModelAttribute PersonListContainer personListContainer,
    HttpSession session
  ) {
    for (Person p : personListContainer.getPersonList()) {
      System.out.println("Name: " + p.getName());
      System.out.println("Age: " + p.getAge());
    }
    session.setAttribute("personListContainer", personListContainer);
    return new ModelAndView("index").addObject(
      "personListContainer",
      getDummyPersonListContainer()
    );
  }

  private PersonListContainer getDummyPersonListContainer() {
    List<Person> personList = new ArrayList<Person>();
    for (int i = 0; i < 5; i++) {
      personList.add(new Person("Person Name [" + i + "]", String.valueOf(i)));
    }
    return new PersonListContainer(personList);
  }
}
