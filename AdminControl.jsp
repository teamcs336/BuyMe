<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<center>
<style>
body {
background-color: #BFBFBF;
font-family: Helvetica, sans-serif;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Admin Account</title>
</head>

<body>							  

<h1>Admin Control</h1>
<br>

<b>Welcome to BuyMe Admin Control!</b>

<br>
<br>
<br>
Create Customer Representative Account
<br>
	<form method="post" action="CustRepCreate.jsp">
	<input type="submit" value="Create Account">
	</form>
<br>

Generate sales report
<br>
	<form method="post" action="AdminSalesReport.jsp">
	<input type="submit" value="Create Report">
	</form>
<br>

Logout and return home
<br>
	<form method="post" action="logout.jsp">
	<input type="submit" value="Logout">
	</form>
<br>


</center>
</body>
</html>