package com.admin.servlet.servlet;

import com.admin.servlet.dao.UserDAOImplement;
import com.admin.servlet.db.ConnectionProvider;
import com.admin.servlet.entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("fname");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone_number");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		User user = new User(id, name, email, password, phone_number);
		UserDAOImplement userDaoImplement = new UserDAOImplement(ConnectionProvider.getConnection());
		if (userDaoImplement.userUpdate(user)) {
			session.setAttribute("successmsg", "Updated successfully");
			response.sendRedirect("loginAndSecurity.jsp");
		} else {
			session.setAttribute("failedmsg", "Something went wrong!");
			response.sendRedirect("loginAndSecurity.jsp");
		}
	}
}
