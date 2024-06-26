<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECloth: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #a1887f">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2"></div>
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="class-body">
				<h4 class="text-center">Registration Page</h4>
				
				    <c:if test="${not empty succMsg}" >
				         <p class="text-center text-success">${succMsg}</p>
				         <c:remove var="succMsg" scope="session"/>
				    </c:if>
				    
				    <c:if test="${not empty failedMsg}" >
				         <p class="text-center text-danger">${failedMsg}</p>
				         <c:remove var="failedMsg" scope="session"/>
				    </c:if>
				    
					<form action="register" method=post>
						<div class="form-group">
							<label for="exampleInputEmail1" class="ps-2">&nbsp;&nbsp;&nbsp;&nbsp;Enter Full Name</label> 
							<input type="text" class="form-control mx-auto" id="exampleInputEmail1" aria-describedby="emailHelp" style="width: 85%;" required="required" name="fname">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;&nbsp;Email address</label> 
							<input type="email" class="form-control mx-auto" id="exampleInputEmail1" aria-describedby="emailHelp" style="width: 85%;" required="required" name="email">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;&nbsp;Enter Phone No.</label> 
							<input type="number" class="form-control mx-auto" id="exampleInputEmail1" aria-describedby="emailHelp" style="width: 85%;" required="required"name="phno">

						</div>

						<div class="form-group">
							<label for="exampleInputPassword1">&nbsp;&nbsp;&nbsp;&nbsp;Password</label> 
							<input type="password" class="form-control mx-auto" id="exampleInputPassword1" style="width: 85%;" required="required" name="password">
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1" style="width: 14%;" name="check"> 
						    <label class="form-check-label" for="exampleCheck1" >&nbsp;&nbsp;&nbsp;&nbsp;Agree Terms and Conditions</label>
						</div>
						<div class="text-center">
						   <button type="submit" class="btn btn-primary" style="width: 50%;">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>