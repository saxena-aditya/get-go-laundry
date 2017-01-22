<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/default.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/alertify.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/order-done.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/side-bar.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/footer-css.css" />

<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">

<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/alertify.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<img id="background-image-side-bubbles" src="${pageContext.request.contextPath}/resources/visuals/side-bubbles.PNG" alt ="blue-bubbles">


<!-- Upper drawer and side navigation -->

<jsp:include page = "drawers.jsp" />

<!-- Upper drawer and side navigation -->
<div class="container">
<div class="col-md-6">

<img id = "order-save-image" class = "img-circle" src= "${pageContext.request.contextPath}/resources/visuals/saved_order.png" alt = "order-saved"></img>

<div class = "order-display">
<h3>Your Order ID is : ${orderID}</h3>


<c:choose>
<c:when test = "${empty isFirstOrder}">
<span id="order-simple-cost">Order Cost = Rs. ${orderCost}</span>

</c:when>
<c:otherwise>
<span id="order-simple-cost" class = "crossed-over">Order Cost = ${orderCost}</span>
<p id="order-simple-cost">Order Cost : <c:out value = "${orderCost*(100-company_details.off_percentage)/100}"/> (after first time discount!)</p>


</c:otherwise>

</c:choose>

</div>
</div>
<div class="col-md-6 order-table">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Items</th>
				<th>Quantity</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:if test="${takenOrder.getTshirt() != 0 }">
				<td>T-Shirt</td>
				<td>${takenOrder.getTshirt()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getShirt() != 0 }">
				<td>Shirt</td>
				<td>${takenOrder.getShirt()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getPant() != 0 }">
				<td>Pants</td>
				<td>${takenOrder.getPant()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getJeans() != 0 }">
				<td>Jeans</td>
				<td>${takenOrder.getJeans()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getCcoat() != 0 }">
				<td>Casual Coat</td>
				<td>${takenOrder.getCcoat()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getFcoat() != 0 }">
				<td>Formal Coat</td>
				<td>${takenOrder.getFcoat()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getSweater() != 0 }">
				<td>Sweater</td>
				<td>${takenOrder.getSweater()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getJacket() != 0 }">
				<td>Jacket</td>
				<td>${takenOrder.getJacket()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getBlanketL() != 0 }">
				<td>Light Blanket</td>
				<td>${takenOrder.getBlanketL()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getBlanketH() != 0 }">
				<td>Heavy Blanket</td>
				<td>${takenOrder.getBlanketH()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getBlanketLU() != 0 }">
				<td>Luxary Blanket</td>
				<td>${takenOrder.getBlanketLU()}</td>
				</c:if>
			</tr>
			
			<tr>
				<c:if test="${takenOrder.getOther() != 0 }">
				<td>Other Cloths</td>
				<td>${takenOrder.getOther()}</td>
				</c:if>
			</tr>
		</tbody>
	</table>

</div>
</div>

<script type = "text/javascript">

$(document).ready(function(){
	alertify.success('Your order has been recieved :)'); 
	$("#order_history").addClass("activate");
	$('#order-form').addClass("disabled")
	$('#btnClick').tooltip({ content : "Please move to Home for ordering."});

});
<script>


</script>

</body>
</html>