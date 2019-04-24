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
		if(uid == null) uid = request.getParameter("userid");
		
		String auctionID = request.getParameter("AuctionID");
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
		
		String updateAuction = "UPDATE Auction SET HighestBidderID = IF("+ bidAmt + " > Auction.currentBid," + uid + ",Auction.HighestBidderID),"
				+ "NumOfBids = IF("+ bidAmt + " > Auction.currentBid,NumOfBids+1,NumOfBids),"
				+ "CurrentBid = IF("+ bidAmt + " > Auction.currentBid,"+ bidAmt + ",Auction.currentBid) WHERE AuctionID = " + auctionID;
		Statement stmt = con.createStatement();
		try{
			stmt.execute(updateAuction);
		}catch(SQLException e){
			out.println("Oops! Something went wrong<br>");
		}

		con.close();
		session.setAttribute("uid", uid);
		%>
		<input type="hidden" name="userid" value="<%=uid %>">
	<%
		response.sendRedirect(response.encodeRedirectURL("account.jsp"));
	%>
		
</body>
</html>