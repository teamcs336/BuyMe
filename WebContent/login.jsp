<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String email = request.getParameter("UserEmail");
		String pass = request.getParameter("UserPass");
		
		String select = "SELECT UserID FROM User WHERE UserEmail = '" + email + "' AND UserPW = '" + pass + "'";
		
		ResultSet result = stmt.executeQuery(select);
		
		if(result.next()){
			/*Set timeout to 60 minutes*/
			session.setMaxInactiveInterval(60);
			
			String uid = result.getString("UserID");
			request.getSession().setAttribute("uid", uid);
			out.println("uid: " + session.getAttribute("uid"));
			request.getSession().setAttribute("loggedIn", true);
			//out.println("<a href=\"test.jsp\">Your account</a>");
			con.close();
			response.sendRedirect(response.encodeRedirectURL("account.jsp"));
			return;
		}else{
			out.println("Invalid credentials, <a href=\"SignInPage.jsp\">try again</a>");
		}
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	} catch (Exception ex) {
		out.println(ex);
	}
	
	
	%>
</body>
</html>