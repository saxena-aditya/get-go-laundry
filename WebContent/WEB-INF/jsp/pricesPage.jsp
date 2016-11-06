<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.js"></script>

</head>
<body>
<p>${itm.hoodie} h h</p>
<div class = "row">
<div class ="col-md-2"></div>
<div class = "col-md-7">
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
</div>
<div class = "col-md-3"></div>
<script type = "text/javascript">
	
	var doc = "${itm.hoodie}"

  $(document).ready(function(){
	alert(doc);
});


</script>

</body>
</html>