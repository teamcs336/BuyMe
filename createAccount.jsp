<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BuyMe Auction Site</title>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

div.a {
  text-align: center;
}

/* Full-width input fields */
input[type=text], input[type=password], input[type=number] {
  width: 30%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus, input[type=number]:focus, input[type=email] {
  background-color: #ddd;
  outline: none;
  text-align: center;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.9;
  font-size: 15px;
  text-align: center;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.9;
  text-align: center;
  text-decoration: none;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: center;
  width: 15%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>

<body>
<div class="a">
<form method="post" action="newUser.jsp" style="border:1px solid #ccc">
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create a new account.</p>
    <hr>
	
    <label for="UserName"><b>User Name</b></label> <br>
    <input type="text" placeholder="Enter User Name" name="UserName" required>
    <br>

    <label for="UserEmail"><b>Email</b></label> <br>
    <input type="text" placeholder="Enter Email" name="UserEmail" required>
    <br>

    <label for="UserPW"><b>Password</b></label> <br>
    <input type="password" placeholder="Enter Password" name="UserPW" required>
    <br>
    
    <label for="UserPhone#"><b>Phone Number</b></label> <br>
    (<input type="number" size="3" placeholder="123" pattern="[0-9]{3}" name="UserPhone1#" required>) <input type="number" size="3" placeholder="456" pattern="[0-9]{3}" name="UserPhone2#" required> - <input type="number" size="4" placeholder="7890" pattern="[0-9]{4}" name="UserPhone3#" required>
    <br>
    <span class="note">Format: (123) 456-7890</span>
    <br><br>

	<br>
	<label for="UserAddress"><b>Address</b></label> <br>
    <input type="text" placeholder="Street" name="Street" required>
    <input type="text" placeholder="City" name="City" required>
    <br>
    <input type="text" placeholder="State" name="State" required>
    <input type="number" placeholder="ZIP Code" name="ZIP" required>

    <div class="clearfix">
      <a type="button" class="cancelbtn" href="index.jsp">Cancel</a>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>
<div>
Already have an account? <a href="SignInPage.jsp">Login Here</a>
</div>
<br><br>
</div>

</body>
</html>