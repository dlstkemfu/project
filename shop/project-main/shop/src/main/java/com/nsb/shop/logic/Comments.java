package com.nsb.shop.logic;

import java.util.Date;

public class Comments {

		private int cno;
		private int id;
		private String writer;
		private String comtCon;
		private Date regDate;
		public int getCno() {
			return cno;
		}
		public void setCno(int cno) {
			this.cno = cno;
		}
		public int getid() {
			return id;
		}
		public void setid(int id) {
			this.id = id;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getComtCon() {
			return comtCon;
		}
		public void setComtCon(String comtCon) {
			this.comtCon = comtCon;
		}
		public Date getRegDate() {
			return regDate;
		}
		public void setregDate(Date regDate) {
			this.regDate = regDate;
		}
		
}
