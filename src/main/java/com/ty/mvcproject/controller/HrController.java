package com.ty.mvcproject.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.persistence.Convert;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ty.mvcproject.pojo.Attendance;
import com.ty.mvcproject.pojo.Batch;
import com.ty.mvcproject.pojo.Image;
import com.ty.mvcproject.pojo.User;
import com.ty.mvcproject.service.HrService;

@Controller
public class HrController {

	@Autowired
	private HrService service;

	@GetMapping("/saveuser")
	public String saveUser(@RequestParam("user_empid") String empid, @RequestParam("user_name") String name,
			@RequestParam("user_email") String email, @RequestParam("user_phone") long phone,
			@RequestParam("user_pass") String pass, @RequestParam("user_role") String role,
			@RequestParam("user_status") String status, ModelMap map) {

		User user = new User(empid, name, email, phone, pass, role, false, null);
		User user1 = service.saveUser(user);
		if (user1 != null) {
			map.addAttribute("msg", "Data Saved");
			return "hrview.jsp";
		}
		map.addAttribute("msg", "Data Not Saved");
		return "registration.jsp";
	}

	@GetMapping("/batchsave")
	public String saveBatch(@RequestParam("batch_subject") String subject, @RequestParam("user_id") int id,
			ModelMap map, HttpServletRequest req) {
		User user = service.getTrainer(id);
		if (user != null) {

			Batch batch = service.saveBatch(subject, user);
			int id1 = batch.getId();
			Batch batch2 = service.getBatchById(id1);

			String link = "http://localhost:8080/mvcproject/trainerlink?bbid=" + id1 + "";
			GmailSender sender = new GmailSender();
			boolean b = sender.sendEmail(user.getEmail(), "sagar.gaikwad.0018@gmail.com", "About Batch Start", link);

			map.addAttribute("msg", "Batch Generated and Email sent!!");
			return "hrview.jsp";
		}
		map.addAttribute("msg", "Trainer Not Found");
		return "hrview.jsp";
	}

	@GetMapping("/login")
	public String loginUser(@RequestParam("user_email") String email, @RequestParam("user_pass") String pass,
			ModelMap map, HttpServletRequest request) {
		User user = service.verifyUser(email, pass);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("u", user);
			String role = user.getRole();
			if (role.equals("HR")) {
				map.addAttribute("msg", "Login successfully!!");
				return "hrview.jsp";
			} else if (role.equals("Trainer")) {
				map.addAttribute("trainer", user);
				map.addAttribute("msg", "Login successfully!!");
				return "trainerview.jsp";
			}
			map.addAttribute("msg", "Login successfully!!");
			return "managerview.jsp";
		}
		map.addAttribute("msg", "Invalid Credentials!!");
		return "login.jsp";
	}

	@GetMapping("/allbatches")
	public String allBatches(ModelMap map) {
		List<Batch> batches = service.allBatches();
		if (batches != null && batches.size() > 0) {
			map.addAttribute("list", batches);
			return "allbatches.jsp";
		}
		map.addAttribute("list", batches);
		map.addAttribute("msg", "No Batches Found");
		return "allbatches.jsp";
	}

	@GetMapping("/updatebatch")
	public String updateBatch(@RequestParam("id") int id, ModelMap map) {
		Batch batch = service.updateBatch(id);
		map.addAttribute("msg", "Batch Status Updated");
		return "trainerview.jsp";

	}

	@GetMapping("/alltrainers")
	public String allTrainers(ModelMap map) {
		List<User> batches = service.allTrainers();
		if (batches != null && batches.size() > 0) {
			map.addAttribute("list", batches);
			return "alltrainers.jsp";
		}
		map.addAttribute("list", batches);
		map.addAttribute("msg", "No Trainers Found");
		return "alltrainers.jsp";
	}

	@GetMapping("/logout")
	public String logOut(ModelMap map) {
		map.addAttribute("msg", "Logout successfully!!");
		return "login.jsp";
	}

	@GetMapping("/gettrainer")
	public String getTrainer(@RequestParam("user_id") int id, ModelMap map) {
		User user = service.getTrainer(id);

		if (user != null) {
			map.addAttribute("trainer", user);
			return "trainer.jsp";
		}
		map.addAttribute("msg", "Trainer Not Found");
		return "alltrainers.jsp";
	}

	@GetMapping("/updatetrainer")
	public String updateTrainer(@RequestParam("id") int id, ModelMap map) {
		User user = service.getTrainer(id);
		map.addAttribute("user", user);
		return "updatetrainer.jsp";
	}

	@RequestMapping(value = "/imagesave")
	public String batchInfo(@RequestParam("file") MultipartFile image, HttpServletRequest request, ModelMap map) {
		if (!image.isEmpty()) {
			try {

				int id = Integer.parseInt((String) request.getParameter("bid"));
				System.out.println(id);
				byte[] imageBytes = image.getBytes();
				Image imageInfo = new Image();
				imageInfo.setImg(imageBytes);
				Attendance attendance = new Attendance();
				attendance.setImage(imageInfo);
				service.saveAttendance(attendance, id);
				System.out.println("Image Saved");
				map.addAttribute("msg", "Attendance Registered");
				return "trainerlinkview.jsp";
			} catch (IOException e) {
				System.out.println("Exception");
			}
		}
		System.out.println("Image Not Received");
		return "trainerlinkview.jsp";
	}

	@GetMapping("updateuser")
	public String update(@RequestParam("user_id") int id, @RequestParam("user_name") String name,
			@RequestParam("user_email") String email, @RequestParam("user_phone") long phone,
			@RequestParam("user_pass") String pass, @RequestParam("user_status") boolean status, ModelMap map) {
		User user = service.getTrainer(id);
		user.setEmail(email);
		user.setName(name);
		user.setPhoneNumber(phone);
		user.setPassword(pass);
		user.setStatus(status);
		User user2 = service.updateUser(user);
		map.addAttribute("msg", "Data Updated");
		return "hrview.jsp";
	}

	@GetMapping("/displayimage")
	public String displayImages(@RequestParam("bid") int bid, ModelMap map) {
		Batch batch = service.getBatchById(bid);
		map.addAttribute("batch", batch);
		return "displayimage.jsp";
	}

	@GetMapping("viewbatch")
	public String viewBatch(@RequestParam("bid") int id, ModelMap map) {
		Batch batch = service.getBatchById(id);
		if (batch != null) {
			map.addAttribute("batch", batch);
			return "displayimage.jsp";
		}
		map.addAttribute("msg", "Batch Not Exist");
		return "displayimage.jsp";
	}

	@GetMapping("/myinfo")
	public String myInfo(HttpSession session, ModelMap map) {
		return "myinfo.jsp";
	}

	@GetMapping("/batchinfo")
	public String batchInfo(HttpSession session, ModelMap map) {
		return "batchinfo.jsp";
	}

	@GetMapping("/trainerlink")
	public String getLink(@RequestParam("bbid") int id, HttpServletRequest request) {
		System.out.println(id);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("b", id);
		return "trainerlinkview.jsp";
	}
}
