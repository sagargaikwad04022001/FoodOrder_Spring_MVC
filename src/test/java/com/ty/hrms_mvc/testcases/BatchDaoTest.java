package com.ty.hrms_mvc.testcases;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.ty.mvcproject.pojo.Batch;
import com.ty.mvcproject.pojo.User;
import com.ty.mvcproject.repository.BatchDao;
import com.ty.mvcproject.repository.UserDao;

class BatchDaoTest {

	BatchDao dao=new BatchDao();
	UserDao dao2=new  UserDao();
	@Test
	@Disabled
	void save() {
		Batch batch=new Batch();
		batch.setSubject("C++");
		batch.setStatus(true);
		Batch batch2=dao.saveBatch(batch, 19);
		assertNotNull(batch2);
	}
	@Test
	@Disabled
	void getById()
	{
		Batch batch=dao.getById(20);
		assertNotNull(batch);
	}
	
	@Test
	@Disabled
	void update()
	{
		Batch batch=dao.getById(20);		
		batch.setStatus(true);
		Batch b=dao.updateBatch(batch);
		assertNotNull(b);
	}
	@Test
	@Disabled
	void getAllBatches()
	{
		List<Batch> batches=dao.allBatches();
		assertNotNull(batches);
	}
	@Test
	@Disabled
	void getByUserId()
	{
		User user=dao2.getById(19);
		List<Batch> batches=user.getBatches();
		assertNotNull(batches);
	}
	
	/*
	 * Negative Scenarios
	 */
	@Test
	@Disabled
	void getByUserId1()
	{
		User user=dao2.getById(119);
	//	List<Batch> batches=user.getBatches();
		assertNull(user);
	}
	@Test
	
	void getById1()
	{
		Batch batch=dao.getById(220);
		assertNull(batch);
	}
}
