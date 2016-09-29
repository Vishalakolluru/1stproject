package com.niit.shoppingcartfecontroller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.shoppingcartdao.CategoryDAO;
import com.niit.shoppingcartdao.ProductDAO;
import com.niit.shoppingcartdao.RegisterDAO;
import com.niit.shoppingcartdao.SupplierDAO;
import com.niit.shoppingcartdao.LoginDAO;
import com.niit.shoppingcartversionmodel.Category;
import com.niit.shoppingcartversionmodel.Login;
import com.niit.shoppingcartversionmodel.Product;
import com.niit.shoppingcartversionmodel.Register;
import com.niit.shoppingcartversionmodel.Supplier;

@Controller
public class HomeController {

	
	
	@Autowired
	LoginDAO us;
	
	@Autowired
	RegisterDAO rd;

	@RequestMapping("/")
	public ModelAndView display() {
		ModelAndView m1 = new ModelAndView("home");
		return m1;
	}

	@RequestMapping("login")
	public ModelAndView display1() {
		ModelAndView m2 = new ModelAndView("login");
		return m2;
	}

	@RequestMapping("register")
	public ModelAndView display2() {
		ModelAndView m3 = new ModelAndView("register");
		return m3;
	}

	

	@RequestMapping("home")
	public ModelAndView display4() {
		ModelAndView m5 = new ModelAndView("home");
		return m5;

	}

	

	@ModelAttribute("Register")
	public Register createuser() {
		return new Register();
	}

	@RequestMapping(value = "storeuser", method = RequestMethod.POST)
	public String addUser(@Valid @ModelAttribute("Login") Login login,@Valid @ModelAttribute("Register") Register register, BindingResult result)
			 {

		if (result.hasErrors()) {

			return "register";
		}
	
		System.out.println("hello storeUser");
		System.out.println(register.getName() + "hello @@@@@@");
		rd.saveOrUpdate(register);
		login.setId(register.getId());
		login.setStatus(register.getStatus());
		
		us.save(login);
		return "home";
	}
	

	
	

		
				 //add category
				// Adding category
					

						 
						 @RequestMapping("admin")
							public ModelAndView display18() {
								ModelAndView m6 = new ModelAndView("admin");
								return m6;
							}
						 
				
						 @RequestMapping(value = "/fail2login", method = RequestMethod.GET)
							public ModelAndView loginerror(ModelMap model) {
								System.out.println("hello Rajesh...........................................");

								return new ModelAndView("login", "error", true);

							}


 				
							@RequestMapping(value = "/welcome", method = RequestMethod.GET)
							public ModelAndView checkUserOne(HttpServletRequest request, HttpServletResponse response, HttpSession session)
									throws Exception {
								System.out.println("hi");
								if (request.isUserInRole("ROLE_ADMIN")) {
									Authentication auth = SecurityContextHolder.getContext().getAuthentication();
									String str = auth.getName(); // get logged in username
									session = request.getSession(true);
									session.setAttribute("loggedInUser", str);

									// session.invalidate();
									ModelAndView m1 = new ModelAndView("admin");
									return m1;
								}
								else
								{
									ModelAndView m2 = new ModelAndView("home");
									return m2;
								}
								
							}
							
							
							
			//edit user
							@RequestMapping("/EditUser")
							public String edituser()
							{
								return "EditUser";		
						}
							
							
							@ModelAttribute("Register")
							public Register addUser() 
							{
								return new Register();
								
							}
							@RequestMapping("retrieveUser")
							public ModelAndView display19() {
								ModelAndView m6 = new ModelAndView("retrieveUser");
								return m6;
							}
				
							
							
							@RequestMapping(value="/updateUser",method=RequestMethod.POST)
							public ModelAndView updateuser(HttpServletRequest request, @Valid @ModelAttribute("Login")Login login)
							{
								us.Update(login);
								
								return new ModelAndView("EditUser");
							}
							 
							
							
							@RequestMapping(value="/list3",method=RequestMethod.GET,produces="application/json")
						    public @ResponseBody String showList3(){
						    	List blist=us.getAllUsers();
						    	Gson u=new Gson();
						    	String json=u.toJson(blist);
						    	return json;
						    }
							
							@RequestMapping(value="EditUser", method=RequestMethod.GET)
							public ModelAndView edituser(@RequestParam int id){
							 System.out.println("hello .........................vishnu............");	
							 Login u1=us.get(id);
							 System.out.println("hello.........................reddy............");
							 
								return new ModelAndView("EditUser","Login",u1);
							}
							
						
						
							 @RequestMapping("deleteuser")
							    public ModelAndView deleteUser(@RequestParam int id)
							    {
								 System.out.println("hello welcome to s");
								    us.delete(id);
							    	ModelAndView model=new ModelAndView("retrieveUser");
							    	return model;
							    }	
							
							 @RequestMapping("logoutsuccess")
								public ModelAndView logoutpage(){
									ModelAndView mv9 = new ModelAndView("logoutsuccess");
									return mv9;
								}

								@RequestMapping(value = "/Logout", method = RequestMethod.GET)
								public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
										throws ServletException, IOException {
									HttpSession newsession = request.getSession(false);
									if (newsession != null) 
								    {
								         newsession.invalidate();

								    }
									response.sendRedirect("j_spring_security_logout");	
									}

							
							
							
}
						 
			
	

