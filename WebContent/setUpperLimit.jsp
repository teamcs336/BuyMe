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
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		/*Get current user's id*/
		String uid = (String)session.getAttribute("uid");
		
		String auctionID = request.getParameter("Auction");
		String upperLimit = request.getParameter("UpperLimit");
		if(upperLimit != null){
			String trigger = "DELIMITER $ " + 
					"CREATE TRIGGER trig" + uid+auctionID + " AFTER UPDATE ON Auction " + 
					"FOR EACH ROW " + 
					"BEGIN " + 
					    "SET Auction.HighestBidderID = (SELECT BidderID FROM Bid WHERE CurrentBid+5 < " + upperLimit + " AND " + auctionID + " = Bid.AuctionID ORDER BY UpperLimit DESC), " + 
							"CurrentBid = CurrentBid + 5; " + 
					"END$ " + 
					"DELIMITER ;";
					
			Statement trigstmt = con.createStatement();
			try{
				trigstmt.execute(trigger);
			}catch(SQLException e){
				out.println("No available auctions");
			}
		}
		
		con.close();
		session.setAttribute("uid", uid);
		response.sendRedirect(response.encodeRedirectURL("createBid.jsp"));
	%>
</body>
</html>