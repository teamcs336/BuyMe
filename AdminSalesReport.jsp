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

<title>Sales Report</title>
</head>
<body>

<h1>Admin's Sales Report</h1>

Sales Report Total Earnings
<br>
	<form method="post" action="AdminSalesReportSQL.jsp">
	<input type="hidden" name="reportType" value="0">
	<input type="submit" value="Get Report">
	</form>
<br>

Specific Item Sales
<br>
	<form method="post" action="AdminReportPageSQL.jsp">
	<input type="hidden" name="reportType" value="1">
	<table>
	<tr>    
	<td>itemID</td><td><input type="text" name="itemID"></td>
	</tr>
	</table>
	<input type="submit" value="Get Report">
	</form>
<br>

Total Sales by Item Type
<br>
	<form method="post" action="AdminReportPageSQL.jsp">
	<input type="hidden" name="reportType" value="2">
	<input type="submit" value="Get Report">
	</form>
<br>

User Earnings
<br>
	<form method="post" action="AdminReportPageSQL.jsp">
	<input type="hidden" name="reportType" value="3">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	</table>
	<input type="submit" value="Get Report">
	</form>
<br>

Top Selling Items
<br>
	<form method="post" action="AdminReportPageSQL.jsp">
	<input type="hidden" name="reportType" value="4">
	<input type="submit" value="Get Report">
	</form>
<br>

Top Buyers
<br>
	<form method="post" action="AdminReportPageSQL.jsp">
	<input type="hidden" name="reportType" value="5">
	<input type="submit" value="Get Report">
	</form>
<br>


<br>
<br>
	<form method="post" action="AdminControl.jsp">
	<input type="submit" value="Cancel">
	</form>
<br>



</body>
</html>