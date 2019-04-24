<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {
background-color: #00FA9A
}
</style>
<title>Account Creation</title>
</head>
<body>
	<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();

	//Create a SQL statement
	Statement stmt = con.createStatement();

	//Get parameters from the HTML form at the HelloWorld.jsp
	String newName = request.getParameter("UserName");
	String newPW = request.getParameter("UserPW");
	String newEmail = request.getParameter("UserEmail");
	String newPhoneNum = request.getParameter("UserPhoneNum");
	
	if(newName == null || newName == ""){
		out.println("Username can't be empty <a href='CustRepCreate.jsp'>try again</a>");
				
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		return;
	}
	
	//Query tries to find an account with the same username
	ResultSet rs = stmt.executeQuery("SELECT UserName FROM User WHERE UserName ='" + newName + "'");
	
	//Will hold the query attribute
	String testUsername ="";
						
	while(rs.next()){
		testUsername = rs.getString("UserName");
				
		if(testUsername.equals(newName)){
				out.println("This username is already used, try another <a href='CustRepCreate.jsp'>try again</a>");
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
					
				return;
			}
		}			
				
	//Make an insert statement for the Sells table:
	String insert = "INSERT INTO User(UserName, UserPW, UserEmail, UserPhoneNum) VALUES (?, ?, ?, ?)";
	
	//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	PreparedStatement ps = con.prepareStatement(insert);

	//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	ps.setString(1, newName);
	ps.setString(2, newPW);
	ps.setString(3, newEmail);
	ps.setString(4, newPhoneNum);
	//Run the query against the DB
	ps.executeUpdate();

	//Query tries to find an account with the same username
		ResultSet rss = stmt.executeQuery("SELECT UserID FROM User ORDER BY UserID DESC");
	//Make an insert statement for the CustomerRep table:
			String insert2 = "INSERT INTO CustomerRep(RepID, Username)"
					+ "VALUES (?, ?)";
						
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps2 = con.prepareStatement(insert2);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			if(rss.next()) ps2.setString(1, rss.getString("UserID"));
			ps2.setString(2, newName);
			ps2.executeUpdate();

	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	con.close();

	out.print("You have successfully created a new account!");
	out.print("\n Click <a href=SignInPage.jsp>Here</a> to login");

%>

<br>
<a href='AdminControl.jsp'>Return to Admin Control</a> 
<br>
</body>
</html>