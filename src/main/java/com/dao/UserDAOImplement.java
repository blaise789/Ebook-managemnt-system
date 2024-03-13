package com.dao;

import com.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImplement implements UserDAO {

	Connection conn;

	public UserDAOImplement(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User u1) {
		boolean flag = false;
		try {
			String query = "INSERT INTO user (name,email,phone_number,password) values(?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u1.getName());
			pstmt.setString(2, u1.getEmail());
			pstmt.setString(3, u1.getPhone_number());
			pstmt.setString(4, u1.getPassword());
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			String query = "Select * from user where email=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone_number(rs.getString(5));
				user.setPassword(rs.getString(6));
				user.setAddress(rs.getString(7));
				user.setLandmark(rs.getString(8));
				user.setCity(rs.getString(9));
				user.setState(rs.getString(10));
				user.setPincode(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean userUpdate(User user) {
		boolean flag = false;
		try {
			String query = "update user set name=?, email=?, phone_number=?, password=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPhone_number());
			pstmt.setString(4, user.getPassword());
			pstmt.setInt(5, user.getId());
			int count = pstmt.executeUpdate();
			if(count>0) {
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean checkUser(String email) {
		boolean flag = false;
		try {
			String query = "select  * from user where email=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				flag=true;
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
