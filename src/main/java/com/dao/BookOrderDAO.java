package com.dao;

import com.entities.BookOrder;

import java.util.List;

public interface BookOrderDAO {
	
	public int getOrderNumber();
	public boolean saveOrder(List<BookOrder> blist);
	public List<BookOrder> getBooks(String email);
	public List<BookOrder> getAllOrders();
	
}
