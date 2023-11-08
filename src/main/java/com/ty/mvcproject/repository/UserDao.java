package com.ty.mvcproject.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.ty.mvcproject.pojo.User;




@Component
public class UserDao {

	private static EntityManagerFactory factory=Persistence.createEntityManagerFactory("springmvc");
	private static EntityManager manager=factory.createEntityManager();
	private static EntityTransaction transaction=manager.getTransaction();
	
	public User saveUser(User user)
	{
		transaction.begin();
		manager.persist(user);
		transaction.commit();
		return user;
	}
	public User updateUser(User user)
	{
		transaction.begin();
		manager.merge(user);
		transaction.commit();
		return user;
	}
//	public List<User> allUsers()
//	{
//		String jpql="from User";
//		Query query=manager.createQuery(jpql);
//		List<User> users=query.getResultList();
//		if(users!=null && users.size()>0)
//		{
//			return users;
//		}
//		return null;
//	}
	public User getById(int id)
	{
		String jpql="from User where id=:id";
		Query query=manager.createQuery(jpql);
		query.setParameter("id", id);
		List<User> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			return users.get(0);
		}
		return null;
	}
	public User getByEmailPass(String email,String password)
	{
		String jpql="select u from User u where u.email=:email and u.password=:password";
		Query query=manager.createQuery(jpql);
		query.setParameter("email", email);
		query.setParameter("password", password);
		List<User> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			return users.get(0);
		}
		return null;
	}
	public List<User> findByRole(String role)
	{
		String jpql="select u from User u where u.role=:role";
		Query query=manager.createQuery(jpql);
		query.setParameter("role", role);
		
		List<User> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			return users;
		}
		return null;
	}
	public List<User> findByStatus(boolean status)
	{
		String jpql="select u from User u where u.status=:status";
		Query query=manager.createQuery(jpql);
		query.setParameter("status", status);		
		List<User> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			return users;
		}
		return null;
	}
	public List<User> allTrainers() {
		String jpql="select u from User u where u.role=:role";
		Query query=manager.createQuery(jpql);
		query.setParameter("role", "Trainer");		
		List<User> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			return users;
		}
		return null;
	}
	
}
