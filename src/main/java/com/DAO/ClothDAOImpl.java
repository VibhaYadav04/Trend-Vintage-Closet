package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ClothDtls;

public class ClothDAOImpl implements ClothDAO {

	private Connection conn;

	public ClothDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCloth(ClothDtls c) {
		boolean f = false;
		try {
			String sql = "insert into cloth_dtls(clothName, price, clothCategory, status, photo, email) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getClothName());
			ps.setString(2, c.getPrice());
			ps.setString(3, c.getClothCategory());
			ps.setString(4, c.getStatus());
			ps.setString(5, c.getPhotoName());
			ps.setString(6, c.getEmail());

			int i = ps.executeUpdate();

			if (i == 1)
				f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ClothDtls> getAllClothes() {

		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ClothDtls getClothById(int id) {
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls where clothId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public boolean updateEditCloth(ClothDtls c) {
		boolean f = false;
		try {
			String sql = "update cloth_dtls set clothName=?, price=?, status=? where clothId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getClothName());
			ps.setString(2, c.getPrice());
			ps.setString(3, c.getStatus());
			ps.setInt(4, c.getClothId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	public boolean deleteCloth(int id) {
		boolean f = false;
		try {
			String sql = "delete from cloth_dtls where clothId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ClothDtls> getNewCloth() {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where clothCategory=? and status=?  order by clothId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<ClothDtls> getTrendingCloth() {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where status=?  order by clothId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ClothDtls> getOldCloth() {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where clothCategory=? and status=?  order by clothId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public List<ClothDtls> getAllTrendingClothes() {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where status=?  order by clothId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<ClothDtls> getAllNewClothes() {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where clothCategory=? and status=?  order by clothId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<ClothDtls> getAllOldClothes() {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where clothCategory=? and status=?  order by clothId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<ClothDtls> getClothByOld(String email, String category) {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where clothCategory=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public boolean oldClothDelete(String email, String category, int clothId) {
		
		boolean f = false;
		try {
			String sql = "delete from cloth_dtls where clothCategory=? and email=? and clothId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			ps.setInt(3,  clothId);
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	public List<ClothDtls> getClothBySearch(String ch) {
		List<ClothDtls> list = new ArrayList<ClothDtls>();
		ClothDtls c = null;
		try {
			String sql = "select * from cloth_dtls  where clothName like ? or clothCategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "Active");
			

			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				c = new ClothDtls();
				c.setClothId(rs.getInt(1));
				c.setClothName(rs.getString(2));
				c.setPrice(rs.getString(3));
				c.setClothCategory(rs.getString(4));
				c.setStatus(rs.getString(5));
				c.setPhotoName(rs.getString(6));
				c.setEmail(rs.getString(7));
				list.add(c);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	

}

