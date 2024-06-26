<%@page import="com.entity.Cloth_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ClothOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
    <c:if test="${empty userobj}">
    <c:redirect url="login.jsp"></c:redirect>
    </c:if>	

    <%@ include file="navbar.jsp"%>
    <h3>Hello Admin</h3>
    <table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone No.</th>
      <th scope="col">Cloth Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
            <%
            ClothOrderImpl dao = new ClothOrderImpl(DBConnect.getConn());
			List<Cloth_Order> clist = dao.getAllOrder();
			for(Cloth_Order c : clist)
			{%>
				<tr>
					<th scope="row"><%= c.getOrderId() %></th>
					<td><%=c.getUsername() %></td>
					<td><%=c.getEmail() %></td>
					<td><%=c.getFulladd() %></td>
					<td><%=c.getClothName() %></td>
					<td><%=c.getPrice() %></td>
					<td><%=c.getPayementType() %></td>
				</tr>
				
			<%}	
			%>     
    </tr>
    
  </tbody>
</table>
<br><br><br>
<%@include file="footer.jsp"%>
</body>
</html>