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

<img id = "order-save-image" class = "img-circle" src= "${pageContext.request.contextPath}/resources/visuals/saved_order.png" alt = "order-saved"></img>

<div class = "order-display">
<h3>Your OrderID is : ${orderID}</h3>
<c:choose>
<c:when test = "${empty isFirstOrder}">
<span id="order-simple-cost">Order Cost = ${orderCost}</span>

</c:when>
<c:otherwise>
<span id="order-simple-cost" class = "crossed-over">Order Cost = ${orderCost}</span>
<p id="order-simple-cost">Order Cost : <c:out value = "${orderCost* 0.4}"/> (after first time discount!)</p>


</c:otherwise>

</c:choose>

</div>
<div id = "orderDetails"></div>

<script type = "text/javascript">

$(document).ready(function(){
	alertify.success('Your order has been recieved :)'); 

});
</script>
<!-- footer  -->
<jsp:include page = "footer.jsp" />
<!-- footer ending -->
</body>
</html>