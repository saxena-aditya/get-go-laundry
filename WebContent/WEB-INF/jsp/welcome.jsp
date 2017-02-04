<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>${company_details.getCompany_name()} | Laundry</title>
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/footer-css.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/default.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/side-bar.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/welcome_page.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/alertify.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testFile.css">

<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">

<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/costCounter.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery-ui.js"></script>

<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/alertify.min.js"></script>

</head>
<body>
<img id="background-image-side-bubbles" src="${pageContext.request.contextPath}/resources/visuals/side-bubbles.PNG" alt ="blue-bubbles">


<!-- Upper drawer and side navigation menu -->
<jsp:include page = "drawers.jsp" />
<!-- Upper drawer and side navigation menu -->

<!-- Order form starting! -->
<div class = "latest-order-container">
 <c:choose>
  
 <c:when test="${latestoList[0].getOrder_stage()=='PROCESSING'}">
 <div class="seeker">
 	<div class="seeker-1">
 		<%@ include file="table.jsp" %>
 	</div>
 	<div class="seeker-2">
<div class="panel panel-primary teller">
      <div class="panel-heading"><h2>Latest Order</h2>
      </div>
      <div class="panel-body">
      	<c:forEach items="${latestoList}" var="latestoList" varStatus = "sts">
      	<p> ${latestoList.getOrder_id()} </p>
      	<p> ${latestoList.getOrder_date()} </p>
      	<p> Rs. ${LatestOcost} </p>
      	<p> Order Recieved  </p>
      	</c:forEach>
      </div>
    </div>



<div class= "cancle-order-form">
 <form id = "cancel-order" action = "order_cancel" method = "GET">
  <img id = "submit-image" src = "${pageContext.request.contextPath}/resources/visuals/cross.png"  alt = "image"></img>
 </form>
 </div>
 </div>
 </div>
  </c:when>
<c:otherwise>
<div class="seeker">
 	<div class="seeker-1">
 		<%@ include file="table.jsp" %>
 	</div>
 	<div class="seeker-2">
     <!-- the user has not made any orderers till now  -->
    <button class="btn btn-default order-btn" data-toggle = "modal" data-target="#banner-text" title="" id="btnClick">Order Now&nbsp;&nbsp;<span class="glyphicon glyphicon-shopping-cart gly"></span></button>
		<div class="banner-display">
			<div class="inside-banner">
				<p id="blanner-text">${company_details.getBanner_text()}</p>
			<span class="glyphicon glyphicon-gift" id="gift-ico"></span>
			</div>
		</div>
</div>
</div>
</c:otherwise>
</c:choose>
<script>
$(document).ready(function(){
	$("#table-l").tablesorter(); 
	$("#home").addClass("activate");
	$('#submit-image').click(function(){
		// can use alertify for showing a prompt, for deleting the order 
		// and them testing the option for processing request! :D
	alertify.confirm('Confirm Delete.', 'Do you want to delete this Order?', 
			function(){ 
				$('#cancel-order').submit();
				},
		    function(){
        	//do something
        	});
		});
	});
</script>
</div>
<%@ include file="order-form.jsp" %>


<!-- ==================================================== -->
<%@ include file="login-footer.jsp" %>
	
	<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.tablesorter.min.js"></script>
	
	</body>
</html>