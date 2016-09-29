package com.niit.shoppingcartdao;

import java.util.List;

import com.niit.shoppingcartversionmodel.Category;
import com.niit.shoppingcartversionmodel.Product;

public interface ProductDAO{
	 public List<Product> list();
	 public Product get(int id);
	 public void saveOrUpdate(Product product);
	 public void delete(int id);
	 public int deleteProduct(int id);
	public List getAllProducts();
	public Product getSingleProduct(int id);
	public int updateProduct(Product product);
	
	


}




