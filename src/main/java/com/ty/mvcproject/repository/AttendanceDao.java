package com.ty.mvcproject.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.ty.mvcproject.pojo.Attendance;
import com.ty.mvcproject.pojo.Batch;
@Component
public class AttendanceDao {

	private static EntityManagerFactory factory=Persistence.createEntityManagerFactory("springmvc");
	private static EntityManager manager=factory.createEntityManager();
	private static EntityTransaction transaction=manager.getTransaction();
	BatchDao batchDao=new BatchDao();
	
	public Attendance saveAttendance(Attendance user,int bid)
	{
		Batch batch=batchDao.getById(bid);
		
		transaction.begin();
		manager.persist(user);
		transaction.commit();
		return user;
		
	}

//	public List<Attendance> allAttendance()
//	{
//		String jpql="from User";
//		Query query=manager.createQuery(jpql);
//		List<Attendance> users=query.getResultList();
//		if(users!=null && users.size()>0)
//		{
//			return users;
//		}
//		return null;
//	}
//	public Attendance getById(int id)
//	{
//		String jpql="from User where id=:id";
//		Query query=manager.createQuery(jpql);
//		query.setParameter("id", id);
//		List<Attendance> users=query.getResultList();
//		if(users!=null && users.size()>0)
//		{
//			return users.get(0);
//		}
//		return null;
//	}

	public List<Attendance> findAllAttendanceByBatchId(int bid)
	{
		Batch batch=batchDao.getById(bid);
		if(batch!=null)
		{
			List<Attendance> attes=batch.getAttendances();
			return attes;
		}
		return null;
	}
}
