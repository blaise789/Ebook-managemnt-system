package com.admin.servlet.entities;

public class BookDetails {

	private int bookid;
	private String bookname;
	private String author;
	private Double price;
	private String bookcategory;
	private String status;
	private String photo;
	private String email;
	
	//Constructors
	public BookDetails() {
		super();
	}
	

	public BookDetails(String bookname, String author, Double price, String bookcategory, String status, String photo, String email) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookcategory = bookcategory;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}


	public BookDetails(int bookid, String bookname, String author, Double price, String bookcategory, String status,
			String photo, String email) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookcategory = bookcategory;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}

	//Getters and Setters
	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
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

	public String getBookcategory() {
		return bookcategory;
	}

	public void setBookcategory(String bookcategory) {
		this.bookcategory = bookcategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "BookDetails [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", bookcategory=" + bookcategory + ", status=" + status + ", photo=" + photo + ", email=" + email
				+ "]";
	}	
}
