<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  


<html >
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login</title>
		 <meta charset="utf-8" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/main.css.css" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/style.css" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/navbar-css.css" />
		
</head>
	<body> 
	<div class= "html-envelop">
	<!-- NAVBAR CONTENT -->
	<jsp:include page="navbar.jsp" />  
	  <!-- NAVBAR CONTENT END -->
     <div class = "middle-part">
      <img class="img-responsive" id = "background-image" src = "${pageContext.request.contextPath}/resources/visuals/clothes.jpg" alt = "background-image">
	   <div class = "form-div">
	    <div class = "note-class">
      	 <span id = "note">Login</span>
	    </div>
		 <div id ="msg-div">
		  <p id ="msg">${MsgDisplay}</p>
		 </div>
		  <form action='login' method='post'>
		   <div class="form-group">
		    <div class = "gly-class">
		      <i class = "glyphicon glyphicon-user" id = "user-gly"></i>
		    </div>
		     <input placeholder='Username' class = "form-control " type='text' name='username' /><br>
		   </div>
		    <div class = "form-group paswd-marg">
		     <div class = gly-class>
		      <i id = user-gly class = "glyphicon glyphicon-triangle-right"></i>
		     </div>
		      <input placeholder='Password' class = "form-control pswd-marg" type='password' name='pass' /><br>
		     </div>
		      <div id = "button-div">
		        <button class = "btn btn-success" id = "btnL">Sign in</button>
		      </div>
		    </form>
		  </div>
		   <img id = "cmpny-sym" class="img-responsive" src = "${pageContext.request.contextPath}/resources/visuals/${company_details.getCompany_symbol()}" alt = "comapny-symbol">
		    <div class = "cleany-clean">
		     <span id="cmpny-name">${company_details.getCompany_name()}</span><br>
		      <span id="cmpny-note">you can trust us!  </span>
		    </div>
		  </div>
		  
		   <div class = "flippers-div">
		    <!-- Flip cards starting -->
		     <div class="card-wrapper flip-diagonal-right filper-1">
			  <div class="card">
			   <div class="front fliper-front">
				<img id = "bubbles" src = "${pageContext.request.contextPath}/resources/visuals/bubbles.jpg" alt = "bubbles">
		         <span id="fliper-title" class = "title-1">Why ?</span>
				</div>
				  <div class="back fliper-back">
				    <span>Flip card</span>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia ipsum enim velit ea sit nisi dolore adipisci impedit non? In, minima natus sapiente repudiandae tempore architecto ut voluptates voluptas commodi.</p>
				  </div>
				</div>
			</div>
	         <div class="card-wrapper flip-diagonal-right filper-2">
			  <div class="card">
				<div class="front fliper-front">
				  <img id = "bubbles" src = "${pageContext.request.contextPath}/resources/visuals/bubbles.jpg" alt = "bubbles">
		            <span id = "fliper-title" class = "title-2">When ?</span>
				</div>
				  <div class="back fliper-back">
					<h2>Back side</h2>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia ipsum enim velit ea sit nisi dolore adipisci impedit non? In, minima natus sapiente repudiandae tempore architecto ut voluptates voluptas commodi.</p>
			       </div>
				</div>
			</div>
	          <div class="card-wrapper flip-diagonal-right filper-3">
				<div class="card">
				  <div class="front fliper-front">
					<img id = "bubbles" src = "${pageContext.request.contextPath}/resources/visuals/bubbles.jpg" alt = "bubbles">
		              <span id = "fliper-title" class = "title-3">How ?</span>
				  </div>
					<div class="back fliper-back">
					  <h2>Back side</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia ipsum enim velit ea sit nisi dolore adipisci impedit non? In, minima natus sapiente repudiandae tempore architecto ut voluptates voluptas commodi.</p>
					</div>
				</div>
			  </div>
			
<!-- Flip cards Ending! -->	
		 </div>
	  </div>
	<div class ="footer">
	 <p>Cleany Clean 2016</p>
    </div>
 </body>
</html>