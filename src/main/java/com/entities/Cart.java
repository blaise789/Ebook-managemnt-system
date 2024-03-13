package com.entities;

public class Cart {
	private int cid;
	private int bid;
	private int userid;
	private String bookname;
	private String author;
	private Double price;
	private Double totalprice;
	
	
	//Constructors
	public Cart() {
		super();
	}
	
	public Cart(int cid, int bid, int userid, String bookname, String author, Double price, Double totalprice) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.userid = userid;
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.totalprice = totalprice;
	}



	//Getters and Setters
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}
}
