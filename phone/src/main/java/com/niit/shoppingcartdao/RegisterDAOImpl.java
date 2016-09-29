package com.niit.shoppingcartdao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shoppingcartversionmodel.Register;

@Repository("registerDAO")
public class RegisterDAOImpl implements RegisterDAO {
	public List<Register> list() {
		// TODO Auto-generated method stub
		return null;
	}
	
      
	@Autowired
	private SessionFactory sessionFactory;

	public RegisterDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Register user) {
		// TODO Auto-generated method stub
		
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		
	}
	@Transactional
	public void delete(int id) {
		// TODO Auto-generated method stub
		Register UserToDelete = new Register();
		UserToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(UserToDelete);
		
	}
	@Transactional
	public List<Register> listUser() {
		@SuppressWarnings("unchecked")
		List<Register> listUser = (List<Register>) sessionFactory.getCurrentSession().createCriteria(Register.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}
	
	
	
@Transactional
	public Register get(int id) {
		String hql = "from User where id=" + "'" + id + "'";
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Register> listUser =query.list();

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


}
