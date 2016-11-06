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
<c:if test="${loggedinUser.username !=null}">  
	<h3 style = "color: green;">Welcome : ${loggedinUser.username} ! </h3>

</c:if> 

<!-- Services Tags -->
<a class = "btn btn-default" href = "prices">Prices</a>
<button class = "btn btn-default" id = "btnClick">Order</button>
<!-- Services Tags -->

<div id = "contactDiv">
<form id = "myForm" class = "Myform" method="GET" action="#" >

<p class = "totalSum" style = "text-align: right;">total</p>
<hr/><br/>



<div class="numbers-row">
        <label for="name">T-Shirt</label>
        <input type="number" name="ts" id="ts" value ="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div>
      <div class="numbers-row">
        <label for="name">Shirt</label>
        <input type="number" name="s" id="s" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div>
      <div class="numbers-row">
        <label for="name">Formal Pants</label>
        <input type="number" name="p" id="p" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div>
      <div class="numbers-row">
        <label for="name">Jeans</label>
        <input type="number" name="j" id="j" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div><div class="numbers-row">
        <label for="name">Casual Coats</label>
        <input type="number" name="cc" id="cc" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div><div class="numbers-row">
        <label for="name">Other</label>
        <input type="number" name="o" id="o" value="0"><div class = "buttonl">-</div><div class = "button">+</div>
      </div>


<a class ="btn btn-success" id="cancel">Ok</a>
</form>
</div>

<script type = "text/javascript">
$(document).ready(function(){
	$('#btnClick').click(function(){
		$('#contactDiv').css("display", "block");
	});

$("#contactDiv #cancel").click(function() {
	$(this).parent().parent().hide();

	
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
	    
	    var a = parseInt($('#o').val()) * '${item.hoodie}' ;
	    var b = parseInt($('#p').val()) * '${item.pants}';
	    var c = parseInt($('#cc').val()) * '${item.coat}';
	    var d = parseInt($('#s').val()) * '${item.shirt}';
	    var e = parseInt($('#ts').val()) * '${item.tshirt}';
	    var f = parseInt($('#j').val()) * '${item.jeans}';
	    var totalSum = a + b + c + d + e + f; 
	    $('.totalSum').html(totalSum);
	  });
  
});	

</script>
</body>
</html>