package com.user.servlet;

import com.dao.CartDAOImplement;
import com.db.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class RemoveCartBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		int cid = Integer.parseInt(request.getParameter("cid"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		CartDAOImplement cartdao = new CartDAOImplement(ConnectionProvider.getConnection());
		HttpSession session = request.getSession();
		if(cartdao.removeCartBook(cid, bid, uid)) {
			session.setAttribute("successmsg", "Book removed from cart");
			response.sendRedirect("cart.jsp");
		}else {
			session.setAttribute("failedmsg", "Something went wrong!");
			response.sendRedirect("cart.jsp");
		}
		
	}	
}
