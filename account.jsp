<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Auctions</title>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

/* Navbar container */
.navbar {
  overflow: hidden;
  background-color: #333;
  font-family: Arial;
}

/* Links inside the navbar */
.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Current/active navbar link */
.active {
  background-color: #CA0A0A;
}
/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: #BFBFBF;
}
</style>
</head>
<body>
	<div class="navbar">
			<a class="active" href="<%=response.encodeURL("index.jsp")%>"><i class="fa fa-fw fa-home"></i>Home</a>
			<a class="active" href="logout.jsp"><i class="fa fa-fw fa-home"></i>Logout</a>
			<a class="active" href="<%=response.encodeURL("bidTest.jsp")%>"><i class="fa fa-fq fa-home"></i>Find Auction</a>
	</div>
		
	<div style="margin: 5px">
	<% 
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String uid = (String)session.getAttribute("uid");
		if(uid == null) uid = request.getParameter("userid");
		if(uid != null && uid.equals("1")){
			out.println("<br><b>Hello Admin</b>");
		}else if(uid == null || session == null){
			//con.close();
			out.println("uid: " + uid);
			session.invalidate();
			out.println("Something went wrong!");
			out.println("Please <a href=\"SignInPage.jsp\">login</a> again");
		}
		
		Statement stmt = con.createStatement();
		
		/*List the auction a user has bid on*/
		String validAuctions = "SELECT AuctionID, ItemDescription, CurrentBid, MinBid, EndDate FROM Item NATURAL JOIN Auction WHERE SellerID = " + uid + " AND EndDate > NOW()";
		ResultSet auction = stmt.executeQuery(validAuctions);
	%>	
			<h1>Your Listed Auctions</h1>
			<table>
				<tr>
					<th>AuctionID</th>
					<th style="padding-left: 60px">Item</th>
					<th style="padding-left: 60px">Current Bid</th>
					<th style="padding-left: 60px">Minimum Bid
					<th style="padding-left: 100px">Auction End</th>
				</tr>
	<% 
		
	
		while(auction.next()){
			out.println("<tr>");
			out.println("<td>" + auction.getString("AuctionID") + "</td>");
			out.println("<td style=\"padding-left: 60px\">" + auction.getString("ItemDescription") + "</td>");
			out.println("<td style=\"padding-left: 60px\">" + auction.getString("CurrentBid") + "</td>");
			out.println("<td style=\"padding-left: 60px\">" + auction.getString("MinBid") + "</td>");
			out.println("<td style=\"padding-left: 100px\">" + auction.getString("EndDate") + "</td>");
			out.println("</tr>");
		}
	%>
		</table>
		
	<% 
		String expiredAuctions = "SELECT AuctionID, ItemDescription, CurrentBid, MinBid, HighestBidderID FROM Item NATURAL JOIN Auction WHERE SellerID = " + uid + " AND EndDate < NOW()";
		Statement stmt2 = con.createStatement();
		ResultSet expAuc = stmt2.executeQuery(expiredAuctions);
	%>
		<h1>Your Expired Auctions</h1>
		<table>
			<tr>
				<th>AuctionID</th>
				<th style="padding-left: 60px">Item</th>
				<th style="padding-left: 60px">Current Bid</th>
				<th style="padding-left: 60px">Minimum Bid</th>
				<th style="padding-left: 100px">Highest Bidder</th>
			</tr>
			<%
			while(expAuc.next()){
				String curBid = expAuc.getString("CurrentBid");
				String minBid = expAuc.getString("MinBid");
				if(minBid == null) minBid = "None";
				out.println("<tr>");
				out.println("<td>" + expAuc.getString("AuctionID") + "</td>");
				out.println("<td style=\"padding-left: 60px\">" + expAuc.getString("ItemDescription") + "</td>");
				out.println("<td style=\"padding-left: 60px\">" + curBid + "</td>");
				out.println("<td style=\"padding-left: 60px\">" + minBid + "</td>");
				if(minBid.equals("None") || curBid.compareTo(minBid) > 0){
					if(expAuc.getString("HighestBidderID") != null)	out.println("<td style=\"padding-left: 100px\">" + expAuc.getString("HighestBidderID") + "</td>");
					else out.println("<td style=\"padding-left: 100px\">None</td>");
				}
				else out.println("<td style=\"padding-left: 100px\">None</td>");
				out.println("</tr>");
			}
			%>
		</table>
        
        <h2>Create an auction</h2>
        <form action="createAuction.jsp" method="GET">
        	<input type="hidden" name="uid" value="<%=uid %>">
            <b style="padding-right: 106px">Item</b>
            <br>
            <input type="radio" name="ItemType" value="Accessories" checked="checked">Accessory<br>
            <input type="radio" name="ItemType" value="Shirts">Shirt<br>
            <input type="radio" name="ItemType" value="Jackets">Jacket<br>
            <input type="radio" name="ItemType" value="Shoes">Shoes<br>
            <b style="padding-right: 15px">Size</b>
            <b style="padding-right: 25px">Color</b>
            <b>Gender</b><br>
            <select name="ItemSize" required>
                <option value="extra-small">XS</option>
                <option value="small">S</option>
                <option value="medium">M</option>
                <option value="large">L</option>
                <option value="extra-large">XL</option>
            </select>
            <select name="ItemColor" required>
                <option value="red">Red</option>
                <option value="blue">Blue</option>
                <option value="green">Green</option>
                <option value="yellow">Yellow</option>
                <option value="purple">Purple</option>
                <option value="pink">Pink</option>
                <option value="white">White</option>
                <option value="black">Black</option>
                <option value="gray">Gray</option>
                <option value="otherColor">Other</option>
            </select>
            <select name="ItemGender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <br>
            <b style="margin-top: 50px">Item Description</b>
            <br>
            <textarea maxlength="50" rows="5" cols="50" name="description" placeholder="Enter Description" required></textarea>
            <br>
            Input end date: <input style="margin-top: 5px" type="date" name="auctionEndDate" placeholder="yyyy-mm-dd" required>
            <br>
            Input end time: <input style="margin-top: 5px" type="time" name="auctionEndTime" placeholder="hh:mm:ss" required>
            <br>
            Set a minimum price: <input style="margin-top: 5px" type="number" name="minPrice" >
            <br><br>
            <input type="submit" value="Create Auction">
        </form>
        
        <h2>Set alert</h2>
        <form action="alert.jsp" method="GET">
            <input type="number" style="width: 110px" name="userAlert" placeholder="Input Auction ID">
            <br>
            <br>
            <input type="submit" value="Set Alert">
        </form>
       </div>
       
</body>
</html>