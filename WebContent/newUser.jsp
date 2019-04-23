<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User creation</title>
</head>
<body>

<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		/* //Create a SQL statement
		Statement stmt = con.createStatement(); */

		//Get parameters from the HTML form at the HelloWorld.jsp
		String newName = request.getParameter("UserName");
		String newEmail = request.getParameter("UserEmail");
		String newPW = request.getParameter("UserPW");
		String newPhoneNum = request.getParameter("UserPhone#");
		//String newAddress = request.getParameter("UserAddress");
		String street = request.getParameter("Street");
		String city = request.getParameter("City");
		String state = request.getParameter("State");
		String zip = request.getParameter("ZIP");
		String newAddress = street + "," + city + "," + state + "," + zip;
		
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO User(UserName, UserEmail, UserPW, UserPhoneNum, UserAddress) VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newName);
		ps.setString(2, newEmail);
		ps.setString(3, newPW);
		ps.setString(4, newPhoneNum);
		ps.setString(5, newAddress);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("You have successfully created a new account!");
		out.print("\n Click <a href=SignInPage.jsp>Here</a> to login");

%>

</body>
</html>