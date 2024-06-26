package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_cloth")
public class RemoveClothCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int clothId = Integer.parseInt(req.getParameter("clothId"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		int cartId = Integer.parseInt(req.getParameter("cartId"));
		
		
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteCloth(clothId, userId, cartId);
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg", "Cloth Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something wrong on server");
			resp.sendRedirect("checkout.jsp");	
		}
		
	}

}
