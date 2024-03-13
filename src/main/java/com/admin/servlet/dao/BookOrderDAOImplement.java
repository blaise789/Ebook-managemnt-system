package com.admin.servlet.dao;

import com.admin.servlet.entities.BookOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderDAOImplement implements BookOrderDAO {
	private Connection conn;

	public BookOrderDAOImplement(Connection conn) {
		this.conn = conn;
	}

	@Override
	public int getOrderNumber() {
		int i = 1;
		try {
			String query = "select * from book_order";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<BookOrder> blist) {
		boolean flag = false;
		try {
			String query = "insert into book_order(oid,username,email,address,phone,bookname,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(query);
			for (BookOrder b : blist) {
				pstmt.setString(1, b.getOid());
				pstmt.setString(2, b.getUsername());
				pstmt.setString(3, b.getEmail());
				pstmt.setString(4, b.getAddress());
				pstmt.setString(5, b.getPhone());
				pstmt.setString(6, b.getBookname());
				pstmt.setString(7, b.getAuthor());
				pstmt.setDouble(8, b.getPrice());
				pstmt.setString(9, b.getPayment());
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			conn.commit();
			flag = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookOrder> getBooks(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder bo = null;
		try {
			String query = "select * from book_order where email=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bo = new BookOrder();
				bo.setId(rs.getInt(1));
				bo.setOid(rs.getString(2));
				bo.setUsername(rs.getString(3));
				bo.setEmail(rs.getString(4));
				bo.setAddress(rs.getString(5));
				bo.setPhone(rs.getString(6));
				bo.setBookname(rs.getString(7));
				bo.setAuthor(rs.getString(8));
				bo.setPrice(rs.getDouble(9));
				bo.setPayment(rs.getString(10));
				list.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookOrder> getAllOrders() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder bo = null;
		try {
			String query = "select * from book_order";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bo = new BookOrder();
				bo.setId(rs.getInt(1));
				bo.setOid(rs.getString(2));
				bo.setUsername(rs.getString(3));
				bo.setEmail(rs.getString(4));
				bo.setAddress(rs.getString(5));
				bo.setPhone(rs.getString(6));
				bo.setBookname(rs.getString(7));
				bo.setAuthor(rs.getString(8));
				bo.setPrice(rs.getDouble(9));
				bo.setPayment(rs.getString(10));
				list.add(bo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
