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
	
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp" />
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Cloth</h4>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<form action="../addCloth" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Cloth Name*</label> <input
									name="cname" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="inputState">Cloth Category</label> <select
									id="inputState" name="category" class="form-control">
									<option selected>--Select--</option>
									<option value="New">New Cloth</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Cloth Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

					
								<div class="form-group">
									<label for="exampleFormControlFile1">Upload Photo</label>
									<input name="cimg"type="file" class="form-control-file"
										id="exampleFormControlFile1">
								</div>
								<button type="submit" class="btn btn-primary">Add</button>
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