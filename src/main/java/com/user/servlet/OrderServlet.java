package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ClothOrderImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Cloth_Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("paymentType");
			
			String fullAdd = address+","+landmark+","+city+","+state+","+pincode;
			
			
			
			CartDAOImpl dao =  new CartDAOImpl(DBConnect.getConn());
			
			List <Cart> clist = dao.getClothByUser(id);
			
			if (clist.isEmpty())
			{
				session.setAttribute("failedMsg", "Add Item");
				resp.sendRedirect("checkout.jsp");
			}
			else
			{
				ClothOrderImpl dao2 = new ClothOrderImpl(DBConnect.getConn());
				
				Cloth_Order o =null;
				
				ArrayList<Cloth_Order> orderList = new ArrayList<Cloth_Order>();
				
				Random r = new Random();
				
				for(Cart c: clist)
				{
					o= new Cloth_Order();
					o.setOrderId("ORD-00"+ r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setClothName(c.getClothName());
					o.setPrice(c.getPrice()+" ");
					o.setPayementType(paymentType);
					orderList.add(o);
				}
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg", "Choose Payement Method");
					resp.sendRedirect("checkout.jsp");
				}
				else
				{
					boolean f = dao2.saveOrder(orderList);
					if(f)
					{
						resp.sendRedirect("order_success.jsp");
					}
					else
					{
						session.setAttribute("failedMsg", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
