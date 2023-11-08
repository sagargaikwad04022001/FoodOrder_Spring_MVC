package com.ty.mvcproject.pojo;

import java.io.File;
import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Attendance {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int noOfStudent;
	@CreationTimestamp
	private LocalDateTime createdDateTime;
	@OneToOne(cascade = CascadeType.ALL)
	private Image image;
	
}
