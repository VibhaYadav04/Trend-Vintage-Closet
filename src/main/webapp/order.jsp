<%@page import="java.util.List"%>
<%@page import="com.entity.Cloth_Order"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ClothOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Cloth</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
    </c:if>	

	<%@include file="all_component/navbar.jsp"%>


	
	<div class="container">
	<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-striped mt-5">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Oder Id</th>
					<th scope="col">Name</th>
					<th scope="col">Cloth Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			User u = (User) session.getAttribute("userobj");
			ClothOrderImpl dao = new ClothOrderImpl(DBConnect.getConn());
			List<Cloth_Order> clist = dao.getCloth(u.getEmail());
			for(Cloth_Order c : clist)
			{%>
				<tr>
					<th scope="row"><%= c.getOrderId() %></th>
					<td><%=c.getUsername() %></td>
					<td><%=c.getClothName() %></td>
					<td><%=c.getPrice() %></td>
					<td><%=c.getPayementType() %></td>
				</tr>
				
			<%}	
			%>
			
				
				
			</tbody>
		</table>
	</div>
</body>
</html>