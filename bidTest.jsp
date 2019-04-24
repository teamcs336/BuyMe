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
		/*Save userID, can get through either input or session object*/
		String uid = (String)session.getAttribute("uid");
		if(uid == null) uid = request.getParameter("userid");
		session.setAttribute("uid", uid);
	%>
	<h1>Find an auction by ID</h1>
	<form method="GET" action="bidTest.jsp">
		Input auctionID: <input type="number" name="auctionID">
		<input type="hidden" name="userid" value="<%=uid%>">
		<input type="submit" value="Submit">
	</form>
	<%
		
		/*Connect to database*/
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
	
		out.println("<h1>Hello " + uid + "</h1>");
		String aucID = request.getParameter("auctionID");
		String getAuction;
		Statement stmt;
		ResultSet rs = null;
		
		if(aucID != null){
			getAuction = "SELECT AuctionID, ItemDescription, CurrentBid, HighestBidderID, EndDate FROM Item NATURAL JOIN Auction WHERE " + aucID + " = AuctionID AND EndDate < NOW()";
			stmt = con.createStatement();
			try{
				rs = stmt.executeQuery(getAuction);
			}catch(SQLException e){
				//out.println("aucID: ");
			}
		}
		/*Output contents of search*/
		if(rs != null && rs.next()){
	%>
		<table>
			<tr>
				<th>AuctionID</th>
				<th>Item</th>
				<th>Current Bid</th>
				<th>Highest Bidder ID</th>
				<th>End Date</th>
			</tr>
			<tr>
				<td><%out.println(rs.getString(1));%></td>
				<td><%out.println(rs.getString(2));%></td>
				<td><%out.println(rs.getString(3));%></td>
				<td><%
					if(rs.getString(4) != null)out.println(rs.getString(4));
					else out.println("None");
					%></td>
				<td><%out.println(rs.getString(5));%></td>
			</tr>
		</table>
		<form action="createBid.jsp">
			Place a bid: <input type="number" name="BidAmt">
			<input type="hidden" name="AuctionID" value="<%=rs.getString(1)%>">
			<input type="hidden" name="userid" value="<%=uid %>">
			<input type="submit" value="Place Bid">
		</form>
		<form action="setUpperLimit.jsp">
			Set upper limit: <input type="number" name="UpperLimit">
			<input type="hidden" name="AuctionID" value="<%=rs.getString(1)%>">
			<input type="hidden" name="userid" value="<%=uid %>">
			<input type="submit" value="Set limit">
		</form>
	<%
		}else{
			out.println("No auctions found");
		}
		con.close();
	%>
</body>
</html>