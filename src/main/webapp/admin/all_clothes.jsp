<%@page import="com.entity.ClothDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ClothDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Clothes</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3>Hello Admin</h3>
	<c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg}</h5>
						<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<h5 class="text-center text-danger">${failedMsg}</h5>
						<c:remove var="failedMsg" scope="session" />
						</c:if>
	
	
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Cloth Name</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			List<ClothDtls> list = dao.getAllClothes();
			for (ClothDtls c : list) {
			%>
			<tr>
				<td><%=c.getClothId()%></td>
				<td><img src="../cloth/<%=c.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=c.getClothName()%></td>
				<td><%=c.getPrice()%></td>
				<td><%=c.getClothCategory()%></td>
				<td><%=c.getStatus()%></td>
				<td><a href="edit_cloth.jsp?id=<%=c.getClothId() %>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a> <a
					href="../deleteCloth?id=<%=c.getClothId() %>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<%@include file="footer.jsp"%>
</body>
</html>