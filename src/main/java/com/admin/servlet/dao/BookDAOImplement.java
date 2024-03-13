package com.admin.servlet.dao;

import com.admin.servlet.entities.BookDetails;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImplement implements BookDAO {

	Connection conn;

	public BookDAOImplement(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBook(BookDetails b) {
		boolean flag = false;

		try {
			String query = "insert into book_details(bookname,author,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBookname());
			pstmt.setString(2, b.getAuthor());
			pstmt.setDouble(3, b.getPrice());
			pstmt.setString(4, b.getBookcategory());
			pstmt.setString(5, b.getStatus());
			pstmt.setString(6, b.getPhoto());
			pstmt.setString(7, b.getEmail());

			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public List<BookDetails> getAllBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookDetails = null;
		try {
			String query = "select * from book_details";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				bookDetails = new BookDetails();
				bookDetails.setBookid(rs.getInt(1));
				bookDetails.setBookname(rs.getString(2));
				bookDetails.setAuthor(rs.getString(3));
				bookDetails.setPrice(rs.getDouble(4));
				bookDetails.setBookcategory(rs.getString(5));
				bookDetails.setStatus(rs.getString(6));
				bookDetails.setPhoto(rs.getString(7));
				bookDetails.setEmail(rs.getString(8));
				list.add(bookDetails);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetails getBookById(int id) {
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where bookid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookdetails;
	}

	@Override
	public boolean editBook(BookDetails b) {
		boolean flag = false;
		try {
			String query = "update book_details set bookname=?, author=?, price=?, status=? where bookid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBookname());
			pstmt.setString(2, b.getAuthor());
			pstmt.setDouble(3, b.getPrice());
			pstmt.setString(4, b.getStatus());
			pstmt.setDouble(5, b.getBookid());
			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteBook(int id) {
		boolean flag = false;
		try {

			String query1 = "select * from book_details where bookid=?";
			PreparedStatement pstmt1 = conn.prepareStatement(query1);
			pstmt1.setInt(1, id);
			ResultSet rs = pstmt1.executeQuery();
			while (rs.next()) {
				String image = rs.getString("photo");
				File path = new File(
						"D:\\Documents\\Programming_Code\\Eclipse Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project2\\books"
								+ File.separator + image);
				path.delete();
			}

			String query = "delete from book_details where bookid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookDetails> getRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where status=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where bookcategory=? and status=? order by bookid";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "new");
			pstmt.setString(2, "active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where bookcategory=? and status=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "old");
			pstmt.setString(2, "active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details";
			Statement pstmt = conn.createStatement();
			ResultSet rs = pstmt.executeQuery(query);
			while (rs.next()) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where bookcategory=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "new");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where bookcategory=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "old");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBook(String email, String category) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where email=? and bookcategory=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, category);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteOldBook(int id, String category, String email) {
		boolean flag = false;
		try {

			String query1 = "select * from book_details where bookid=? and bookcategory=? and email=?";
			PreparedStatement pstmt1 = conn.prepareStatement(query1);
			pstmt1.setInt(1, id);
			pstmt1.setString(2, category);
			pstmt1.setString(3, email);
			ResultSet rs = pstmt1.executeQuery();
			while (rs.next()) {
				String image = rs.getString("photo");
				File path = new File(
						"D:\\Documents\\Programming_Code\\Eclipse Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project2\\books"
								+ File.separator + image);
				path.delete();
			}

			String query = "delete from book_details where bookid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails bookdetails = null;
		try {
			String query = "select * from book_details where bookname like ? or author like ? or bookcategory like ? and status=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+ch+"%");
			pstmt.setString(2, "%"+ch+"%");
			pstmt.setString(3, "%"+ch+"%");
			pstmt.setString(4, "active");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bookdetails = new BookDetails();
				bookdetails.setBookid(rs.getInt(1));
				bookdetails.setBookname(rs.getString(2));
				bookdetails.setAuthor(rs.getString(3));
				bookdetails.setPrice(rs.getDouble(4));
				bookdetails.setBookcategory(rs.getString(5));
				bookdetails.setStatus(rs.getString(6));
				bookdetails.setPhoto(rs.getString(7));
				bookdetails.setEmail(rs.getString(8));
				list.add(bookdetails);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
