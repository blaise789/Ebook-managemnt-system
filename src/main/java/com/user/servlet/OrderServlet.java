package com.user.servlet;

import com.dao.BookOrderDAOImplement;
import com.dao.CartDAOImplement;
import com.db.ConnectionProvider;
import com.entities.BookOrder;
import com.entities.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			int userid = Integer.parseInt(request.getParameter("userid"));
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phoneNumber = request.getParameter("phone_number");
			String address = request.getParameter("address");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("pincode");
			String fulladdress = address + "," + landmark + "," + city + "," + state + "," + pincode;
			String paymenttype = request.getParameter("paymenttype");
			CartDAOImplement cartdao = new CartDAOImplement(ConnectionProvider.getConnection());
			List<Cart> list = cartdao.getBookByUserId(userid);
			if (list.isEmpty()) {
				session.setAttribute("failedmsg", "Please add items in your cart!");
				response.sendRedirect("cart.jsp");
			} else {
				BookOrderDAOImplement bookorderdao = new BookOrderDAOImplement(ConnectionProvider.getConnection());
				int i = bookorderdao.getOrderNumber();
				BookOrder bo = null;
				List<BookOrder> orderlist = new ArrayList<BookOrder>();
				for (Cart c : list) {
					bo = new BookOrder();
					bo.setOid("ORDER-ID-00" + i);
					bo.setUsername(name);
					bo.setEmail(email);
					bo.setAddress(fulladdress);
					bo.setPhone(phoneNumber);
					bo.setBookname(c.getBookname());
					bo.setAuthor(c.getAuthor());
					bo.setPrice(c.getPrice());
					bo.setPayment(paymenttype);
					orderlist.add(bo);
					i++;
				}
				if ("none".equals(paymenttype)) {
					session.setAttribute("failedmsg", "Choose Payment Type");
					response.sendRedirect("cart.jsp");
				} else {
					if (bookorderdao.saveOrder(orderlist)) {
						if(cartdao.removeCartBook(userid)) {							
							response.sendRedirect("orderSuccess.jsp");
						}else {
							session.setAttribute("failedmsg", "Something went wrong!");
							response.sendRedirect("cart.jsp");
						}
					} else {
						session.setAttribute("failedmsg", "Your order failed!");
						response.sendRedirect("cart.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
