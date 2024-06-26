package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cloth_Order;

public class ClothOrderImpl implements ClothOrderDAO {

	private Connection conn;

	public ClothOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public boolean saveOrder(List<Cloth_Order> clist) {
		boolean f = false;
		try {
			String sql = "insert into cloth_order (order_id, user_name, email, address, phone, cloth_name, price, payment) value (?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for(Cloth_Order c : clist)
			{
				ps.setString(1, c.getOrderId());
				ps.setString(2, c.getUsername());
				ps.setString(3, c.getEmail());
				ps.setString(4, c.getFulladd());
				ps.setString(5, c.getPhno());
				ps.setString(6, c.getClothName());
				ps.setString(7, c.getPrice());
				ps.setString(8, c.getPayementType());
				ps.addBatch();
			}
			
			int [] count = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	//This is for user module, clothes orders by user need to be showed here
	@Override
	public List<Cloth_Order> getCloth(String email) {
		List<Cloth_Order> list = new ArrayList<Cloth_Order> ();
		Cloth_Order o = null;
		
		try
		{
			String sql = "select * from cloth_order where email=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,  email);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				o = new Cloth_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setClothName(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPayementType(rs.getString(9));
				list.add(o);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}



	// This is for admin module-- all clothes needs to be shown here
	@Override
	public List<Cloth_Order> getAllOrder() {
		List<Cloth_Order> list = new ArrayList<Cloth_Order> ();
		Cloth_Order o = null;
		
		try
		{
			String sql = "select * from cloth_order ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				o = new Cloth_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setClothName(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPayementType(rs.getString(9));
				list.add(o);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
}
