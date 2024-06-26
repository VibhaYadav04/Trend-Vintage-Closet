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

@WebServlet("/deleteCloth")
public class DeleteClothServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteCloth(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Cloth Deleted Succesfully");
				resp.sendRedirect("admin/all_clothes.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Wrong on Server");
				resp.sendRedirect("admin/all_clothes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
