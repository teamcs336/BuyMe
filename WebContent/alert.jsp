<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 	<%
     	String itemID = request.getParameter("userAlert");
     	String userAlert = "SELECT ItemDescription FROM Item AS I WHERE I.itemID = " + itemID + " AND ";
     
     
     
     
     
     %>  
</body>
</html>