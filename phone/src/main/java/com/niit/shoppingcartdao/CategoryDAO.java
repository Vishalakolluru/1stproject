package com.niit.shoppingcartdao;

import java.util.List;

import com.niit.shoppingcartversionmodel.Category;


public interface CategoryDAO{
	 public List<Category> list1();
	 public Category get(int id);
	 public void saveOrUpdate(Category category);
	 public void delete1(int id);
	 public int deleteCategory(int id);
	public List getAllCategories();
	public Category getSingleCategory(int id);

	public void save(Category category);
	
	


}




