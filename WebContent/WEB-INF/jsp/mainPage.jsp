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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testFile.css">

<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">

<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.js"></script>


		
		
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
      	 <span id = "note">Login <span class="glyphicon glyphicon-hand-down"></span></span>
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
	  
	  <!-- ======================================= -->
	  
	  <div id="services" class="container-fluid text-center">
  <h2>SERVICES</h2>
  <h3>What we offer</h3>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-off logo-small power"></span>
      <h4>POWER</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart logo-small love"></span>
      <h4>CARE</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small job-guarantee"></span>
      <h4>JOB DONE GUARANTEE</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-leaf logo-small green"></span>
      <h4>GREEN</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate logo-small certified"></span>
      <h4>CERTIFIED</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench logo-small hard-work"></span>
      <h4 style="color:#303030;">HARD WORK</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
</div>
	  
	  
	  
	  <!-- ======================================= -->
	  
	  
	  <!--
	  ==================================================
	  -->
	  <p id="customer-said">What our customers say</p>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h3>"This company is the best. I am so happy with the result!"<br><span style="font-style:normal;">Michael Roe, Vice President, Comment Box</span></h3>
      </div>
      <div class="item">
        <h3>"One word... WOW!!"<br><span style="font-style:normal;">John Doe, Salesman, Rep Inc</span></h3>
      </div>
      <div class="item">
        <h3>"Could I... BE any more happy with this company?"<br><span style="font-style:normal;">Chandler Bing, Actor, FriendsAlot</span></h3>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	  
	  
	  
	<!-- =============================================== -->	  
	<div class ="footer">
	 <%@ include file="footer.jsp" %>
    </div>
 </body>
</html>