<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<title>About Us</title>
	<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/about-us.css" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/navbar-css.css" />
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testFile.css">
	
</head>
<body>
	
		<jsp:include page="navbar.jsp" /> 
   <div class="container contain">
   	 <div class="row">
   	   <div class="col-md-3">	
	     <div class="side-pannel">
		   <ul class="nav">
			     <li><a href="#">More FAQs</a></li>
			     <li><a href="#">Contact Info</a></li>
			     <li><a href="#">Company History</a></li>
			     <li><a href="#">Our Policies</a></li>
			     <li><a href="#">Feedback</a></li> 
		    </ul>
		 </div>
	   </div>
	   <div class="col-md-9 col9">
	   <div class="about-cmpny">
	   <h2>About ${company_details.getCompany_name()}</h2>
	   </div>
	   <div class="content">
	   <p>Gunnar Optiks DES-50101 SteelSeries Desmo protective computer glasses will protect you from 
	   	those harmful radiations that can damage your eyes while you are busy working on333 computers
	    or playing that awesome graphic game that you downloaded tomorrow. The glasses are said to 
	    cover a whole lot of area before your eyes and block all the high radiation light from 
	    entering your eyes.  Preventing the high energy radiation from entering the eyes, you will 
	    be able to keep your eyes safe for a longer period of time. These emissions actually are 
	    quite harmful to the eyes and can cause dry red eyes and headaches if not taken care of properly.<p>
     </div>
   </div>
   </div>
   </div>
   
   <div class="new-div"></div>
	
	
	 <%@ include file="footer.jsp" %>
</body>
</html>