<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>myWash | Copy</title>
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/popform.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/footer-css.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/default.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/side-bar.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/welcome_page.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/alertify.min.css" />

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
<div id = "teller">
 <p>Most recent pending order</p>
</div>

<table class = "table table-bordered">
  <thead>
   <tr>
    <th class="table-head">Order ID</th>
    <th class="table-head">Order Date</th>
    <th class="table-head">Total Cost</th>
    <th class="table-head">Stage</th>
   </tr>
  </thead>
   <tbody>
    <c:forEach items="${latestoList}" var="list" varStatus = "sts">
     <c:if test = "${not empty list.getOrder_id()}">
       <tr>
         <td class = "table-details"><a href = "#"><c:out value="${list.getOrder_id()}"/></a></td>
         <td class = "table-details"><c:out value="${list.getOrder_date()}"/></td>
         <td class = "table-details"><c:out value="${LatestOcost}"/></td>
         <td class = "table-details">Recieved</td>
       </tr>
     </c:if>
    </c:forEach>
   </tbody>
</table>

<div class= "cancle-order-form">
 <form id = "cancel-order" action = "order_cancel" method = "GET">
  <img id = "submit-image" src = "${pageContext.request.contextPath}/resources/visuals/cross.png"  alt = "image"></img>
 </form>
 </div>
  </c:when>
<c:otherwise>

 
     <!-- the user has not made any orderers till now  -->
	  <img id = "neutral-face-pic" src = "${pageContext.request.contextPath}/resources/visuals/neutral-face.png">
      	<p id = "para">Ready to add new orders.  </p>

</c:otherwise>
</c:choose>
<script>
$(document).ready(function(){
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
<div id = "contactDiv">
 <div id ="wrapper">
  <button id = "btnSWash" class = "btn btn-default">Simple Wash</button>
   <button id = "btnDWash" class = "btn btn-default">Dry Wash</button>
    <div class= "form-container">
     <form id = "myForm1" class = "Myform1" method="POST" action="placeOrder"  style = "position : absolute">
      <div id = "myForm" class = "Myform" style = "position : absolute">
       <p class = "totalSum" style = "text-align: right;">total</p>
        <hr>
         <input  name = "date" id = "date" placeholder = "Select date" />
          <script>
            $(function() {
             $( "#date" ).datepicker({ minDate: 0});
                 });
          </script>
	           <select  name = "timeSpan" id = "timeSpan">
		        <option value = "8am-10am"> 8am to 10am</option>
		        <option value = "10am-12pm"> 10am to 12pm</option>
		        <option value = "12pm-2pm"> 12pm to 2pm</option>
		        <option value = "2pm-4pm"> 2pm to 4pm</option>
		        <option value = "4pm-6pm"> 4pm to 6pm</option>
           </select>
            <script type = "text/javascript">
              $(document).ready(function(){ 
            	  var date = new Date();
				  var today = new Date();
	              var day = new String(date.getDate());
	              var mon = new String(date.getMonth()+1); //January is 0!
	              var yr = today.getFullYear();

	               if(day.length < 2) { day = "0" + day; }
	               if(mon.length < 2) { mon = "0" + mon; }

	              var datemin = new String( yr + '-' + mon + '-' + day );
	               $('#date').attr("min", datemin);
	                //document.getElementByID('date').setAttribute('min', date);
	                });

             </script>
              <div class="numbers-row">
               <label for="name">T-Shirt</label>
                <input  type="number" name="tshirt" id="ts" value ="0"><div class = "buttonl">-</div><div class = "button">+</div>
              </div>
               <div class="numbers-row">
                <label for="name">Shirt</label>
                 <input type="number" name="shirt" id="s" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
               </div>
                <div class="numbers-row">
                 <label for="name">Formal Pants</label>
                  <input type="number" name="pant" id="p" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
                </div>
                 <div class="numbers-row">
        		  <label for="name">Jeans</label>
                   <input type="number" name="jeans" id="j" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
                 </div>
                  <div class="numbers-row">
                   <label for="name">Casual Coats</label>
                    <input type="number" name="ccoat" id="cc" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
                  </div>
                    <div class="numbers-row">
                     <label for="name">Other</label>
                      <input type="number" name="other" id="o" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
                    </div>
                     <button type ="submit" class ="btn btn-success lower-submit-button">Submit Order</button>
                      <a class = "btn btn-default cancel lower-cancel-button" >Cancel</a>

      </div>
       <div id = "myForm2" class = "Myform2" style = "display : none ; position : absolute">
        <p class = "totalSum" style = "text-align: right;">total</p>
         <hr/>
          <br/>
           <div class="numbers-row">
            <label for="name">Formal Coats</label>
             <input type="number" name="fcoat" id="ctc" value ="0"><div class = "buttonl">-</div><div class = "button">+</div>
           </div>
            <div class="numbers-row">
             <label for="name">Sweater</label>
              <input type="number" name="sweater" id="sw" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
           </div>
            <div class="numbers-row">
             <label for="name">Jacket</label>
              <input type="number" name="jacket" id="jk" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
           </div>
            <div class="numbers-row">
             <label for="name">Blanket(light)</label>
              <input type="number" name="blanketL" id="bl" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
            </div>
             <div class="numbers-row">
              <label for="name">Blanket(heavy)</label>
               <input type="number" name="blanketH" id="bh" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
             </div>
              <div class="numbers-row">
               <label for="name">Blanket(luxary)</label>
                <input type="number" name="blanketLU" id="blu" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
              </div>

      <button type ="submit" class ="btn btn-success lower-submit-button">Submit Order</button>
                      <a class = "btn btn-default cancel lower-cancel-button" >Cancel</a>
       </div>
      </form>
     </div>
    </div>
 </div>

<!-- Order form ending! -->

<script type = "text/javascript">

var totalSum =0; //global Variable!
$(document).ready(function(){
	$('#btnClick').click(function(){
		$('#contactDiv').css("display", "block");
	});
 });

$('#myForm1').submit(function(){
	/* use this space to do the awesome alert function of alertify, to make the user aware that 
	* they have not selected any cloths or date! :D :D */
	var date = $('#date').val();
	
	if(!date){
		alertify
		.alert("Date can not be empty !", "Please select a date.");
		return false;	
	}
	if(totalSum < ${company_details.getMinimum_order_cost()}){
		alertify.alert("Sorry, but we do not accept bills below ${company_details.getMinimum_order_cost()}");
		return false;
	}
	else
		return true
	});
	
	$(".button, .buttonl").click( function() {

	    var $button = $(this);
	    var one = 1;
	    var oldValue = $button.parent().find("input").val();

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
	$button.parent().find("input").val(newVal);
	
	var item =  ${item_price};
	
	
	
	 var a = parseInt($('#o').val()) * item[11].item_cost;
	 var b = parseInt($('#p').val()) * item[2].item_cost;
	 var c = parseInt($('#cc').val()) * item[4].item_cost;
	 var d = parseInt($('#s').val()) * item[1].item_cost;
	 var e = parseInt($('#ts').val()) * item[0].item_cost;
	 var f = parseInt($('#j').val()) * item[2].item_cost;
	 var u = parseInt($('#bl').val()) * item[8].item_cost;
	 var v = parseInt($('#bh').val()) * item[9].item_cost;
	 var w = parseInt($('#blu').val()) * item[10].item_cost;
	 var x = parseInt($('#sw').val()) * item[6].item_cost;
	 var y = parseInt($('#jk').val()) * item[7].item_cost;
	 var z = parseInt($('#ctc').val()) * item[5].item_cost;

	 totalSum = a + b + c + d + e + f + u + v + w + x + y + z ; 
	$('.totalSum').html("Rs " + totalSum);});
	
  	$('#btnSWash').click(function(){
	$('#myForm').css('display', 'block');
	$('#myForm2').css('display', 'none');
	$('#btnDWash').css('background-color', 'white');
	$('#btnSWash').css('background-color', 'blue');
	});
  	$('#btnDWash').click(function(){
	$('#myForm2').css('display', 'block');
	$('#myForm').css('display', 'none');
	$('#btnDWash').css('background-color', 'blue');
	$('#btnSWash').css('background-color', 'white');
	  });
  
  	
  	$(document).ready(function(){
  		$(document).mouseup(function (e){
  			// magic form container.
  	     var popup = $("#wrapper");
  	     if ( !popup.is(e.target) 
  	    			 && popup.has(e.target).length == 0){
  	    				
  	    	 popup.parent().hide(300);
  	     }
  	 });
  });
  	
 $(".cancel").click(function(){
	$("#contactDiv").hide(300);
	document.getElementById("myForm1").reset();
	$('.totalSum').html("total");
	totalSum = 0;
 });	
</script>
</body>
</html>