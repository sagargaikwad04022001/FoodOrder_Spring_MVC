package com.ty.mvcproject.pojo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor

@Entity
@Table(name = "user_details")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String employeeId;
	private String name;
	@Column(unique = true)
	private String email;
	private long phoneNumber;
	private String password;
	private String role;
	private boolean status;
	@OneToMany
	private List<Batch> batches;
	public User(String employeeId, String name, String email, long phoneNumber, String password, String role,
			boolean status, List<Batch> batches) {
		super();
		this.employeeId = employeeId;
		this.name = name;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.role = role;
		this.status = status;
		this.batches = batches;
	}
	
	
}
