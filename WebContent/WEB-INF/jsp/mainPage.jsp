<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  


<html >
	<head>
		<title>Login</title>
		 <meta charset="utf-8" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/css/mainPagecss.css" />
</head>
	<body> 
	<a  class = "btn btn-success" href = "registerMe">Register</a>
		
		<div class= "row">
	
		  <h2>Login To Your Account</h2>
		 
		  <p>${MsgDisplay}</p>
		  <div id =  "formElements">
		  <form action='login' method='post'>
		    <input placeholder='Username' type='text' name='username' /><br>
		    <input placeholder='Password' type='password' name='pass' /><br>
		    <div id = "button">
		    <button class = "btn btn-default" id = "btnL">Login</button>
		    </div>
		  </form>
		  </div>
		</div>
	
	</body>
</html>