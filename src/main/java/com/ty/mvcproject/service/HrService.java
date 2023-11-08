package com.ty.mvcproject.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ty.mvcproject.controller.ImageUtils;
import com.ty.mvcproject.pojo.Attendance;
import com.ty.mvcproject.pojo.Batch;
import com.ty.mvcproject.pojo.Image;
import com.ty.mvcproject.pojo.User;
import com.ty.mvcproject.repository.AttendanceDao;
import com.ty.mvcproject.repository.BatchDao;

import com.ty.mvcproject.repository.UserDao;

@Service
public class HrService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private AttendanceDao attendanceDao;
	@Autowired
	private BatchDao batchDao;

	
	public Attendance saveAttendance(Attendance attendance,int id) {	
		Batch batch=batchDao.getById(id);
		List<Attendance> ats=batch.getAttendances();
		if(ats==null)
		{
			ats=new ArrayList<>();
		}
		ats.add(attendance);
		batch.setAttendances(ats);
		
		attendanceDao.saveAttendance(attendance,id);
		batchDao.updateBatch(batch);
		return attendance;		
	}

	public User saveUser(User user) {
		user.setStatus(true);
		User u=userDao.saveUser(user);
		return u;
		
	}

	public Batch saveUser(Batch batch) {
		
		Batch b=batchDao.saveBatch(batch, 3);
		return b;
	}

	public User verifyUser(String email, String pass) {
		User user=userDao.getByEmailPass(email, pass);
		if(user!=null )
		{
			return user;
		}
		return null;
	}

	public List<Batch> allBatches() {
		List<Batch> batches=batchDao.allBatches();
		return batches;
	}

	public Batch updateBatch(int id) {
		Batch batch=batchDao.getById(id);
		batch.setStatus(false);
		batchDao.updateBatch(batch);
		return batch;
	}

	public Batch saveBatch(String subject, User user) {
		Batch batch=new Batch();
		batch.setSubject(subject);
		batch.setStatus(true);
		
		batchDao.saveBatch(batch, user.getId());
		List<Batch> batches= user.getBatches();
		List<Batch> batches1=new ArrayList<>();
		batches1.add(batch);
		if(batches==null)
		{
			user.setBatches(batches1);
		}else {
			batches.add(batch);
			user.setBatches(batches);
		}
		userDao.updateUser(user);
		return batch;
	}

	public List<User> allTrainers() {
		List<User> users=userDao.allTrainers();
		return users;
	}

	public User getTrainer(int id) {
		User user=userDao.getById(id);
		if(user!=null)
		{
			return user;
		}
		return null;
	}

	

	public User updateUser(User user) {
        User user1=userDao.updateUser(user);
        return user1;
	}
	
	
	public Attendance uploadImage(MultipartFile file,String date, int bid) throws IOException
	{
		Image image=new Image();		
		image.setImg(ImageUtils.compressImage(file.getBytes()));
		Attendance attendance=new Attendance();
		attendance.setImage(image);
		attendanceDao.saveAttendance(attendance, bid);
		return attendance;
	}

	

	public Batch getBatchById(int id) {
		Batch batch=batchDao.getById(id);
		return batch;
	}
	
	
	

	
}
