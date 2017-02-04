<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />


<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>

<title>Orders : ${stage} </title>
</head>
<body>

<div class="envelop">
	<div class="heading">
		<div class="text-heading">
			<h2>Orders : ${stage }</h2>
		</div>
	</div>
	<div class="orders">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>User</th>
					<th>Order_ID</th>
					
					<th>Order Pickup Date</th>
					<th>Order Pickup time</th>
					<th>Order Stage</th>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach items="${order_by_stage}" var="list">
					<tr>
						<td>${list.getUser()}</td>
						<td>${list.getOrder_id() }</td>
						<td>${list.getOrder_date()}</td>
						<td>${list.getOrder_time()}</td>
						<td>${list.getOrder_stage()}</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>
</div>

</body>
</html>