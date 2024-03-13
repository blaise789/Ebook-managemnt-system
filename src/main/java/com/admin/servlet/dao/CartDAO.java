package com.admin.servlet.dao;

import com.admin.servlet.entities.Cart;

import java.util.List;
public interface CartDAO {
	public boolean addCart(Cart c);
	public List<Cart> getBookByUserId(int userid);
	public boolean removeCartBook(int cid, int bid, int uid);
	public boolean removeCartBook(int uid);
}
