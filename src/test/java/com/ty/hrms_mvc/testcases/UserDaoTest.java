package com.ty.hrms_mvc.testcases;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.ty.mvcproject.pojo.User;
import com.ty.mvcproject.repository.UserDao;

class UserDaoTest {

	UserDao dao=new UserDao();
	@Test
	@Disabled
	void save() {
		User user=new User();
		user.setName("virat");
		user.setEmail("sagar@gmail.com");
		user.setStatus(true);
		user.setPassword("virat@123");
		user.setPhoneNumber(7654321);
		user.setRole("Trainer");
		user.setEmployeeId("tyc6754");
		User user2=dao.saveUser(user);
		
		assertNotNull(user2);
	}
	
	@Test
	@Disabled
	void updateUser() {
		User user=new User();
		user.setId(19);
		
		user.setEmail("vk@gmail.com");
		
		User user2=dao.updateUser(user);
		
		assertNotNull(user2);
	}
	@Test
	@Disabled
	void getUserById() {
		User user=dao.getById(19);		
		assertNotNull(user);
	}
	
	@Test
	@Disabled
	void getUserByEmailPass()
	{
		User user=dao.getByEmailPass("hr@gmail.com", "hr@123");		
		assertNotNull(user);
	}
	@Test
	@Disabled
	void findByRole()
	{
		List<User> users=dao.findByRole("Trainer");
		assertNotNull(users);
	}
	
	@Test
	@Disabled
	void findByStatus()
	{
		List<User> users=dao.findByStatus(true);
		assertNotNull(users);
	}
	
	/*
	 * Negative Scenarios
	 */
	@Test
	@Disabled

	void findByRole1()
	{
		List<User> users=dao.findByRole("trainer");
		assertNull(users);
	}
	
	@Test
	@Disabled
	void getUserByEmailPass1()
	{
		User user=dao.getByEmailPass("hr@gmail.com", "hr@12345");		
		assertNull(user);
	}
	@Test	
	@Disabled
	void getUserById1() {
		User user=dao.getById(119);		
		assertNull(user);
	}
	@Test
	void findByStatus1()
	{
		List<User> users=dao.findByStatus(false);
		assertNull(users);
	}

}
