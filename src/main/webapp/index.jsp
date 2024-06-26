<%@page import="com.entity.User"%>
<%@page import="com.entity.ClothDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ClothDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECloth : Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/3.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

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
	<div class="container-fluid back-img">
		<h2 class="text-center" style="color:#5d4037"><u>Trend-Vintage Closet</u></h2>
	</div>

    <% Connection conn =  DBConnect.getConn();
       //out.println(conn);
    %>

	<!-- Start of Trending Clothes -->

	<div class="container">
		<h3 class="text-center">Trending Clothes</h3>
		<div class="row">
		<%
		 ClothDAOImpl dao2 = new ClothDAOImpl(DBConnect.getConn());
	    List<ClothDtls> list2 = dao2.getTrendingCloth();
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
		<div class="text-center mt-1">
			<a href="all_trending_cloth.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End of Trending Clothes -->

	<hr>

	<!-- Start of New Clothes -->
	<div class="container">
		<h3 class="text-center">New Clothes</h3>
		<div class="row">
			    <%
			    ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			    List<ClothDtls> list = dao.getNewCloth();
			    for (ClothDtls c : list)
			    { %>
			    <div class="col-md-3">
			         <div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="cloth/<%=c.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=c.getClothName()%></p>
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
					</div>
				</div>
				</div>
			    
			    
			    <% 	
			    }
			    %>
		
		</div>
		<div class="text-center mt-1">
			<a href="all_new_cloth.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End of New Clothes -->

	<hr>

	<!-- Start of Old Clothes -->

	<div class="container">
		<h3 class="text-center">Old Clothes</h3>
		<div class="row">
				<%
		 ClothDAOImpl dao3 = new ClothDAOImpl(DBConnect.getConn());
	    List<ClothDtls> list3 = dao3.getOldCloth();
	    for (ClothDtls c : list3)
	    {
		%>
		<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="cloth/<%=c.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=c.getClothName()%></p>
						<p>Category:<%=c.getClothCategory() %></p>
							<div class="row"> 
							<a href="view_cloth.jsp?cid=<%=c.getClothId() %>" class="btn btn-success btn-sm ml-5">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i><%=c.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
			<%}%>
			
		</div>
		
		<div class="text-center mt-1">
			<a href="all_old_cloth.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End of Old Clothes -->

<%@include file="all_component/footer.jsp"%>
</body>
</html>