<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/side-bar.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/prices-page.css" />

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
        <th>Categories</th>
        
        <th>Prices</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>T-shirt</td>
        <td>Rs. ${itm.tshirt}</td>
       </tr>
       
       <tr>
        <td>shirt</td>
        <td>Rs. ${itm.shirt}</td>
        
      </tr>
      <tr>
        <td>Plane Pants </td>
        <td>Rs. ${itm.pants}</td>
        
      </tr>
      <tr>
        <td>Daily Towels</td>
        <td>Rs. ${itm.towel}</td>
        
      </tr>
      <tr>
        <td>Formal Coats</td>
        <td>Rs. ${itm.coat}</td>
        
      </tr>
      <tr>
        <td>Casual Jeans</td>
        <td>Rs. ${itm.jeans}</td>
        
      </tr>
      <tr>
        <td>Hoodie</td>
        <td>Rs. ${itm.hoodie}</td>
        
      </tr>
     
      </tbody>
    
</table>


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