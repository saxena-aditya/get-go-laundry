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
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
		
		<link href="https://fonts.googleapis.com/css?family=Lato|Quicksand" rel="stylesheet">
		
		<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/costCounter.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery-ui.js"></script>

	
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
      <div class="top-btns" >
				<button class="top-left" id="cleanwash" >Simple Wash</button>
				<button class="top-right" id="drywash" >Dry Wash</button>
<script>


var list = "hellow world!";
</script> 
			</div>  
      
        <form class="form-horizontal"  action="placeOrder" method="POST">
			<div class="form-holder">
				<div id="form-phase-1" >
					<div class="estimateAmount">
						<span id="total">total</span>
						<hr id="hr-line">
					</div>
				
			<c:forEach items="${clothList}" var="list" varStatus="i" begin="0">
				<c:choose>
				 <c:when test="${list.getType() =='CLEAN'}">
		   <div class="row clean">
		   		<div class="col-md-6">		
		   			<label for="item_name">${list.getItem_name()}</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control" id="${list.getItem_name()}" name="${list.getItem_name()}" value="0" type="number">
		   		</div>		   		
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   </c:when>
		    <c:when test="${list.getType() =='DRY'}">
		   	<div class="row dry">
		   		<div class="col-md-6">		
		   			<label for="item_name">${list.getItem_name()}</label>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control" id="${list.getItem_name()}" name="${list.getItem_name()}" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl">-</span>
		   			<span class = "button">+</span>
		   		</div>
		 	  </div>
		   </div>
		   	</c:when>
		   	</c:choose>
		   </c:forEach>
		   
		   <button id="move-phase-2" class="btn btn-success">Proceed <span class="glyphicon glyphicon-chevron-right"></span></button>
		  </div>
		  <div id="form-phase-2" >
		  	<h2>Set Order Pickup Date and Time</h2>
		  	<hr class="hr-line">
		  	<div class="time-and-date">
					<div class="date-holder">
					<input  name = "date" id = "date" placeholder = "Select date" />
					</div>
          <script>
            $(function() {
             $( "#date" ).datepicker({ minDate: 0});
                 });
          </script>
          <div class="time-holder">
	           <select  name = "timeSpan" id = "timeSpan">
		        <option value = "8am-10am"> 8am to 10am</option>
		        <option value = "10am-12pm"> 10am to 12pm</option>
		        <option value = "12pm-2pm"> 12pm to 2pm</option>
		        <option value = "2pm-4pm"> 2pm to 4pm</option>
		        <option value = "4pm-6pm"> 4pm to 6pm</option>
           </select>
			</div>
			</div>
			<div class="address-part">
				<h2>Set Order Address</h2><hr class="line-horizoltal">
					<div class="row">
						<div class="col-md-4">
						<div class="form-group">
							<label for="add-1">Local:</label>
						</div>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="add1" id="add1" type="text" />
					</div>
					</div>
				
					<div class="row">
						<div class="col-md-4">
						<div class="form-group">
							<label for="add-2">City:</label>
						</div>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="add2" id="add2" type="text" />
					</div>
					</div>
				
			
			</div>
			<div class="lower-buttons">
				 <button class="btn btn-default" id="back-to-phase-1"><span class="glyphicon glyphicon-chevron-left"></span>Back</button>
				 <button class="btn btn-success" id="order-form-submit">Submit Order&nbsp;&nbsp;<span class="glyphicon glyphicon-ok-sign" id="ok"></span></button>
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
	
	<script>
	var array = {};
	var ids = {};
	$(document).ready(function(){
		var cleanButton = $("#cleanwash");
		var dryButton = $("#drywash");
		var dryDivs = $(".dry");
		var cleanDivs = $(".clean");
		
		
		dryDivs.toggle();
		cleanButton.addClass("btnn-active");
		cleanButton.click(function(){
			dryDivs.css("display", "none");
			cleanDivs.css("display", "block");
			dryButton.removeClass("btnn-active");
			cleanButton.addClass("btnn-active");
			
		});
		
		
		dryButton.click(function(){
			cleanDivs.css("display", "none");
			dryDivs.css("display", "block");
			cleanButton.removeClass("btnn-active");
			dryButton.addClass("btnn-active");
		});
		var object = JSON.parse('${jsonList}');
		
		for(var i in object){
			array[object[i].item_name] = object[i].item_cost;
			ids[i] = object[i].item_name;
		}
		var j=0;
		for(var k in ids)
			console.log("ids: "+ ids[k] + "  arrays: " + array[ids[k]]);
				
	});

	var phaseChangeButton = $("#move-phase-2");
	var formSubmitButton = $("#order-form-submit");
	var phase1 = $("#form-phase-1");
	var phase2 = $("#form-phase-2");
	var topButtons = $(".top-btns");
	var back = $("#back-to-phase-1");
	
	phase2.css("display", "none");

	phaseChangeButton.click(function(){
		
		topButtons.css("display", "none");
		phase1.css("display", "none");
		phase2.css("display", "block");
		
		return false;
	});
	         
	back.click(function(){
		topButtons.css("display", "flex");
		phase1.css("display", "block");
		phase2.css("display", "none");
		
		return false;
		
		
	});	   
	
	$(".button, .buttonl").click( function() {

	    var $button = $(this);
	    var one = 1;
	    var oldValue = $button.parent().parent().parent().find("input").val();

	    if ($button.text() == "+") {
	  	  var newVal = parseInt(oldValue) + parseInt(one);
	  	} else {
		   // Don't allow decrementing below zero
	      if (oldValue > 0) {
	        var newVal = parseInt(oldValue) - parseInt(one);
		   	} else {
	        newVal = 0;
	      }
	 }
	$button.parent().parent().parent().find("input").val(newVal);

		var total =0;
		
		for(var i in ids){
			total = total + parseInt(document.getElementById(ids[i]).value) * parseInt(array[ids[i]]);
			console.log("values :  " + parseInt(document.getElementById(ids[i]).value) + "  "+ ids[i] );
		
		}
		$('#total').html("Rs " + total);
	    
	});
	
		
	</script>
	
	</body>
	
	
</html>