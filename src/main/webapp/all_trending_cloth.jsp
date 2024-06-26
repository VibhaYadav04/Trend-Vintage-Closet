<%@page import="com.entity.User"%>
<%@page import="com.entity.ClothDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ClothDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Trending Clothes</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #d7ccc8;
}
</style>
</head>
<body style="background-color: #a1887f">

    <%
    User u = (User) session.getAttribute("userobj");
    %>

<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid">
		<div class="row p-3">
			<%
		     ClothDAOImpl dao2 = new ClothDAOImpl(DBConnect.getConn());
	         List<ClothDtls> list2 = dao2.getAllTrendingClothes();
	         for (ClothDtls c : list2)
	         {
		     %>
		     <div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="cloth/<%=c.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=c.getClothName()%></p>
						
						<%
						if(c.getClothCategory().equals("Old"))
						{%>
						<p>Category:<%=c.getClothCategory() %></p>
							<div class="row"> 
							<a href="view_cloth.jsp?cid=<%=c.getClothId() %>" class="btn btn-success btn-sm ml-5">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i><%=c.getPrice() %></a>
						</div>
						<%}
						else
						{
						%>
						<p>Category:<%=c.getClothCategory() %></p>
						<div class="row">
								<% 
						if(u == null) 
						{
						%>
							<a href="login.jsp" class="btn btn-danger btn-sm"> <i class="fas fa-cart-plus"></i>Add Cart</a>
						<%	   
						}
						else
						{
						%>
						   <a href="cart?clothId=<%=c.getClothId()%>&&userId=<%=u.getId() %>" class="btn btn-danger btn-sm"> <i class="fas fa-cart-plus"></i>Add Cart</a>
						<%} 
						%>
 
							<a href="view_cloth.jsp?cid=<%=c.getClothId() %>" class="btn btn-success btn-sm">View Details</a> 
							<a href="" class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i><%=c.getPrice() %></a>
						</div>
						<%} %>
					</div>
				</div>
			</div>
			<%} %>
		
			</div>
		</div>
</body>
</html>