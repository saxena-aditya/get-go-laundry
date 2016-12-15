<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/side-bar.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/history-page.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/popform.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/default.min.css" />

<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery-ui.js"></script>


<title>Order History</title>
</head>
<body>
<img id="background-image-side-bubbles" src="${pageContext.request.contextPath}/resources/visuals/side-bubbles.PNG" alt ="blue-bubbles">

<!-- Upper drawer and side navigation -->

<jsp:include page = "drawers.jsp" />

<!-- Upper drawer and side navigation -->


<div class = "container table-container">

<c:choose>
<c:when test = "${empty oList}">
<!-- One time but awesome thing 
	show you have not made any 
	order yet, please make one now! -->
	

<p>List is Empty</p>
</c:when>
<c:otherwise>
<table class = "table table-bordered">
<thead>
<tr class="table-head">
<th>Order ID</th>
<th>Order Date</th>
<th>Total Cost</th>
</tr>
</thead>
<tbody>
<c:forEach items="${oList}" var="list" varStatus = "sts">

	

    <c:if test = "${not empty list.getOrder_id()}">
    
	<tr>
    <td><a href = "#"><c:out value="${list.getOrder_id()}"/></a></td>
    <td><c:out value="${list.getOrder_date()}"/></td>
    <td><c:out value="${costList[sts.index]}"/></td>
    </tr>
    </c:if>
    </c:forEach>

</tbody>

</table>


</c:otherwise>
</c:choose>

</div>

<script>
 
$(document).ready(function(){
	$('#order-form').addClass("disabled")
	$('#btnClick').tooltip({
						content : "Please move to Home for ordering."
					});
	
		
	

});
</script>

</body>
</html>