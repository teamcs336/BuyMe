<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

div.a {
  text-align: center;
  padding-top: 100px;
}

input[type=text], input[type=password]{
  width: 30%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus{
  background-color: #ddd;
  outline: none;
  text-align: center;
}

.loginbtn {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.9;
  text-align: center;
}
</style>
<body>
	<form method="POST" action="login.jsp">
		<div class="a">
			<label for="UserEmail"><b>Email</b></label> <br>
		    <input type="text" placeholder="Enter Email" name="UserEmail" required>
		    <br>
		
		    <label for="UserPass"><b>Password</b></label> <br>
		    <input type="password" placeholder="Enter Password" name="UserPass" required>
		    <br>
		    
		    <div>
		    	<button type="submit" class="loginbtn">Login</button>
		    </div>
		    <br><br>
		    
		    <div>
			Don't have an account? <a href="createAccount.jsp">Create Account</a>
			</div>
			<br><br>
	    </div>
	</form>
	
</body>
</html>