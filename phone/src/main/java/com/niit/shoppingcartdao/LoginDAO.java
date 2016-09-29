package com.niit.shoppingcartdao;

import java.util.List;

import com.niit.shoppingcartversionmodel.Login;

public interface LoginDAO{
	 
	 
	 public List<Login> list();

		public Login get(int id);

		//public void saveOrUpdate(User user);
		
		public void save(Login login);
		public void Update(Login login);

		public void delete(int id);
		public List getAllUsers();
		 public int deleteUser(int id);
		public boolean isValidUser(int id, String name);

	 
}



