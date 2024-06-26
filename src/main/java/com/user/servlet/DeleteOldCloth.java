package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ClothDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_cloth")
public class DeleteOldCloth extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("em");
		    int clothId = Integer.parseInt(req.getParameter("clothId"));
			ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			
			boolean f = dao.oldClothDelete(em, "Old", clothId);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Old Cloth Deleted Successfully");
				resp.sendRedirect("old_cloth.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("old_cloth.jsp");	
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
