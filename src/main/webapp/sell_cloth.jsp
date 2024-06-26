<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Cloth</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #a1887f">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Sell Old Cloth</h5>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<form action="add_old_cloth" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email}" name="user">

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
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="cimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>