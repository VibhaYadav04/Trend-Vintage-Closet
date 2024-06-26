package com.DAO;

import java.util.List;

import com.entity.Cart;


public interface CartDAO {
	public boolean addCart(Cart c);
	public List<Cart> getClothByUser(int userId);
	public boolean deleteCloth (int clothId, int userId, int cartId);
}
