package com.admin.servlet.servlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("obj");
			HttpSession session1 = request.getSession();
			session1.setAttribute("successmsg", "Logout Successfully");
			response.sendRedirect("login.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
