package com.admin.servlet.dao;

import com.admin.servlet.entities.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImplement implements CartDAO {
	
	Connection conn;
	public CartDAOImplement(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean flag = false;
		try {
			String query = "insert into cart(bid,userid,bookname,author,price,totalprice) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,c.getBid());
			pstmt.setInt(2,c.getUserid());
			pstmt.setString(3,c.getBookname());
			pstmt.setString(4,c.getAuthor());
			pstmt.setDouble(5,c.getPrice());
			pstmt.setDouble(6,c.getTotalprice());
			int count = pstmt.executeUpdate();
			if(count>0) {
				flag=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Cart> getBookByUserId(int userid) {
		List<Cart> list = new ArrayList<Cart>();
		Cart cart = null;
		double totalprice = 0; 
		try {
			String query = "select * from cart where userid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				cart = new Cart();
				cart.setCid(rs.getInt(1));
				cart.setBid(rs.getInt(2));
				cart.setUserid(rs.getInt(3));
				cart.setBookname(rs.getString(4));
				cart.setAuthor(rs.getString(5));
				cart.setPrice(rs.getDouble(6));
				totalprice += rs.getDouble(7);
				cart.setTotalprice(totalprice);
				list.add(cart);				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean removeCartBook(int cid, int bid, int uid) {
		boolean flag = false;
		try {
			String query = "delete from cart where cid=? and bid=? and userid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cid);
			pstmt.setInt(2, bid);
			pstmt.setInt(3, uid);
			int count = pstmt.executeUpdate();
			if(count>0){
				flag=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean removeCartBook(int uid) {
		boolean flag = false;
		try {
			String query = "delete from cart where userid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uid);
			pstmt.executeUpdate();
			flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return flag;
	}	
}
