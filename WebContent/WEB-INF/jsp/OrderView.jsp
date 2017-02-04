<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order #${order_id }</title>
</head>
<body>
<div class="section-1">
	<div class="section-heading">
		<h3>User Details</h3>
		<hr>
	</div>
	<div class="section-2">
		<div class="name">
			<div id="first-name">
			<span id="name">First Name : </span><span id="fname">${user_details.getFirstName()}</span>
			</div>
			<div id="last-name">
			<span id="name">Last Name : </span><span id="fname">${user_details.getLastName()}</span>
			</div>
		</div>
		<div id="phone">
			<span id="phone">Contact :</span><span id="contant_number">${user_details.getPhone()}</span>
		</div>
		<div id="address">
			<div id="add-sec">
				<span id="add">Address : </span><span id="add1">${user_details.getAddress1()}</span>
			</div>
			<div id="add-sec">
				<span id="add1">${user_details.getAddress2()}</span>
			</div>
		</div>
	
	</div>
	</div>
	<div class="section-2">
	<div id="order_details">
		<div class="section-heading">
			<h3>Order Details</h3>
			<hr>
		</div>
		<div class="order_s">
			<span id="order_id">Order # : ${order_details[0].getOrder_id() }</span><br>
			<span id="date">Pickup Date : ${order_details[0].getOrder_date()}</span><br>
			<span id="date">Pickup Time : ${order_details[0].getOrder_time()}</span><br>
		
		</div>
		<div class="order_items">
			<table>
				<thead>
					<tr>
						<th>Item Code</th>
						<th>Item Count</th>
						<th>Total Item Cost</th>
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${order_details}" var="item" >
					<tr>
						<td>${item.getCloth_code()}</td>
						<td>${item.getItem_count() }</td>
						<td>${item.getTotal_item_cost() }</td>
					</tr>
					
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
<div class="row start">
	<div class="col-md-"></div>
</div>

</body>
</html>