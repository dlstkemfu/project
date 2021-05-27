package com.nsb.shop.logic;

import java.util.Date;

public class BoardComments {

	
	private int boardid;
	private String users;
	private int comtNum;
	private String comtCon;
	private Date comtDate;
	
	
	
	public int getBoardid() {
		return boardid;
	}
	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public int getComtNum() {
		return comtNum;
	}
	public void setComtNum(int comtNum) {
		this.comtNum = comtNum;
	}
	public String getComtCon() {
		return comtCon;
	}
	public void setComtCon(String comtCon) {
		this.comtCon = comtCon;
	}
	public Date getComtDate() {
		return comtDate;
	}
	public void setComtDate(Date comtDate) {
		this.comtDate = comtDate;
	}
	
}
