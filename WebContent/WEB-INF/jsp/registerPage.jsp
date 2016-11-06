<!doctype html>
<html>

<head><title>Register Page</title>
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/myStyle.css" />

</head>
<body>
<h2>Css Testing</h2>
<form action = "formSubmission" method = "POST">
	<label for = "firstName">First Name :</label><input type = "text" name = "firstName" required>
	<label for = "lastName">Last Name :</label><input type = "text" name = "lastName">
	<label for = "lastName">Phone :</label><input type = "number" name = "phone">
	<label for = "lastName">Pass :</label><input type = "password" name = "pass">
	<label for = "address1">Address 1st Line:</label><input type = "text" name = "address1">
	<label for = "address2">Address 2nd Line :</label><input type = "text" name = "address2">
	
	<input type = "submit" name = "submit">
	
	
</form>

</body>

</html>