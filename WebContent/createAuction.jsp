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
		/*Create DB connection*/
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		/*Retrieve itemID*/
		String uid = (String)request.getParameter("uid");
		//uid = "1";
		
		/*Get item parameters*/
		String type = request.getParameter("ItemType");
		String size = request.getParameter("ItemSize");
		String color = request.getParameter("ItemColor");
		String gender = request.getParameter("ItemGender");
		String desc = request.getParameter("description");
		String date = request.getParameter("auctionEndDate");
		String time = request.getParameter("auctionEndTime");
		String minPrice = request.getParameter("minPrice");
		if(minPrice.equals("")) minPrice = null;
		
		String endDate = date + " " + time;

		/*Create SQL statement to create new item*/
		String createItem = "INSERT INTO Item(Gender, ItemDescription, ItemSize, SellerID, ItemColor)" +
			"VALUES(?, ?, ?, ?, ?)";
		PreparedStatement psCreateItem = con.prepareStatement(createItem);
		psCreateItem.setString(1, gender);
		psCreateItem.setString(2, desc);
		psCreateItem.setString(3, size);
		psCreateItem.setString(4, uid);
		psCreateItem.setString(5, color);
		try{
			psCreateItem.executeUpdate();
		}catch(SQLException e){
			out.println("UID IS " + uid);
		}
		
		/*Gets most recent item from seller*/
		String getItem = "SELECT ItemID FROM Item WHERE SellerID = " + uid + " ORDER BY ItemID DESC";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(getItem);
		String itemID = rs.next() ? rs.getString("ItemID") : null;
		
		/*Insert into item subcategory*/
		String subcat = "INSERT INTO " + type + " VALUES(?)"; 
		PreparedStatement psSub = con.prepareStatement(subcat);
		psSub.setString(1, itemID);
		psSub.executeUpdate();
		
		/*Create auction*/
		String createAuction = "INSERT INTO Auction(ItemID, StartDate, EndDate, NumOfBids, SellerID, MinBid, CurrentBid)" + 
				"VALUES(?, NOW(), ?, 0, ?, ?, 0)";
		PreparedStatement psCreateAuction = con.prepareStatement(createAuction);
		psCreateAuction.setString(1, itemID);
		psCreateAuction.setString(2, endDate);
		psCreateAuction.setString(3, uid);
		psCreateAuction.setString(4, minPrice);
		psCreateAuction.executeUpdate();
		
		con.close();
		session.setAttribute("uid", uid);
		response.sendRedirect(response.encodeRedirectURL("account.jsp"));
		//response.sendRedirect("account.jsp");
	%>




</body>
</html>