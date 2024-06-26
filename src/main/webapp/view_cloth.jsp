<%@page import="com.entity.User"%>
<%@page import="com.entity.ClothDtls"%>
<%@page import="com.DAO.ClothDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #a1887f">
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
	ClothDtls c = dao.getClothById(cid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="cloth/<%=c.getPhotoName()%>"
					style="height: 150px; width: 100px"><br>
				<h4 class="mt-3">
					Cloth Name: <span class="text-success"><%=c.getClothName()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=c.getClothCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=c.getClothName()%></h2>

				<%
				if ("Old".equals(c.getClothCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope"></i>Email:
					<%=c.getEmail()%></h5>
				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(c.getClothCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fas fa-cart-plus"></i>Continue Shopping</a> <a href=""
						class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="cart?clothId=<%=c.getClothId()%>&&userId=<%=u.getId()%>"
						class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add to
						Cart</a> <a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i>200</a>

				</div>

				<%
				}
				%>

			</div>

		</div>
	</div>
</body>
</html>