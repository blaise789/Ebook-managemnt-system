package com.admin.servlet.servlet;

import com.admin.servlet.dao.BookDAOImplement;
import com.admin.servlet.dao.CartDAOImplement;
import com.admin.servlet.db.ConnectionProvider;
import com.admin.servlet.entities.BookDetails;
import com.admin.servlet.entities.Cart;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartServlet extends HttpServlet{
	private static final long  serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int userid = Integer.parseInt(request.getParameter("uid"));
			BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
			BookDetails b = bookdao.getBookById(bid);
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserid(userid);
			c.setBookname(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(b.getPrice());
			c.setTotalprice(b.getPrice());
			CartDAOImplement cartdao = new CartDAOImplement(ConnectionProvider.getConnection());
			HttpSession session = request.getSession();
			if(cartdao.addCart(c)) {
				session.setAttribute("successmsg", "Book add to cart");
				response.sendRedirect("index.jsp");
			}else {
				session.setAttribute("failedmsg", "Something went wrong!");
				response.sendRedirect("index.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
