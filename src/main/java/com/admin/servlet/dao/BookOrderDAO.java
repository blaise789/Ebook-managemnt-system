package com.admin.servlet.dao;

import com.admin.servlet.entities.BookOrder;

import java.util.List;

public interface BookOrderDAO {
	
	public int getOrderNumber();
	public boolean saveOrder(List<BookOrder> blist);
	public List<BookOrder> getBooks(String email);
	public List<BookOrder> getAllOrders();
	
}
