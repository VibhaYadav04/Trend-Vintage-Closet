package com.DAO;

import java.util.List;

import com.entity.Cloth_Order;

public interface ClothOrderDAO {
	
	public boolean saveOrder(List<Cloth_Order> clist);
	
	public List<Cloth_Order> getCloth(String email);
	
	public List<Cloth_Order> getAllOrder();
}
