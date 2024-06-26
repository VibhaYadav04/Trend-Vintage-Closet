<%@page import="com.entity.ClothDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ClothDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Clothes</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #d7ccc8;
}
</style>
</head>
<body style="background-color: #a1887f">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
				<%
		 ClothDAOImpl dao3 = new ClothDAOImpl(DBConnect.getConn());
	    List<ClothDtls> list3 = dao3.getAllOldClothes();
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
		</div>
	</div>
</body>
</html>