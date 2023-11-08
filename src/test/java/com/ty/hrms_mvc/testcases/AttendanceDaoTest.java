package com.ty.hrms_mvc.testcases;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.ty.mvcproject.pojo.Attendance;
import com.ty.mvcproject.pojo.Batch;
import com.ty.mvcproject.pojo.User;
import com.ty.mvcproject.repository.AttendanceDao;
import com.ty.mvcproject.repository.BatchDao;
import com.ty.mvcproject.repository.UserDao;

class AttendanceDaoTest {

	AttendanceDao dao=new AttendanceDao();
	BatchDao dao2=new BatchDao();
	@Test
	@Disabled
	void save() {
		Attendance attendance=new Attendance();
		attendance.setNoOfStudent(25);
		Attendance attendance2=dao.saveAttendance(attendance, 67);
		assertNotNull(attendance2);
	}
	
	@Test
	@Disabled
	void getByBatchId()
	{
		Batch batch=dao2.getById(31);
		List<Attendance> list=batch.getAttendances();
		assertNotNull(list);
	}
/*
 * Negative Scenarios
 */
	@Test
	void getByBatchId1()
	{
		Batch batch=dao2.getById(130);
		
		assertNull(batch);
		//List<Attendance> list=batch.getAttendances();
	}
}
