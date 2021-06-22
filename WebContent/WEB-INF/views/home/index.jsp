<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
header {
	background-image: url('images/banner.jpg');
	background-size: 100% 100%;
	position: relative;
	padding-bottom: 3%;
}
	.nav{
		overflow:hidden;
		background-color: white;		
	}
	.nav a{
		float: left;
		display: block;
		color: black;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}
	.nav a:hover{
		background-color: GreenYellow;
		color: black;
	}
body {
	margin: 0;
	padding: 0px;
	background-color: lightgray;
}
	.items{
		overflow:hidden;
		background-color: white;
	}
	.items a{
		float: left;
		display: block;
		color: black;
		text-align: center;
		height: 200px;
		width: 250px;`
		text-decoration: none;
		border-style: hidden;
	}
</style>
</head>
<body>
		<div class="w3-container-full w3-lightgray">
			<header> 
				<div class="logo-pad-r" style=" padding: 50px 0px 30px 40px ">
					<a href="http://localhost:8080/Booking/home/index.htm">
						<img alt="logo" src="images/logo.png" style="width: 15%; background-color: white ">
					</a>
				</div>							
			</header>		
		</div>
		<div class="container w3-white" style="border-style: solid; border-color: white" >
				<div class="nav">
				<a href="http://localhost:8080/Booking/home/index.htm">Ăn uống</a>
				<a href="http://localhost:8080/Booking/home/index.htm">Tráng miệng</a>
				<a href="http://localhost:8080/Booking/home/contact.htm">Liên hệ</a>				
				<c:if test="${sessionScope.uname ==null}">
					<a href="http://localhost:8080/Booking/home/login.htm"style="float: right">Đăng nhập</a>
				</c:if>		
				<c:if test="${sessionScope.uname !=null}">
					<strong style="float: right">Xin chào, ${sessionScope.uname}<a href="http://localhost:8080/Booking/home/login.htm"style="float: right">Đăng xuất</a></strong>
					<c:if test="${sessionScope.uname =='admin'}">
						<a href="http://localhost:8080/Booking/home/insert.htm">Thêm</a>
						<a href="http://localhost:8080/Booking/home/delete.htm">Xóa</a>
					</c:if>
				</c:if>				
				</div>
				
		</div>
		<div class="container w3-white" style="border-style: solid;border-color:white; margin-top:5px; padding-left: 80px; padding-right: 50px; padding-top: 10px">				
				<div class="items">
					<c:if test="${sessionScope.uname == 'admin'}">
						<c:forEach var="nh" items="${NhaHang}">
						<div style="border-style: hidden" >
							<a href="home/update/${nh.getMaNH()}.htm" class="w3-hover-opacity">
							 <img alt="items" src="${nh.getImages()}" style="width: 250px; height: 150px; padding-right:5px; padding-top:5px"> 
							<label style="font-weight: bold; font-style: serif">${nh.getTenNH()}</label>
							<label style="font-weight: normal; font-style: serif">${nh.getDiachi()}</label>
							</a> 
						</div>
						</c:forEach>  
					</c:if>
					<c:if test="${sessionScope.uname != 'admin'}">
						<c:forEach var="nh" items="${NhaHang}">
						<div style="border-style: hidden" >
					 		<a href="home/reserve/${nh.getMaNH()}.htm" class="w3-hover-opacity">
							 <img alt="items" src="${nh.getImages()}" style="width: 250px; height: 150px; padding-right:5px; padding-top:5px"> 
							<label style="font-weight: bold; font-style: serif; margin-top:3px">${nh.getTenNH()}</label>
							<label style="font-weight: normal; font-style: serif">${nh.getDiachi()}</label>
							</a> 
						</div>
						</c:forEach>  
					</c:if>
				</div>
			</div>
</body>
</html>