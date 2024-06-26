package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ClothDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ClothDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int clothId=Integer.parseInt(req.getParameter("clothId"));
			int userId = Integer.parseInt(req.getParameter("userId"));
			
			ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			ClothDtls c = dao.getClothById(clothId);
			
			Cart ca = new Cart();
			ca.setClothId(clothId);
			ca.setUserId(userId);
			ca.setClothName(c.getClothName());
			ca.setPrice(Double.parseDouble(c.getPrice()));
			ca.setTotalPrice(Double.parseDouble(c.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(ca);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
			    session.setAttribute("addCart", "Cloth Added to Cart");
			    resp.sendRedirect("all_new_cloth.jsp");
			}
			else
			{
				session.setAttribute("failed", "Something wrong on server");
			    resp.sendRedirect("all_new_cloth.jsp");
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
