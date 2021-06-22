<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <base href="${pageContext.servletContext.contextPath}/">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Contact</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
     <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="style.css">
     <style >
 *{
     margin:0;
     padding: 0;
     font-family: 'Roboto', sans-serif;
     box-sizing: border-box;
 }
section{
     position: relative;
     display: flex;
     justify-content: center;
     align-items: center;
     min-height: 100vh;
     background: #112d42;
 }
section::before{
     content: "";
     position: absolute;
     top: 0;
     left: 0;
     width:50%;
     height: 100%;
     background: #03a9f4;
 }
section .container{
     position: relative;
     min-width: 1100px;
     min-height: 550px;
     display:flex;
     z-index: 100;
 }
 section .container .containerinfo{
     position: absolute;
     top: 40px;
     width: 350px;
     height: calc(100% - 80px);
     background: #0f3959;
     z-index: 1;
     padding: 40px;
     display: flex;
     flex-direction: column;
     justify-content: space-between;
     box-shadow: 0 20px 20px rgba(0,0,0,0.2);
 }
section .container .containerinfo h2{
     color: #fff;
     font-size: 24px;
     margin: 20px 0;
 }
 section .container .containerinfo li{
     position: relative;
     list-style: none;
     display: flex;
     margin: 20px 0;
     cursor: pointer;
     align-items: flex-start;
 }
section .container .containerinfo li span{
     color: #fff;
     margin-left: 10px;
     font-weight: 300;
     opacity: 0.5;
     font-size: 20px;
 }
 /*Hiệu Ứng Hover Cho Thẻ Li*/
 section .container .containerinfo li:hover span{
     opacity: 1;
 }
 section .container .containerinfo .sci{
     position: relative;
     display:flex;
 }
section .container .containerinfo .sci li{
     list-style: none;
     margin-right: 15px;
 }
section .container .containerinfo .sci li a{
     text-decoration: none;
     opacity: 0.5;
     color: #fff;
     font-size: 32px;
 }
 /*Hiệu Ứng Hover Icon*/
 section .container .containerinfo .sci li:hover a{
     opacity: 1;
 }
     </style>
</head>

<body>
<section>
   <div class="container">
     <div class="containerinfo">
       <div>
         <h2>Thông Tin Liên Hệ</h2>
         <ul class="info">
           <li>
             <span><i class="fa fa-map-marker" aria-hidden="true"></i></span>
             <span>Đường 1234 Phan Văn Trị<br />
               Quận Gò Vấp,<br />
               Thành Phố Hồ Chí Minh
             </span>
           </li>
           <li>
             <span><i class="fa fa-envelope" aria-hidden="true"></i></span>
             <span>vtminh264@gmail.com</span>
           </li>
          <li>
             <span><i class="fa fa-phone-square" aria-hidden="true"></i></span>
             <span>0976-103-793</span>
           </li>
         </ul>
       </div>
       <ul class="sci">
         <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
         <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
         <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
         <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
         <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
       </ul>
       </div>
    </div>
</section>
</body>
</html>