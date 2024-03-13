package com.user.servlet;

import com.dao.UserDAOImplement;
import com.db.ConnectionProvider;
import com.entities.User;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone_number");
		String password = request.getParameter("password");
		String condition = request.getParameter("condition");
		HttpSession session = request.getSession();
		
		User user = new User(name,email,password,phone_number);		
		UserDAOImplement userDaoImplement = new UserDAOImplement(ConnectionProvider.getConnection());
		if(condition != null) {
			if(userDaoImplement.checkUser(email)) {
				session.setAttribute("failedmsg", "User already Exists, Please try to login");
				response.sendRedirect("register.jsp");
			}else if(userDaoImplement.userRegister(user)) {
				session.setAttribute("successmsg", "Register successfully");
				response.sendRedirect("register.jsp");				
			}else {
				session.setAttribute("failedmsg", "Something went wrong!");
				response.sendRedirect("register.jsp");
			}			
		}else {
			session.setAttribute("failedmsg", "Please check the terms and condition!");
			response.sendRedirect("register.jsp");
		}
	}
}
