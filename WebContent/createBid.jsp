<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		/*Connect to database*/
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
	
		/*Get current user's id*/
		String uid = (String)session.getAttribute("uid");
		
		String auctionID = request.getParameter("Auction");
		String bidAmt = request.getParameter("BidAmt");
		
		String createBid = "INSERT INTO Bid(AuctionID, BidAmt, BidderID) VALUES(?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(createBid);
		ps.setString(1, auctionID);
		ps.setString(2, bidAmt);
		ps.setString(3, uid);
		try{
			ps.executeUpdate();
		}catch(SQLException e){
			out.println("Oops! Something went wrong<br>");
		}
		
		String updateAuction = "UPDATE Auction SET CurrentBid = CASE HighestBidderID = " + uid + " WHEN " + bidAmt + " > CurrentBid THEN " + bidAmt;
		Statement stmt = con.createStatement();
		try{
			stmt.execute(updateAuction);
		}catch(SQLException e){
			out.println("Oops! Something went wrong<br>");
		}

		con.close();
		session.setAttribute("uid", uid);
		response.sendRedirect(response.encodeRedirectURL("createBid.jsp"));
	%>
</body>
</html>