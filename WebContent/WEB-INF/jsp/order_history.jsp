<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order History</title>
</head>
<body>
<c:if test="${empty oList}">

<p>List is Empty</p>


</c:if>
<c:forEach items="${oList}" var="list" varStatus = "sts">

	

    <c:if test = "${not empty list.getOrder_id()}">
        <span>Order ID: <a href = "#"><c:out value="${list.getOrder_id()}"/></a>
        <span>Order Date: <c:out value="${list.getOrder_date()}"/> </span>  
        <span>Order Cost : <c:out value = "${costList[sts.index]}"></c:out></span>
        <br> 
    </c:if>
    </c:forEach>

<p>Your Order History will appear here!!</p>
</body>
</html>