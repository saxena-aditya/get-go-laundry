<!doctype html>
<html>

<head><title>Register Page</title>
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/register-page.css" />
<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/navbar-css.css" />

<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.js"></script>

</head>
<body>
<div id = "color-class">
	<!-- NAVBAR CONTENT -->
	
	<jsp:include page="navbar.jsp" />  

  <!-- NAVBAR CONTENT END -->
  <div class = "image-envelop">
   <img id="image" class = "img-circle" src = "${pageContext.request.contextPath}/resources/visuals/smile.jpg">
  </div>


   <div class="note-envelop">
    <div class="another-side"> 
      <div class= "thank-you-class">
        <span id="thank-you">Thank you !</span> 
      </div>
    </div>
      <div class="note-class">
        <span id="note">for trying us.. </span>
      </div>
   </div>
     <div class = "form-div">
       <div class="heading-class">
         <p id="form-heading">Create Your Account</p>
       </div>
         <div class="sub-heading">
           <span>It's free!</span>
         </div>
         
<hr id="hr">

<form id = "reg-form" action = "formSubmission" method = "POST">
<div class ="container" >
  <div class = "row">
   <div class = "col-md-6">
    <div class = "form-group">
     <label for = "firstName">First Name </label>
	  <input type = "text" id = "fname" class = "form-control" name = "firstName" />
    </div>
   </div>
     <div class = "col-md-6">
       <div class = "form-group">
         <label for = "lastName">Last Name </label>
	       <input type = "text" id = "lname" class = "form-control input-support" name = "lastName" />
	   </div>
	</div>
 </div>
</div>
<div class = "form-group">
    <label for = "lastName">Phone number </label>
     <input type = "number" class = "form-control" id = "pnum" name = "phone" />
      <small id = "muted-text" class="form-text text-muted"   >This will be your username. so,choose this carefully.
      </small>
</div>

<div class = "form-group">
  <label for = "lastName">Password </label>
	<input type = "password" class = "form-control" id = "pass" name = "pass" />
</div>

<div class = "form-group">
  <label for = "address1">Address 1st Line</label>
	<input type = "text" class = "form-control" id = "addr1" name = "address1" />
</div>

<div class = "form-group">
  <label for = "address2">Address 2nd Line </label>
	<input type = "text" class = "form-control" id = "addr2" name = "address2" />
</div>	

 <button type = "submit" name = "submit" class=" btn btn-success sign-up">Sign Up</button>
	<small id="muted-text">By clicking here, you agree with our T&C </small>
	
</form>
</div>
</div>

<script type = "text/javascript">

$(document).ready(function(){
	
	$('#reg-form').submit(function(){
		if(!$('#fname').val()){
			
			return false;
		}
		else if(!$('#pnum').val()){
			//alertify alert!
			
			return false;
		}
		else if($('#pnum').val().length !=10){
			//alertify alert!
			
			return false;
		}
		else if(!$('#addr1').val()){
			//alertify alert
			
			return false;
			}
		
			return true;
	});
});
</script>
</body>

</html>