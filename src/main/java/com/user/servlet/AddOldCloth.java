package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ClothDAOImpl;
import com.DB.DBConnect;
import com.entity.ClothDtls;

@WebServlet("/add_old_cloth")
@MultipartConfig
public class AddOldCloth extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String clothName = req.getParameter("cname");
			String price = req.getParameter("price");
			String category = "Old";
			String status = "Active";
			Part part = req.getPart("cimg");
			String fileName = part.getSubmittedFileName();
			String userEmail = req.getParameter("user");
			
			ClothDtls c = new ClothDtls(clothName, price, category,  status, fileName, userEmail);
			//System.out.println(c);
			
			ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			
			
			boolean f = dao.addCloth(c);
			HttpSession session = req.getSession();
			
			if(f)
			{
				String path = getServletContext().getRealPath("")+"cloth";
				
				File file = new File(path);
				part.write(path +File.separator + fileName);
				session.setAttribute("succMsg", "Cloth Added Succesfully");
				resp.sendRedirect("sell_cloth.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something Went Wrong on Server");
				resp.sendRedirect("sell_cloth.jsp");
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
