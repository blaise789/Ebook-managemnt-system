package com.admin.servlet;

import com.dao.BookDAOImplement;
import com.db.ConnectionProvider;
import com.entities.BookDetails;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditBook extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookname = request.getParameter("bname");
			String authorname = request.getParameter("baname");
			Double bprice = Double.parseDouble(request.getParameter("bprice"));
			String bstatus = request.getParameter("bstatus");
			BookDetails bookdetails = new BookDetails();
			bookdetails.setBookid(id);
			bookdetails.setBookname(bookname);
			bookdetails.setAuthor(authorname);
			bookdetails.setPrice(bprice);
			bookdetails.setStatus(bstatus);
			
			HttpSession session = request.getSession();			
			BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
			if(bookdao.editBook(bookdetails)) {
				session.setAttribute("successmsg", "Book details updated successfully");
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
