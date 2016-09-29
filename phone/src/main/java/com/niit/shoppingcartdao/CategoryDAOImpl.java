package com.niit.shoppingcartdao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shoppingcartversionmodel.Category;



@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO  {

	public List<Category> list1() {
		//@SuppressWarnings("unchecked")
				//List<Category> listCategory =(List<Category>)
				//sessionFactory.getCurrentSession().createCriteria(Category.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
				
				//return listCategory;
			Session session=sessionFactory.openSession();
			List<Category> list1=session.createQuery("from Category").list();
			session.close();
			return list1;
		
	
	}
	@Autowired

	private SessionFactory sessionFactory;

	public CategoryDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	
	}
@Transactional
	public Category get(int id) {
		// TODO Auto-generated method stub
		// sessionFactory.getCurrentSession().get(Category.class,id);
				String hql = "from Category where categoryId=" + "'" + id + "'";
				Query query = sessionFactory.getCurrentSession().createQuery(hql);
				@SuppressWarnings("unchecked")
				List<Category> listCategory = query.list();
				if (listCategory != null && !listCategory.isEmpty()) {
					return listCategory.get(0);
				}
				return null;
	}
	
@Transactional
	public void saveOrUpdate(Category category) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(category);

		
	}
@Transactional
	public void delete1(int Id) {
		// TODO Auto-generated method stub
		Category CategoryToDelete = new Category();
		CategoryToDelete.setId(Id);
		sessionFactory.getCurrentSession().delete(CategoryToDelete);
		
	}
@Transactional
	public List<Category> listCategory() {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Category> listCategory = sessionFactory.getCurrentSession().createCriteria(Category.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCategory;
		
	}
@Transactional


public List getAllCategories() {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	List list=session.createQuery("from Category").list();
	session.close();
	return list;
	}



@Transactional
public int deleteCategory(int id) {
	Session session=sessionFactory.openSession();
	org.hibernate.Transaction tx=session.beginTransaction();
	Category category=(Category)session.load(Category.class, id);
	session.delete(category);
	tx.commit();
	
	session.close();
	return id;
		
}
@Transactional
public Category getSingleCategory(int id) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	Category category=(Category)session.load(Category.class, id);
	return category;
	}
@Transactional
public void save(Category category) {
	// TODO Auto-generated method stub
	sessionFactory.getCurrentSession().save(category);
	
}
}

	



	
		

