<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delete</title>
<base href="${pageContext.servletContext.contextPath}/">
<style>
	table {
  		border: 3px solid #f1f1f1;
  		width :75%;
  		
	}
	.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}
	.container {
  padding: 20px;
}
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
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}
</style>
</head>
<body>
	<div class="imgcontainer">
		<a href="http://localhost:8080/Booking/home/index.htm">
    	<img src="images/logo.png" alt="Avatar" class="avatar">
    	</a>
 		 </div>	
	<div class="container">	
	<table class="table table-hover">
	<tr>
		<th>Tên Nhà Hàng</th>
		<th>Địa chỉ</th>		
		<th>Số Điện Thoại</th>
		<th>Giá</th>
		<th>Số bàn</th>
		<th>Images</th>
		<th></th>		
	</tr>
	<c:forEach var="nh" items="${NhaHang}">
		<tr>
			<td>${nh.getTenNH()}</td>
			<td>${nh.getDiachi()}</td>
			<td>${nh.getSDT()}</td>
			<td>${nh.getGia()}</td>
			<td>${nh.getSoban()}</td>
			<td>${nh.getImages()}</td>		
			<td><button type="button" class="cancelbtn" style="background-color: lightgreen"><a href="home/delete/${nh.getMaNH()}.htm">Delete</a></button></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	<div class="container" style="background-color:#f1f1f1">
    		<button type="button" class="cancelbtn"><a href="http://localhost:8080/Booking/home/index.htm">Cancel</a></button>
  		</div>
</body>
</html>