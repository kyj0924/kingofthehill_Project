<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.test.*, java.io.*,java.util.*"%>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>King Of The Hill</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 400 15px/1.8 Lato, sans-serif;
    color: #777;
  }
  h3, h4 {
    margin: 10px 0 30px 0;
    letter-spacing: 10px;      
    font-size: 20px;
    color: #111;
  }
  .container {
    padding: 80px 120px;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  .carousel-inner img {
    -webkit-filter: grayscale(90%);
    filter: grayscale(40%); /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    margin-top: 60px;
  }
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-header, .modal-body {
    padding: 40px 50px;
  }
  .nav-tabs li a {
    color: #777;
  }
  #googleMap {
    width: 100%;
    height: 400px;
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%);
  }  
  .navbar {
    font-family: Montserrat, sans-serif;
    margin-bottom: 0;
    background-color: #2d2d30;
    border: 0;
    font-size: 11px !important;
    letter-spacing: 4px;
    opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
    color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
    color: #fff !important;
  }
  .navbar-nav li.active a {
    color: #fff !important;
    background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
  }
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
  footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 32px;
  }
  footer a {
    color: #f5f5f5;
  }
  footer a:hover {
    color: #777;
    text-decoration: none;
  }  
  .form-control {
    border-radius: 0;
  }
  textarea {
    resize: none;
  }
  
  .img-circle.person {
  width: 255px;
  height: 255px;
}


  
  </style>
</head>
<body id="main" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">KING OF THE HILL</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#main">메인으로</a></li>
        <li><a href="#menu">추천 메뉴</a></li>
        <li><a href="#shopping">새로운 게임</a></li>



     <c:if test="${!empty login_Player.player_ID}">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">더보기
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/ezen/outer/outerNotice">공지사항</a></li>
            <li><a href="/ezen/outer/outerFriend">친구찾기</a></li>
            <li><a href="/ezen/outer/outerRequest">요청사항</a></li> 
            <li><a href="/ezen/outer/outerRealtime">실시간테이블정보</a></li> 
            <li><a href="/ezen/outer/outerMyPage">마이페이지</a></li>
            <li><a href="/ezen/outer/outerLogout">로그아웃</a></li>

          </ul>
        </li>
 	</c:if>
 	
     <c:if test="${empty login_Player.player_ID}">
       <li class="dropdown1">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">더보기
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/ezen/outer/outerLogin">로그인</a></li>
            <li><a href="/ezen/outer/outerJoin">회원가입</a></li>            
            <li><a href="/ezen/outer/outerNotice">공지사항</a></li>
            <li><a href="/ezen/outer/outerFriend">친구찾기</a></li>
            <li><a href="/ezen/outer/outerRequest">요청사항</a></li> 
            <li><a href="/ezen/outer/outerRealtime">실시간테이블정보</a></li> 
          </ul>
        </li>
   </c:if>


      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    
    
      <div class="item active">
        <img src="/ezen/resources/image/newyear01.jpg" alt="02" style="width: 100vw; height: 700px;">
      </div>

      <div class="item">
		<img src="/ezen/resources/image/banner1.jpg" alt="01" style="width: 100vw; height: 700px;">
      </div>
    
      <div class="item">
        <img src="/ezen/resources/image/newyear02.jpg" alt="03" style="width: 100vw; height: 700px;">
              
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="menu" class="container text-center">
  						<h3>KING OF THE HILL</h3>
						<p>국내 최초의 24시간 운영되는 보드게임 카페입니다.
						<p>'King of the Hill'은 언제나 노력하는 보드게임카페이며,</p>
						<p>고객들의 만족을 위해 최선을 다하겠습니다.</p>
						<p>감사합니다.</p>  <br>
						<br><br><br><br><br>
	
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>추천메뉴</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="/ezen/resources/image/chicken.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>특제현미 파우더로만들어</p>
        <p>바삭한 식감과</p>
        <p>고소한 풍미가 가득한 치킨!</p>
          
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>추천메뉴</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="/ezen/resources/image/americano.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>그때 그 감동의 맛!</p>
        <p>그때 그 가격!</p>
        <p>인심 좋은 크기의 커피!</p>
 
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>추천메뉴</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="/ezen/resources/image/pizza.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>정통 아메리칸 BBQ</p>
        <p>소스를 더한 부드럽고</p>
        <p>입안가득 즐기는 꽉찬 풍미의 피자!</p>
      </div>
    </div>
  </div>
</div>

<!-- Container (TOUR Section) -->
<div id="shopping" class="bg-1">
  <div class="container">
    <h3 class="text-center">신상 보드게임</h3>
    <p class="text-center">2024  <br> KING OF THE HILL에서 <br>소개하는 보드게임 신상소개!</p>
    <br>
  
    
    <div class="row text-center">
<div class="col-sm-4">
  <div class="thumbnail">
    <img src="/ezen/resources/image/chess001.jpg"  alt="Paris" width="400" height="300">
    <p><strong>칼라체스</strong></p>
    <p>2004 신상</p>
    <button class="btn" data-toggle="modal" data-target="#myModal">더보기</button>
  </div>
</div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/ezen/resources/image/monopoly.png"  alt="New York" width="400" height="300">
          <p><strong>모노폴리</strong></p>
          <p>2024 신작</p>
          <button class="btn" data-toggle="modal" data-target="#myModal1">더보기</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/ezen/resources/image/chess002.jpg"  alt="San Francisco" width="400" height="300">
          <p><strong>우드체스</strong></p>
         <p>2024 신상</p>
          <button class="btn" data-toggle="modal" data-target="#myModal2">더보기</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon"></span>칼라체스</h4>
        </div>
        <div class="modal-body">
          <form role="form">
<p>"칼라체스는 2004년에 출시된 보드게임으로, </p>
<p>다양한 색상의 체스말을 사용하여 전통적인 체스 게임을 즐길 수 있습니다. </p>
<p>칼라체스는 전략과 논리적 사고를 요하는 게임으로, </p>
<p>가족이나 친구들과 함께 즐기기에 좋습니다.</p>
<p></p>
          </form>
        </div>

      </div>
    </div>
  </div>
    <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon"></span>모노폴리</h4>
        </div>
        <div class="modal-body">
          <form role="form">
<p>"최신 신작 보드게임인 모노폴리는 </p>
<p>도시 개발과 부동산 거래를 주제로 한 전략적인 보드게임으로, </p>
<p>참여자들은 자신만의 부동산 제국을 건설하고 </p>
<p>경제적인 우위를 차지하기 위해 경매와 거래를 펼칩니다.</p>
<p></p>
<p>게임판 위에는 다양한 지역과 부동산이 있으며, </p>
<p>참여자들은 주택, 상가, 호텔 등을 구매하고 </p>
<p>임대료를 받아 수익을 창출합니다. </p>
<p>운이 작용하는 요소도 있지만, </p>
<p>전략적인 거래와 투자 결정이 승리의 열쇠를 잡는 핵심입니다.</p>
<p></p>
<p>모노폴리는 가족이나 친구들과 함께 즐길 수 있는 </p>
<p>대표적인 보드게임으로, </p>
<p>즐거운 시간을 보내기에 최적입니다. </p>


          </form>
        </div>

      </div>
    </div>
  </div>
      <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon"></span>우드체스</h4>
        </div>
        <div class="modal-body">
          <form role="form">
<p>"이 체스말은 고품질의 우드 소재로 제작되어 </p>
<p>탁월한 마무리와 섬세한 디테일로 눈길을 사로잡습니다.</p>
<p></p>
<p>우드 체스말은 다양한 종류의 우드를 사용하여 제작되며, </p>
<p>각각의 체스말은 고급스러운 색상과 자연스러운 우드 그레인을 가지고 있습니다. </p>
<p>그 결과, 체스판 위에서 아름다운 시각적인 효과를 연출해줍니다.</p>
<p></p>
<p>이 우드 체스말은 체스를 즐기는 뿐만 아니라, </p>
<p>인테리어 소품으로서도 눈에 띄는 아름다움을 선사합니다. </p>
<p>고급스러움과 우아함을 추구하시는 분들에게 이 체스말은 완벽한 선택일 것입니다.</p>

          </form>
        </div>

      </div>
    </div>
  </div>
</div>


<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#main" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>KING OF THE HILL <a href="https://www.w3schools.com" data-toggle="tooltip" title="Visit w3schools"></a></p> 
</footer>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>

</body>
</html>
