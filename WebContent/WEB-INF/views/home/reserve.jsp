<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Reserve</title>
<base href="${pageContext.servletContext.contextPath}/">
<style>
	.imgcontainer {
  text-align: center;
  margin: 5px 0 5px 0;
}
header {
	background-image: url('images/banner1.jpg');
	background-size: 100% 100%;
	position: relative;
	padding-bottom: 3%;
}
body {
	margin: 0;
	padding: 0px;
	background-color: lightgray;
}
	.container {
  padding: 10px;
  width:100%;
}
	.items{
		overflow:hidden;
		background-color: white;
		width:40%;
		float:left;
		border: 1px solid #ccc;
		box-sizing: border-box;
		padding: 12px 20px;
	}
	form {
  border: 3px solid #f1f1f1;
}

/* Full-width inputs */
input[type=text], input[type=password], input[type=date] {
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
  .cancelbtn {
    width: 15%;
  }
}
</style>
</head>
<body>
	<div class="imgcontainer">
		<header>
			 <a href="http://localhost:8080/Booking/home/index.htm">
    		<img src="images/logo.png" alt="Avatar" class="avatar">
    		</a> 
		</header>
 		 </div>	
 	<div class="container">
 	<form:form modelAttribute="Book" action="home/reserve/${NhaHang.getMaNH()}.htm" method="post">	
		<div class="items">
			<img alt="items" src="${NhaHang.getImages()}" style="width: 250px; height: 150px"> 
			<div style="box-sizing: border-box;padding-right: 50px; float: right">
				<label style="font-weight: bold; font-style: serif; font-size: 20px">${NhaHang.getTenNH()}</label>
				<div style="padding-top: 5px">
					<label style="font-weight: normal; font-style: serif">Địa Chỉ : ${NhaHang.getDiachi()}</label>
				</div>
				<div style="padding-top: 5px">
				<label style="font-weight: normal; font-style: serif">Số Điện Thoại : ${NhaHang.getSDT()}</label>	
				</div>	
				<div style="padding-top: 5px">
				<label style="font-weight: normal; font-style: serif">Giá : ${NhaHang.getGia()} đ</label>	
				</div>		
			</div>
		</div>	
		<div class="container" style="background-color:white">
    		 ${message}
  		</div>	 
		<div class="items" style="width:60%">
 		  	<label><b>Họ và Tên</b></label>
   		 	 <form:input path="HoTen" type="text" placeholder="Enter Name" />
   			 <form:errors path="HoTen"/>
   		 	 <label><b>Số Điện Thoại</b></label>
   			 <form:input path="SDT" type="text" placeholder="Enter SDT" />
   			 <form:errors path="SDT"/>
   			  <label><b>Email</b></label>
   			 <form:input path="Email" type="text" placeholder="Enter Email" />
   			 <form:errors path="Email"/>
   			  <label><b>Thời Gian</b></label>
   			 <form:input path="ThoiGian" type="date"/>
   			 <form:errors path="ThoiGian"/>
   			 <button type="submit" name="btnReserve">Đặt Bàn</button>
   			 <button type="button" class="cancelbtn" style="float:right"><a href="http://localhost:8080/Booking/home/index.htm">Cancel</a></button>
 		 </div>	 
 	</form:form> 
 	</div>
</body>
</html>