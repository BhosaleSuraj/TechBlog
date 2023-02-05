package com.tech.blog.entities;
import java.sql.*;
public class User {
   
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private String profile;
	private Timestamp dateTime;
	// i have to created constructor 
	
	 public User(int id, String name, String email, String password, String gender, String about, String profile,
				Timestamp dateTime) {
			
			this.id = id;
			this.name = name;
			this.email = email;
			this.password = password;
			this.gender = gender;
			this.about = about;
			this.profile = profile;
			this.dateTime = dateTime;
		}
	public User(int id, String name, String email, String password, String gender, String about, Timestamp dateTime) 
	{
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.dateTime = dateTime;
	}
	//and second constructor to without pass value
	public User() 
	{
		
	}
	//third constructor to generate we can not generate id constructor method
	public User(String name, String email, String password, String gender, String about) {
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		
		
		  
	}
	// generate getter and setter method
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	

}