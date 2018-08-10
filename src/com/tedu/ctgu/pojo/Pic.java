package com.tedu.ctgu.pojo;

import java.io.Serializable;

public class Pic implements Serializable{
	private Integer id;
	private String picName;
	private Integer userId;
	public Pic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Pic [id=" + id + ", picName=" + picName + ", userId=" + userId + "]";
	}
	

}
