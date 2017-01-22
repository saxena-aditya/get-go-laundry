<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/side-bar.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/prices-page.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/footer-css.css" />

<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">


<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery-ui.js"></script>

</head>
<body>
 
<img id="background-image-side-bubbles" src="${pageContext.request.contextPath}/resources/visuals/side-bubbles.PNG" alt ="blue-bubbles">

<!-- Upper drawer and side navigation -->

<jsp:include page = "drawers.jsp" />

<!-- Upper drawer and side navigation -->

<div class = "table-holder">
<table class="table table-hover">
    <thead>
      <tr>
      <th></th>
        <th>Categories</th>
        
        <th>Prices</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${item_price}" var="list" >
    		<c:choose>
    			<c:when test="${list.getItem_name() == 'tshirt'}">
    				 <tr>
    				<td class="image-td">
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/T-Shirt.png" alt="cloth-image">
        				</td>
        				<td style="width: 250px;">T-Shirt</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'shirt'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Shirt.png" alt="cloth-image">
        				</td>
        			
        				<td>Shirt</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'pant'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Pant.png" alt="cloth-image">
        				</td>
        			
        				<td>Pants</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'jeans'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Jeans.png" alt="cloth-image">
        				</td>
        			
        				<td>Jeans</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'ccoat'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Casual-Coat.png" alt="cloth-image">
        				</td>
        			
        				<td>Causal Coat</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'fcoat'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Formal-Coat.png" alt="cloth-image">
        				</td>
        			
        				<td>Formal Coat</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'sweater'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Sweater.png" alt="cloth-image">
        				</td>
        			
        				<td>Sweater</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'jacket'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Jacket.png" alt="cloth-image">
        				</td>
        			
        				<td>Jacket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'blanketL'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Blanket-Heavy.png" alt="ccloth-image">
        				</td>
        			
        				<td>Large Blanket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'blanketH'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Blanket-Large.png" alt="cloth-image">
        				</td>
        			
        				<td>Heavy Blanket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'blanketLU'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Blanket-Luxary.png" alt="t-shirt">
        				</td>
        			
        				<td>Luxary Blanket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    			<c:when test="${list.getItem_name() == 'other'}">
    				 <tr>
    				 <td>
    				 <img class="item-image" src="${pageContext.request.contextPath}/resources/visuals/items/Others.png" alt="t-shirt">
    				 	</td>
        			
        				<td>Other Clothes</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			
    		
    		</c:choose>
    		
    	</c:forEach>
    
      </tbody>
    
</table>


</div>
<script>
 
$(document).ready(function(){
	$(".prices").addClass("activate");
	
	$('#order-form').addClass("disabled")
	$('#btnClick').tooltip({
						content : "Please move to Home for ordering."
					});
	
		
	

});
</script>

</body>
</html>