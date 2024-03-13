package com.entities;

public class BookOrder {
	private int id;
	private String oid;
	private String username;
	private String email;
	private String address;
	private String phone;
	private String bookname;
	private String author;
	private Double price;
	private String payment;
	
	//Constructor	
	public BookOrder() {
		super();
	}
	
	
	//Getters and Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", oid=" + oid + ", username=" + username + ", email=" + email + ", address="
				+ address + ", phone=" + phone + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", payment=" + payment + "]";
	}
}
