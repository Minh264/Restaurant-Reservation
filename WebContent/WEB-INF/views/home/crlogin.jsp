<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Create Login</title>
<base href="${pageContext.servletContext.contextPath}/">
<style>
	/* Bordered form */
form {
  border: 3px solid #f1f1f1;
}

/* Full-width inputs */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 20%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Add padding to containers */
.container {
  padding: 20px;
}
  .cancelbtn {
    width: 5%;
  }
}
</style>
</head>
<body>
	<div class="imgcontainer">
		<a href="http://localhost:8080/Booking/home/index.htm">
    	<img src="images/logo.png" alt="Avatar" class="avatar">
    	</a>
 		 </div>	
	${message}
	<form action="home/crlogin.htm" method="post">
 		  <div class="container">
 		  <label for="uname"><b>Username</b></label>
   		 <input  type="text" placeholder="Enter Username" name="uname" required/>
   		 
   		 <label for="psw"><b>Password</b></label>
   		 <input type="password" placeholder="Enter Password" name="psw" required/>
   		 
   		 <button type="submit" name="btnCrlogin">Create Login</button>
 		  </div>
 		   <div class="container" style="background-color:#f1f1f1">
    		<button type="button" class="cancelbtn"><a href="http://localhost:8080/Booking/home/login.htm">Cancel</a></button>
  		</div>
	</form>
</body>
</html>