package com.niit.shoppingcartdao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shoppingcartversionmodel.Login;


@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO {
	public List<Login> list() {
		// TODO Auto-generated method stub
		return null;
	}
	
      
	@Autowired
	private SessionFactory sessionFactory;

	public LoginDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void save(Login user) {
		// TODO Auto-generated method stub
		
		sessionFactory.getCurrentSession().save(user);
		
	}
	@Transactional

	public List getAllUsers() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		List list=session.createQuery("from Login").list();
		session.close();
		return list;
		}

	@Transactional
	public void Update(Login user) {
		// TODO Auto-generated method stub
		
		sessionFactory.getCurrentSession().update(user);
		
	}
	@Transactional
	public void delete(int id) {
		// TODO Auto-generated method stub
		Login UserToDelete = new Login();
		UserToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(UserToDelete);
		
	}
	@Transactional
	public List<Login> listUser() {
		@SuppressWarnings("unchecked")
		List<Login> listUser = (List<Login>) sessionFactory.getCurrentSession().createCriteria(Login.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}
	
	
	
@Transactional
	public Login get(int id) {
		String hql = "from Login where loginid=" + "'" + id + "'";
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Login> listUser =query.list();

		if (listUser != null && !listUser.isEmpty()) {
			return listUser.get(0);
		}
	
		// TODO Auto-generated method stub
		return null;
	}

public boolean isValidUser(int id, String name) {
	// TODO Auto-generated method stub
	return false;
}

@Transactional
public int deleteUser(int id) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.openSession();
	org.hibernate.Transaction tx=session.beginTransaction();
	Login login=(Login)session.load(Login.class, id);
	session.delete(login);
	tx.commit();
	
	session.close();
	return id;
		
}


}
