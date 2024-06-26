<%@page import="com.entity.ClothDtls"%>
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
<title>Admin: Add Cloth</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #a1887f">
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Cloth</h4>
						
						
						<%
						int id =Integer.parseInt(request.getParameter("id"));
						ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
						ClothDtls c = dao.getClothById(id);
						%>
						
						<form action="../editCloth" method="post">
							
							<input type="hidden" name="id" value="<%=c.getClothId()%>">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Cloth Name*</label> <input
									name="cname" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=c.getClothName() %>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=c.getPrice() %>">
							</div>


							<div class="form-group">
								<label for="inputState">Cloth Status</label> <select
									id="inputState" name="status" class="form-control">
									<% if("Active".equals(c.getStatus()))
									{%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									<%}
									else
									{%>
										<option value="Inactive">Inactive</option>
										<option value="Active">Active</option>
									<%
									}
									%>
									
									
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<br><br><br>
<%@include file="footer.jsp"%>
</body>
</html>