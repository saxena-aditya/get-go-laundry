<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		<meta charset="utf8">
		<title>Test Form</title>
	
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testFile.css">
		
		<link href="https://fonts.googleapis.com/css?family=Lato|Quicksand" rel="stylesheet">
		
		
		<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
		<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
	
	
	</head>
	<body>
	
	<button class="btn btnl" data-toggle = "modal" data-target="#banner-text">Bannar Text</button>
	
	<div id="banner-text" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Select Your Order!</h2>
      </div>
      <div class="modal-body">
      
        <form class="form-horizontal"  action="updateBannerText" method="POST">
			<div class="top-btns">
				<button class="top-left" id="top-left" >Simple Wash</button>
				<button class="top-right" id="top-right">Dry Wash</button> 
			</div>  
			<div class="form-holder">
		   <div class="row">
		   		<div class="col-md-6">		
		   			<label for="item_name">Item Name</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control"  id="id" name="name" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   <div class="row">
		   		<div class="col-md-6">		
		   			<label for="item_name">Item Name</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control"  id="id" name="name" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   <div class="row">
		   		<div class="col-md-6">		
		   			<label for="item_name">Item Name</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control"  id="id" name="name" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   <div class="row">
		   		<div class="col-md-6">		
		   			<label for="item_name">Item Name</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control"  id="id" name="name" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   <div class="row">
		   		<div class="col-md-6">		
		   			<label for="item_name">Item Name</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control"  id="id" name="name" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   <div class="row">
		   		<div class="col-md-6">		
		   			<label for="item_name">Item Name</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control"  id="id" name="name" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl  btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div class="body-div"></div>
	<footer>
		<div class="footer-div">
			<div class="container-cont">
			<div class="row">
				<div class="col-md-4">
					<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Our Company</h3>
      					</div>
     					<div class="panel-body panel-div-body">
	     					<ul>
	     						<li><a href="#" id="#">Who are we?</a></li>
	     						<li><a href="#" id="#">Why are we?</a></li>
	     						<li><a href="#" id="#">Our Achievements</a></li>
	     						<li><a href="#" id="#">How can we be of help?</a></li>
     					 	</ul>
     					 </div>
    				</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Customer Support</h3>
      					</div>
     					<div class="panel-body panel-div-body">
	     					<ul>
	     						<li><a href="#" id="#">Contact Us</a></li>
								<li><a href="#" id="#">255-555-890</a></li>
	     						<li><a href="#" id="#">Return Policy</a></li>
	      						<li><a href="#" id="#">Live Chat Support</a></li>
	     						<li><a href="#" id="#">Terms and Conditions</a></li>
     						</ul>
     					 </div>
    				</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Helpful Resources</h3>
      					</div>
     					<div class="panel-body panel-div-body">
     						<ul>
	     						<li><a href="#" id="#">Dry Washing</a></li>
	     						<li><a href="#" id="#">Clean Washing</a></li>
	     						<li><a href="#" id="#">Optimised Washing</a></li>
	     						<li><a href="#" id="#">Synthetic Washing</a></li>
	     					</ul>
     					 </div>
    				</div>
				</div>
			</div>
		</div>
		<div class="company-terms">
			<div class="company-container">
			<span>Company Name, second year 2016 production. Under development </span>
			</div>
		</div>
	</div>
	</footer>
	
	</body>
</html>