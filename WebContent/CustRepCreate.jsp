<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body {
background-color: #BFBFBF
}
</style>

<title>Customer Representative Account Creation</title>
</head>
<body>

<h1>Customer Representative Creation </h1>

<b>NOTE:</b> Customer Representatives will have more privileges than regular users.

<br>
<br>
<br>
	<form method="post" action="CustomerRepAccountCreationSQL.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="newUsername"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="newPassword"></td>
	</tr>
	<tr>  
	<td>Email</td><td><input type="text" name="newEmail"></td>
	</tr>
	<tr>
	<td>First Name</td><td><input type="text" name="newFirstName"></td>
	</tr>
	<tr>  
	<td>Last Name</td><td><input type="text" name="newLastName"></td>
	</tr>
	<tr>
	<td>Phone Number</td><td><input type="text" name="newPhoneNumber"></td>
	</tr>
	<tr>
	</table>
	
	<input type="submit" value="Create Account">
	</form>
<br>

<br>
	<form method="post" action="AdminControl.jsp">
	<input type="submit" value="Cancel">
	</form>
<br>

</body>
</html>