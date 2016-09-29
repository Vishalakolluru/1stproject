package com.niit.shoppingcartfecontroller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.shoppingcartdao.ProductDAO;
import com.niit.shoppingcartdao.SupplierDAO;
import com.niit.shoppingcartversionmodel.Product;
import com.niit.shoppingcartversionmodel.Supplier;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pd;
	@Autowired
	SupplierDAO sd;
	
	@RequestMapping("retrive")
	public ModelAndView retriveRecords()
	{  
		ModelAndView m7=new ModelAndView("retrive");
		return m7;
	} 

	@ModelAttribute("Product")
	public Product addproduct() {
		return new Product();
	}
	@RequestMapping("addproduct")
	public ModelAndView display91() {

		ModelAndView mv3 = new ModelAndView("addproduct");
		mv3.addObject("supplier", new Supplier());
        List suppliers= sd.getAllSuppliers();
        mv3.addObject("suppliers", suppliers);
        return mv3;
	}

	@RequestMapping("/storecar")
	public String addproduct(HttpServletRequest request, @Valid @ModelAttribute("product") Product product,
			BindingResult result) {
		System.out.println("hello niit...........................");
		if (result.hasErrors()) {
			return "retrive";
		}
		String filename = product.getImg().getOriginalFilename();
		product.setImage(filename);

		try {
			byte[] bytes = new byte[product.getImg().getInputStream().available()];
			product.getImg().getInputStream().read(bytes);
			BufferedInputStream buffer = new BufferedInputStream(product.getImg().getInputStream());
			MultipartFile file = product.getImg();
			String path = request.getServletPath() + "/resources/images";
			File rootPath = new File(path);
			if (!rootPath.exists())
				rootPath.mkdirs();
			File store = new File(rootPath.getAbsolutePath() + "/" + filename);
	 		System.out.println("Image path :" + path);
			OutputStream os = new FileOutputStream(store);
			os.write(bytes);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		pd.saveOrUpdate(product);
		return "retrive";
	}
	 @RequestMapping(value="/list",method=RequestMethod.GET,produces="application/json")
	    public @ResponseBody String  showList(){
	    	List blist=pd.getAllProducts();
	    	Gson x=new Gson();
	    	String json=x.toJson(blist);
	    	return json;
	    }
		 @RequestMapping("delete")
		    public ModelAndView deleteProduct(@RequestParam int id)
		    {
			 System.out.println("hello welcome to niit");
			    pd.deleteProduct(id);
		    	ModelAndView model=new ModelAndView("retrive");
		    	return model;
		    }
		 @RequestMapping("viewPro")
			public ModelAndView display10() {
				ModelAndView m6 = new ModelAndView("viewPro");
				return m6;

			}
		 @RequestMapping(value="viewPro",method=RequestMethod.GET)
		    public ModelAndView viewPro(@RequestParam int id, @ModelAttribute Product products){
		    	Product product=pd.getSingleProduct(id);
		    	return new ModelAndView("viewPro","product",product);
		    	//return new ModelAndView("ViewPro");
		    }
		 @RequestMapping("editPro")
			public ModelAndView display15() {
				ModelAndView m6 = new ModelAndView("editPro");
				return m6;

			}		
		 
		 @RequestMapping(value="editPro",method=RequestMethod.GET)
		    public ModelAndView editPro(@RequestParam int id){
			 System.out.println("hello niit.........................niit1............");	
			 Product product1=pd.getSingleProduct(id);
			 System.out.println("hello niit.........................niit2............");
			 System.out.println("eeee "+product1.getName());
		    	return new ModelAndView("editPro","product",product1);
		    }
		 
		 @RequestMapping(value="/update",method=RequestMethod.POST)
		    public ModelAndView updateProduct(HttpServletRequest request,@Valid @ModelAttribute("product")Product product,BindingResult result)
		    {
		    	
		    	String filename=product.getImg().getOriginalFilename();
		    	
		    	product.setImage(filename);
	        	
		    	try{
	        		byte[] bytes=new byte[product.getImg().getInputStream().available()];
	        		product.getImg().getInputStream().read(bytes);
	        		BufferedInputStream buffer=new BufferedInputStream(product.getImg().getInputStream());
	        		MultipartFile file=product.getImg();
	        		String path=request.getServletPath()+"/resources/images";
	        		File rootPath=new File(path);
	        		if(!rootPath.exists())
	        			rootPath.mkdirs();
	        		File store=new File(rootPath.getAbsolutePath()+"/"+filename);
	        		System.out.println("Image path :"+path);
	        		OutputStream os=new FileOutputStream(store);
	        		os.write(bytes);
	        	}
	        	catch(Exception e){
	        		System.out.println(e.getMessage());
	        	}
	        		        
		    	pd.saveOrUpdate(product);
		    	return new ModelAndView("retrive");
		    }	 
		 

}
