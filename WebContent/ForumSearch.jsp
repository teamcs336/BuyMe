<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "com.cs336.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 

<%--Written by Elizabeth Reynes--%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Forum Search</title>
<style>
* {
	box-sizing: border-box;
}

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

/* The dropdown container */
.dropdown {
	float: left;
	overflow: hidden;
}

/* Dropdown button */
.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font: inherit; /* Important for vertical align on mobile phones */
	margin: 0; /* Important for vertical align on mobile phones */
}

/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
	background-color: #BFBFBF;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	width: 100%;
	left: 0;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

/* Mega Menu header, if needed */
.dropdown-content .header {
	background: #CA0A0A;
	padding: 16px;
	color: white;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

/* Create three equal columns that floats next to each other */
.column {
	float: left;
	width: 25%;
	padding: 10px;
	background-color: #ccc;
	height: 250px;
}

/* Style links inside the columns */
.column a {
	float: none;
	color: black;
	padding: 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

/* Add a background color on hover */
.column a:hover {
	background-color: #ddd;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

.navbar .search-container {
	float: right;
}

.navbar input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.navbar .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.navbar .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.navbar .search-container {
		float: none;
	}
	.navbar a, .navbar input[type=text], .navbar .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.navbar input[type=text] {
		border: 1px solid #ccc;
	}
}

/* The side navigation menu */
.sidebar {
	margin: 0;
	padding: 0;
	width: 200px;
	background-color: #333;
	position: fixed;
	height: 100%;
	overflow: auto;
}

/* Sidebar links */
.sidebar a {
	display: block;
	color: white;
	padding: 16px;
	text-decoration: none;
}

/* Active/current link */
.sidebar a.active {
	background-color: #CA0A0A;
	color: white;
}

/* Links on mouse-over */
.sidebar
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#555
;

	
color
:
 
white
;


}

/* Page content. The value of the margin-left property should match the value of the sidebar's width property */
div.content {
	margin-left: 200px;
	padding: 1px 16px;
	height: 1000px;
}

/* On screens that are less than 700px wide, make the sidebar into a topbar */
@media screen and (max-width: 700px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.sidebar a {
		float: left;
	}
	div.content {
		margin-left: 0;
	}
}

/* On screens that are less than 400px, display the bar vertically, instead of horizontally */
@media screen and (max-width: 400px) {
	.sidebar a {
		text-align: center;
		float: none;
	}
}

* {
	box-sizing: border-box;
}

/* Style the search field */
form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

/* Style the submit button */
form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #CA0A0A;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none; /* Prevent double borders */
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

/* Clear floats */
form.example::after {
	content: "";
	clear: both;
	display: table;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

</style>
</head>
<body>

	<div class="navbar">
		<a href="homePage.jsp"><i class="fa fa-fw fa-home"></i>Home</a> <a
			href="Messages.jsp"> Account Info</a> <a class="active"
			href="Forum.jsp">Forum</a>
		<div class="dropdown">
			<button class="dropbtn">
				Search <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<div class="header">
					<h2>Search By Category</h2>
				</div>
				<div class="row">
					<div class="column">
						<h3>Shirts</h3>
						<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
							3</a>
					</div>
					<div class="column">
						<h3>Jackets</h3>
						<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
							3</a>
					</div>
					<div class="column">
						<h3>Shoes</h3>
						<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
							3</a>
					</div>
					<div class="column">
						<h3>Accessories</h3>
						<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
							3</a>
					</div>
				</div>
			</div>
		</div>

		<div class="search-container">
			<form action="/action_page.php">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>


	</div>

	<div style="padding-left: 16px">
		<h1>BuyMe</h1>
	</div>

	<!-- The sidebar -->
	<div class="sidebar">
		<a href="Forum.jsp">Forum</a> <a href="ForumPost.jsp">Post a
			question</a> <a class="active" href="ForumSearch.jsp">Search
			questions</a>

	</div>

	<!-- Page content -->
	<div class="content">
		<!-- Load icon library -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<!-- The form -->
		<form class="example" action="ForumSearchResult.jsp">
			<input type="text" placeholder="Search questions & answers..." name="QuestionSearch">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>



	</div>

</body>
</html>
