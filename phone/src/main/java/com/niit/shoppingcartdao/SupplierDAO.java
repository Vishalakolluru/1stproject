package com.niit.shoppingcartdao;

import java.util.List;

import com.niit.shoppingcartversionmodel.Supplier;



public interface SupplierDAO {
	public List<Supplier> list();
	public Supplier get(int id);
	public void saveorUpdate(Supplier supplier);
	public void delete(int id);
	public List getAllSuppliers();

}
