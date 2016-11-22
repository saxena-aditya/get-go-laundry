<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<html>
<head>
<title>myWash | Copy</title>
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/popform.css" />
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/costCounter.js"></script>

</head>
<body>
<div id = "logoutLink" style = "text-align: right;
    padding-right: 30px;">
<a href = "logout" style = "text-align:'right'; padding-right:'30px';">Logout</a>
</div>

	<h3 style = "color: green;">Welcome : ${username} ! </h3>


<!-- Services Tags -->
<a class = "btn btn-default" href = "prices">Prices</a>
<button class = "btn btn-default" id = "btnClick">Order</button>
<a class = "btn btn-default" id = "oderHistory" href = "order_history">Order History</a>
<!-- Services Tags -->

<div id = "contactDiv">


<div id ="wrapper">

<button id = "btnSWash" class = "btn btn-default">Simple Wash</button>
<button id = "btnDWash" class = "btn btn-default">Dry Wash</button>
<form id = "myForm1" class = "Myform1" method="POST" action="placeOrder"  style = "position : absolute">


<div id = "myForm" class = "Myform" style = "position : absolute">

<p class = "totalSum" style = "text-align: right;">total</p>
<hr/><br/>




<div id = "orderDetails"></div>

<input type = "date" name = "date" id = "date" />
<select type = "text" name = "timeSpan" id = "timeSpan">
	
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
      </div><div class="numbers-row">
        <label for="name">Casual Coats</label>
        <input type="number" name="ccoat" id="cc" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div><div class="numbers-row">
        <label for="name">Other</label>
        <input type="number" name="other" id="o" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div>
<button type ="submit" class ="btn btn-success cancel">Submit Order</button>

</div>
<div id = "myForm2" class = "Myform2" style = "display : none ; position : absolute">
<p class = "totalSum" style = "text-align: right;">total</p>
<hr/><br/>

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
      </div><div class="numbers-row">
        <label for="name">Blanket(heavy)</label>
        <input type="number" name="blanketH" id="bh" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div><div class="numbers-row">
        <label for="name">Blanket(luxary)</label>
        <input type="number" name="blanketLU" id="blu" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div>
<input type ="submit" class ="btn btn-success cancel" value = "Submit Order"/>
</div>

</form>
</div></div>

<script type = "text/javascript">
$(document).ready(function(){
	$('#btnClick').click(function(){
		$('#contactDiv').css("display", "block");
	});


	
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
	    
	    var a = parseInt($('#o').val()) * '${item.hoodie}';
	    var b = parseInt($('#p').val()) * '${item.pants}';
	    var c = parseInt($('#cc').val()) * '${item.coat}';
	    var d = parseInt($('#s').val()) * '${item.shirt}';
	    var e = parseInt($('#ts').val()) * '${item.tshirt}';
	    var f = parseInt($('#j').val()) * '${item.jeans}';
	    var u = parseInt($('#bl').val()) * '${item.blanketl}';
	    var v = parseInt($('#bh').val()) * '${item.blanketh}';
	    var w = parseInt($('#blu').val()) * '${item.blanketlu}';
	    var x = parseInt($('#sw').val()) * '${item.sweater}';
	    var y = parseInt($('#jk').val()) * '${item.jacket}';
	    var z = parseInt($('#ctc').val()) * '${item.coat}';
	    var totalSum = a + b + c + d + e + f  + u + v + w + x + y + z ; 
	    $('.totalSum').html(totalSum);
	  });
  
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

  $(".cancel").click(function() {
		$(this).parent().parent().parent().parent().hide();

});	

</script>
</body>
</html>