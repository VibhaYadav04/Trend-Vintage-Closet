package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ClothDAOImpl;
import com.DB.DBConnect;
import com.entity.ClothDtls;

@WebServlet("/editCloth")
public class EditClothServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id= Integer.parseInt(req.getParameter("id"));
			String clothName = req.getParameter("cname");
			String price = req.getParameter("price");
			String status = req.getParameter("status");

			ClothDtls c = new ClothDtls();
			c.setClothId(id);
			c.setClothName(clothName);
			c.setPrice(price);
			c.setStatus(status);
			
			ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditCloth(c);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Cloth Updated Succesfully");
				resp.sendRedirect("admin/all_clothes.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something Wrong on Server");
				resp.sendRedirect("admin/all_clothes.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
