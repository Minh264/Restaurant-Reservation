<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Update</title>
<base href="${pageContext.servletContext.contextPath}/">
<style>
		/* Bordered form */
form {
  border: 3px solid #f1f1f1;
}

/* Full-width inputs */
input[type=text], input[type=password], input[type=file] {
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
	<form:form modelAttribute="NhaHang" action="home/update/${NhaHang.getMaNH()}.htm" method="post" enctype="multipart/form-data" >
 		  <div class="container">
 		  <label><b>Tên Nhà Hàng</b></label>
   		 <form:input path="TenNH" type="text" placeholder="Enter Ten Nha Hang" />
   		  <label><b>Địa chỉ</b></label>
   		 <form:input path="Diachi" type="text" placeholder="Enter Dia Chi" />
   		 <form:errors path="Diachi"/>
   		  <label><b>Số Điện Thoại</b></label>
   		 <form:input path="SDT" type="text" placeholder="Enter SDT" />
   		 <form:errors path="SDT"/>
   		  <label><b>Giá</b></label>
   		 <form:input path="Gia" type="text" placeholder="Enter Gia" />
   		 <form:errors path="Gia"/>
   		  <label><b>Số bàn</b></label>
   		 <form:input path="Soban" type="text" placeholder="Enter So ban" />
   		 <form:errors path="Soban"/>
   		  <label><b>Images</b></label>
   		  <form:input path="Images" type="text" placehodler="Enter Images"/>
   		  <form:errors path="Images"/>
   		  <input name="Imagesfl" type="file"/> 
   
   		 <button type="submit" name="btnUpdate">Update</button>
 		  </div>
 		   <div class="container" style="background-color:#f1f1f1">
    		<button type="button" class="cancelbtn"><a href="http://localhost:8080/Booking/home/index.htm">Cancel</a></button>
    		<button type="button" class="cancelbtn" style="background-color: lightblue"><a href="http://localhost:8080/Booking/home/update/${NhaHang.getMaNH()}.htm">ReLoad</a></button>
  		</div>
	</form:form>
</body>
</html>