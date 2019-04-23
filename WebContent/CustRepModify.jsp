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

<title>Customer Representative Account Modification</title>
</head>
<body>
<h1>Customer Representative Removal </h1>
<br>
	<form method="post" action="CustomerRepAccountModificationSQL.jsp">
	<table>
	<tr>    
	<td>Username of Customer Representative being modified</td><td><input type="text" name="Username"></td>
	</tr>
	
	<tr>
	<td></td>
	</tr>

	<tr>
	<td><b>NOTE:</b> Any changed fields will be modified for the Customer Representative.
		Any field left empty will NOT be modified.</td>
	</tr>
	
	<tr>
	<td></td>
	</tr>
	
	<tr>    
	<td>Username</td><td><input type="text" name="modifyUsername"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="modifyPassword"></td>
	</tr>
	<tr>
	<td>First Name</td><td><input type="text" name="modifyFirstName"></td>
	</tr>
	<tr>  
	<td>Last Name</td><td><input type="text" name="modifyLastName"></td>
	</tr>
	<tr>  
	<td>Email</td><td><input type="text" name="modifyEmail"></td>
	</tr>
	<tr>
	<td>Phone Number</td><td><input type="text" name="modifyPhoneNumber"></td>
	</tr>
	<tr>
	</table>
	
	<input type="submit" value="Modify Account">
	</form>
<br>

<br>
	<form method="post" action="AdminControl.jsp">
	<input type="submit" value="Cancel">
	</form>
<br>

</body>
</html>