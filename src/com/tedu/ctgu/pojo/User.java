package com.tedu.ctgu.pojo;

import java.io.Serializable;
import java.util.List;

public class User implements Serializable{
	private Integer id;
	private String username;
	private String name;
	private String password;
	private String gendar;
	private Integer age;
	private String phone;
	//级联映射查询当前id所对应的图片集合
	private List<Pic> picList;
	
	
	
	
	
	public List<Pic> getPicList() {
		return picList;
	}
	public void setPicList(List<Pic> picList) {
		this.picList = picList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGendar() {
		return gendar;
	}
	public void setGendar(String gendar) {
		this.gendar = gendar;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", name=" + name + ", password=" + password + ", gendar="
				+ gendar + ", age=" + age + ", phone=" + phone + ", picList=" + picList + "]";
	}
    
	
	//get set 构造器,tostring
	
}
