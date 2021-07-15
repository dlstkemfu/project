package com.nsb.shop.logic;

import java.util.Date;

public class Board {
	private int id;
	private int views;
	private String category;
	private String title;
	private String region;
	private String choose;
	private String object;
	private String content;
	private String users;
	private Date updatetime ;
	private Date createtime ;
	private String ThumImg;
	private String Img;
	
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	public String getThumImg() {
		return ThumImg;
	}
	public void setThumImg(String thumImg) {
		ThumImg = thumImg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getChoose() {
		return choose;
	}
	public void setChoose(String choose) {
		this.choose = choose;
	}
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	
}