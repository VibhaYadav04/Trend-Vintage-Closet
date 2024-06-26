<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECloth: Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#a1887f">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2"></div>
	<div class="row mt-2">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="class-body">
					<h4 class="text-center">Login Page</h4>
					
					<c:if test="${not empty failedMsg}">
					   <h5 class="text-center text-danger">${failedMsg}</h5>
					   <c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty succMsg}">
					   <h5 class="text-center text-success">${succMsg}</h5>
					   <c:remove var="succMsg" scope="session"/>
					</c:if>
					
					<form action="login" method="post">
						
						<div class="form-group">
							<label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;&nbsp;Email address</label> 
							<input type="email" class="form-control mx-auto" id="exampleInputEmail1" aria-describedby="emailHelp" style="width: 85%;" required="required" name="email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">&nbsp;&nbsp;&nbsp;&nbsp;Password</label> 
							<input type="password" class="form-control mx-auto" id="exampleInputPassword1" style="width: 85%;" required="required"name="password">
						</div>
						
						<div class="text-center">
						   <button type="submit" class="btn btn-primary" style="width: 50%;">Login</button><br>
						   <a href="register.jsp">Create Account</a>
						</div>
						<br>
					</form>
				</div>
			</div>
		</div>
	</div>

    <br><br>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>