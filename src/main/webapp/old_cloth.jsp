<%@page import="com.entity.ClothDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
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
<title>User: Old Cloth</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>


<c:if test="${not empty succMsg}" >
				         <p class="text-center text-success">${succMsg}</p>
				         <c:remove var="succMsg" scope="session"/>
				    </c:if>
				    <c:if test="${not empty failedMsg}">
					   <h5 class="text-center text-danger">${failedMsg}</h5>
					   <c:remove var="failedMsg" scope="session"/>
					</c:if>

<div class="container p-5">
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Cloth Name</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u = (User) session.getAttribute("userobj");
  String email = u.getEmail();
  
  
  
  ClothDAOImpl  dao = new ClothDAOImpl(DBConnect.getConn());
  List<ClothDtls> list = dao.getClothByOld(email, "Old");
  for(ClothDtls c : list)
  {
  %>
  <tr>
      <td><%=c.getClothName() %></td>
      <td><%=c.getPrice() %></td>
      <td><%=c.getClothCategory() %></td>
      <td><a href="delete_old_cloth?em=<%=email %>&&clothId=<%= c.getClothId() %>" class="btn btn-sm btn-danger">Delete</a></td>
    </tr>
  <%
  } 
  %>
  
  
    
    
  </tbody>
</table>
</div>
</body>
</html>