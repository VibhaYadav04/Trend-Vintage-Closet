<%@page import="com.entity.User"%>
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
<title>All Trending Clothes</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #d7ccc8;
	}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}	

</style>
</head>
<body style="background-color: #a1887f">

   <%
    User u = (User) session.getAttribute("userobj");
    %>


<c:if test="${not empty addCart }">
<div id="toast">${addCart }</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>
</c:if>


<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid">
		<div class="row p-3">
			    <%
			    ClothDAOImpl dao = new ClothDAOImpl(DBConnect.getConn());
			    List<ClothDtls> list = dao.getAllNewClothes();
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
		</div>
</body>
</html>