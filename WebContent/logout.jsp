<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession endSession = request.getSession(false);
		endSession.setAttribute("loggedIn", null);
		endSession.invalidate();
		response.sendRedirect(response.encodeRedirectURL("index.jsp"));
	%>
</body>
</html>