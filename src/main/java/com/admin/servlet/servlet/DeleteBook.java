package com.admin.servlet.servlet;

import com.admin.servlet.dao.BookDAOImplement;
import com.admin.servlet.db.ConnectionProvider;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteBook extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
			HttpSession session = request.getSession();
			if(bookdao.deleteBook(id)) {
				session.setAttribute("successmsg", "Book Deleted Successfully");
				response.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failedmsg", "Something went wrong!");
				response.sendRedirect("admin/all_books.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
