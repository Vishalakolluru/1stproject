package com.niit.shoppingcartdao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shoppingcartversionmodel.Product;



@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO  {

	public List<Product> list() {
		//@SuppressWarnings("unchecked")
				//List<Product> listProduct =(List<Product>)
				//sessionFactory.getCurrentSession().createCriteria(Product.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
				
				//return listProduct;
			Session session=sessionFactory.openSession();
			List<Product> list=session.createQuery("from Product").list();
			session.close();
			return list;
		   
	
	}
	@Autowired

	private SessionFactory sessionFactory;

	public ProductDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	
	}
@Transactional
	public Product get(int id) {
		// TODO Auto-generated method stub
		// sessionFactory.getCurrentSession().get(Product.class,id);
				String hql = "from Product where productId=" + "'" + id + "'";
				Query query = sessionFactory.getCurrentSession().createQuery(hql);
				@SuppressWarnings("unchecked")
				List<Product> listProduct = query.list();
				if (listProduct != null && !listProduct.isEmpty()) {
					return listProduct.get(0);
				}
				return null;
	}
	
@Transactional
	public void saveOrUpdate(Product product) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(product);

		
	}
@Transactional
	public void delete(int Id) {
		// TODO Auto-generated method stub
		Product ProductToDelete = new Product();
		ProductToDelete.setId(Id);
		sessionFactory.getCurrentSession().delete(ProductToDelete);
		
	}
@Transactional
	public List<Product> listProduct() {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Product> listProduct = sessionFactory.getCurrentSession().createCriteria(Product.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProduct;
		
	}
@Transactional

public List getAllProducts() {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	List list=session.createQuery("from Product").list();
	session.close();
	return list;
	}



@Transactional
public int deleteProduct(int id) {
	Session session=sessionFactory.openSession();
	org.hibernate.Transaction tx=session.beginTransaction();
	Product product=(Product)session.load(Product.class, id);
	session.delete(product);
	tx.commit();
	
	session.close();
	return id;
		
}
@Transactional
public Product getSingleProduct(int id) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	Product product=(Product)session.load(Product.class, id);
	return product;
	}
@Transactional
public int updateProduct(Product product) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	System.out.println("hello");
	org.hibernate.Transaction tx=session.beginTransaction();
	System.out.println("hai");
	System.out.println(product.getId());
	System.out.println(product.getName());
	System.out.println(product.getPrice());
	session.update(product);
	//seion.flush();
	System.out.println("bi,,,,,,,,,,,,,,,,,,,,");
	//session.close();
	tx.commit();
	return 0;
	}

	
	
}

	



	
		

