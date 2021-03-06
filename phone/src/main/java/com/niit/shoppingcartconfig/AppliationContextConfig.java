package com.niit.shoppingcartconfig;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.shoppingcartversionmodel.Category;
import com.niit.shoppingcartversionmodel.Login;
import com.niit.shoppingcartversionmodel.Product;
import com.niit.shoppingcartversionmodel.Register;
import com.niit.shoppingcartversionmodel.Supplier;

@Configuration
@ComponentScan("com.niit")
@EnableTransactionManagement
public class AppliationContextConfig {
	@Bean(name = "dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/phone");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		return dataSource;

	}

	private Properties getHibernateproperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		return properties;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder SessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		SessionBuilder.addProperties(getHibernateproperties());
		SessionBuilder.addAnnotatedClass(Category.class);
		SessionBuilder.addAnnotatedClass(Supplier.class);
		SessionBuilder.addAnnotatedClass(Product.class);
		SessionBuilder.addAnnotatedClass(Login.class);
		SessionBuilder.addAnnotatedClass(Register.class);

		return SessionBuilder.buildSessionFactory();

	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
	

}
