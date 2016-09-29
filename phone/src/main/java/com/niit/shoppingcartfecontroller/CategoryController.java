package com.niit.shoppingcartfecontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.shoppingcartdao.CategoryDAO;
import com.niit.shoppingcartversionmodel.Category;
import com.niit.shoppingcartversionmodel.Supplier;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO cd;
	
	@RequestMapping("addcategory")
	public ModelAndView display8() {
		ModelAndView m6 = new ModelAndView("addcategory");
		return m6;
	}

	@ModelAttribute("Category")
	public Category addcategory() {
		return new Category();
	}

	@RequestMapping("/storecategory")
	public String addcategorys(HttpServletRequest request, @Valid @ModelAttribute("Category") Category category,@ModelAttribute("Supplier") Supplier supplier,
			BindingResult result) {
		System.out.println("hello niit...........................");
		if (result.hasErrors()) {
			return "addcategory";
		}
		System.out.println(category.getId());
		System.out.println(category.getName());

		System.out.println(category.getDescription());
		
		
		cd.saveOrUpdate(category);
		// return "ViewAll";
		return "addcategory";
	}
	//retrieve C
	@RequestMapping("retriveC")
	public ModelAndView retriveCRecords()
	{  
		ModelAndView m7=new ModelAndView("retriveC");
		return m7;
	} 


	
	 @RequestMapping(value="/list1",method=RequestMethod.GET,produces="application/json")
	    public @ResponseBody String showList1(){
	    	List blist=cd.getAllCategories();
	    	Gson x=new Gson();
	    	String json=x.toJson(blist);
	    	return json;
	    }
		 @RequestMapping("delete1")
		    public ModelAndView deleteCategory(@RequestParam int id)
		    {
			 System.out.println("hello welcome to niit");
			    cd.deleteCategory(id);
		    	ModelAndView model=new ModelAndView("retriveC");
		    	return model;
		    }
		 @RequestMapping("viewCat")
			public ModelAndView display11() {
				ModelAndView m6 = new ModelAndView("viewCat");
				return m6;

			}
		 @RequestMapping(value="viewCat",method=RequestMethod.GET)
		    public ModelAndView viewCat(@RequestParam int id, @ModelAttribute Category categories){
			 Category category=cd.getSingleCategory(id);
		    	return new ModelAndView("viewCat","category",category);
		    	//return new ModelAndView("ViewPro");
		    }
		 
		 @RequestMapping("EditCat")
			public ModelAndView display12() {
				ModelAndView m6 = new ModelAndView("EditCat");
				return m6;

			}
		 
	 @RequestMapping(value="EditCat",method=RequestMethod.GET)
		    public ModelAndView EditCat(@RequestParam int id){
			 System.out.println("hello niit.........................niit1............");	
			 Category category=cd.getSingleCategory(id);
			 System.out.println("hello niit.........................niit2............");
			 System.out.println("eeee "+category.getName());
		    	return new ModelAndView("EditCat","category",category);
		    }

		 @RequestMapping(value="/update1",method=RequestMethod.POST)
		    public ModelAndView updateCategory(HttpServletRequest request,@Valid @ModelAttribute("category")Category category,BindingResult result)
		    {	        
		    	cd.save(category);
		    	return new ModelAndView("retriveC");
		    }	 
		 

}
