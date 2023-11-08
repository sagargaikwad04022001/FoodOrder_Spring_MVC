package com.ty.mvcproject.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.ty.mvcproject.pojo.Batch;
import com.ty.mvcproject.pojo.User;
@Component
public class BatchDao {

	private static EntityManagerFactory factory=Persistence.createEntityManagerFactory("springmvc");
	private static EntityManager manager=factory.createEntityManager();
	private static EntityTransaction transaction=manager.getTransaction();
	UserDao userDao=new UserDao();
	public Batch saveBatch(Batch batch,int uid)
	{
		
		transaction.begin();
		manager.persist(batch);
		transaction.commit();
		return batch;
		
	}
	public Batch updateBatch(Batch user)
	{
		transaction.begin();
		manager.merge(user);
		transaction.commit();
		return user;
	}
	public List<Batch> allBatches()
	{
		String jpql="from Batch";
		Query query=manager.createQuery(jpql);
		List<Batch> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			return users;
		}
		return null;
	}
	public Batch getById(int id)
	{
		String jpql="from Batch where id=:id";
		Query query=manager.createQuery(jpql);
		query.setParameter("id", id);
		List<Batch> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			return users.get(0);
		}
		return null;
	}

	public List<Batch> findBatchesByUserId(int uid)
	{
		User user=userDao.getById(uid);
		if(user!=null)
		{
		List<Batch> batches=user.getBatches();
		return batches;
		}
		return null;		
	}
}
