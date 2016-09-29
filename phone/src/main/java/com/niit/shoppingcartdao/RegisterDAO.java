package com.niit.shoppingcartdao;

import java.util.List;

import com.niit.shoppingcartversionmodel.Login;
import com.niit.shoppingcartversionmodel.Register;

public interface RegisterDAO{
	 
	 
	 public List<Register> list();

		public Register get(int id);

		//public void saveOrUpdate(User user);
		
		public void saveOrUpdate(Register register);

		public void delete(int id);
		
		public boolean isValidUser(int id, String name);

	 
}



