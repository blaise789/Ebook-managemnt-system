package com.admin.servlet.dao;
import com.admin.servlet.entities.User;

public interface UserDAO {
	public boolean userRegister(User u1);
	public User login(String email, String password);
	public boolean userUpdate(User user);
	public boolean checkUser(String email);
}
