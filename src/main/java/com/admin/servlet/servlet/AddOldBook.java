package com.admin.servlet.servlet;

import com.admin.servlet.dao.BookDAOImplement;
import com.admin.servlet.db.ConnectionProvider;
import com.admin.servlet.entities.BookDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@MultipartConfig
public class AddOldBook extends HttpServlet{	
		private static final long serialVersionUID = 1L;
		protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			try {
				String email = request.getParameter("email");
				String bookname = request.getParameter("bname");
				String authorname = request.getParameter("baname");
				Double bprice = Double.parseDouble(request.getParameter("bprice"));
				String bcategory = "old";
				String bstatus = "active";
				Part part  = request.getPart("bimg");
				String fileName = part.getSubmittedFileName();
				
				HttpSession session = request.getSession();
				BookDetails bd = new BookDetails(bookname,authorname,bprice,bcategory,bstatus,fileName,email);
				BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
				if(bookdao.addBook(bd)) {
					String path = getServletContext().getRealPath("") + "books";
					System.out.println(path);
					File file = new File(path);
					part.write(file + File.separator + fileName);
					session.setAttribute("successmsg", "Book added successfully");
					response.sendRedirect("sellBook.jsp");
				}else {
					session.setAttribute("failedmsg", "Something went wrong!");
					response.sendRedirect("sellBook.jsp");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
}

