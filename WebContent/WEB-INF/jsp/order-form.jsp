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
		   		<c:choose>	
		   			<c:when test="${list.getItem_name()=='tshirt' }">	
		   				<label for="item_name">T-Shirt</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='shirt' }">	
		   				<label for="item_name">Shirt</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='jeans' }">	
		   				<label for="item_name">Jeans</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='pant' }">	
		   				<label for="item_name">Pants</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='sweater' }">	
		   				<label for="item_name">Sweater</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='blanketL' }">	
		   				<label for="item_name">Blanket-Light</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='blanketH' }">	
		   				<label for="item_name">Blanket-Heavy</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='BlanketLU' }">	
		   				<label for="item_name">Blanket-Luxary</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='ccoat' }">	
		   				<label for="item_name">Casual Coat</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='fcoat' }">	
		   				<label for="item_name">Formal Coat</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='jacket' }">	
		   				<label for="item_name">Jacket</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='other' }">	
		   				<label for="item_name">Other Cloths</label>
		   			</c:when>
		   			
		   			
		   			<c:otherwise>
		   				<label for="item_name">${list.getItem_name() }</label>
		   			</c:otherwise>
		   		</c:choose>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control" id="${list.getItem_name()}" name="${list.getItem_name()}" value="0" type="number">
		   		</div>		   		
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl btn">-</span>
		   			<span class = "button btn">+</span>
		   		</div>
		 	  </div>
		   </div>
		   </c:when>
		    <c:when test="${list.getType()=='DRY'}">
		   	<div class="row dry">
		   		<div class="col-md-6">		
		   			<c:choose>	
		   			<c:when test="${list.getItem_name()=='tshirt' }">	
		   				<label for="item_name">T-Shirt</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='shirt' }">	
		   				<label for="item_name">Shirt</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='jeans' }">	
		   				<label for="item_name">Jeans</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='pant' }">	
		   				<label for="item_name">Pants</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='sweater' }">	
		   				<label for="item_name">Sweater</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='blanketL' }">	
		   				<label for="item_name">Blanket-Light</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='blanketH' }">	
		   				<label for="item_name">Blanket-Heavy</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='blanketLU' }">	
		   				<label for="item_name">Blanket-Luxary</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='ccoat' }">	
		   				<label for="item_name">Casual Coat</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='fcoat' }">	
		   				<label for="item_name">Formal Coat</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='jacket' }">	
		   				<label for="item_name">Jacket</label>
		   			</c:when>
		   			<c:when test="${list.getItem_name()=='other' }">	
		   				<label for="item_name">Other Cloths</label>
		   			</c:when>
		   			<c:otherwise>
		   				<label for="item_name">${list.getItem_name()}</label>
		   				
		   			</c:otherwise>
		   			
		   			</c:choose>
		   		</div>
		   		<div class="col-md-1">
		   			<input class="form-control" id="${list.getItem_name()}" name="${list.getItem_name()}" value="0" type="number">
		   		</div>
		   		<div class="col-md-5">
		   		<div class="btn-container">
		   			<span class = "buttonl btn">-</span>
		   			<span class = "button btn">+</span>
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
						<input class="form-control" name="add1" value="${add1}" id="add1" type="text" />
					</div>
					</div>
				
					<div class="row">
						<div class="col-md-4">
						<div class="form-group">
							<label for="add-2">City:</label>
						</div>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="add2" value="${add2}" id="add2" type="text" />
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
<script>
	
	$(document).ready(function(){
		
		var array = {};
		var ids = {};
		var cleanButton = $("#cleanwash");
		var dryButton = $("#drywash");
		var dryDivs = $(".dry");
		var cleanDivs = $(".clean");
		var phaseChangeButton = $("#move-phase-2");
		var formSubmitButton = $("#order-form-submit");
		var phase1 = $("#form-phase-1");
		var phase2 = $("#form-phase-2");
		var topButtons = $(".top-btns");
		var back = $("#back-to-phase-1");
		var minimum_value = ${company_details.getMinimum_order_cost()};
		var total =0;
		var cost = {};
		var sum =0; 
		
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
	
		phase2.css("display", "none");
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
		for(var i in ids){
			total=0;
			total =  total +parseInt(document.getElementById(ids[i]).value) * parseInt(array[ids[i]]);
			cost[i] = total;		
		}	
		sum =0;
		for(var k in cost)
			sum = sum + cost[k];
		
		$('#total').html("Rs " + sum); 
	});
	
	phaseChangeButton.click(function(){
		if(parseInt(sum) > minimum_value){
		topButtons.css("display", "none");
		phase1.css("display", "none");
		phase2.css("display", "block");
		}
		else{
			alertify.alert("ALERT", "Curently, we only accept orders above Rs. "+minimum_value);
			return false;
		}
		return false;
	});
	         
	back.click(function(){
		topButtons.css("display", "flex");
		phase1.css("display", "block");
		phase2.css("display", "none");
		
		return false;
		
	});	   
	
	formSubmitButton.click(function(){
		if(document.getElementById("date").value.length == 0){
				alertify.alert("ALERT", "Please click on the Date box to select a valid Date");
				return false;
			}
		});	
	});
		
	</script>
