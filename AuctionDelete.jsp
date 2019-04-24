<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
background-color: lightpink
}
</style>

<title>Auction Delete</title>
</head>

<body>
<h1>Remove Auction</h1>
<br>

This auction will be deleted
<br>
	<form method="post" action="AuctionDeleteSQL.jsp">
	<table>
	<tr>    
	<td>Auction ID</td><td><input type="number" name="deleteAuction"></td>
	</tr>
	</table>
	
	<input type="submit" value="Delete Auction">
	</form>
<br>

<br>
	<form method="post" action="CustRepControl.jsp">
	<input type="submit" value="Cancel">
	</form>
<br>

</body>
</html>