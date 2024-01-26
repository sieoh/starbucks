<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>Starbucks Korea Coffee</title>
	  <!-- 파비콘 -->
	  <link rel="icon" href="./img/favicon.ico" />
	  <!-- reset.css -->
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	  <!-- google font & google material icon -->
	  <!-- Google 나눔고딕 -->
	  <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" />
	  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	  <!-- Google 매트리얼 아이콘 -->
	  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
	  <link rel="stylesheet" href="./css/main.css" />
	  <link rel="stylesheet" href="./css/notice.css" />
  	<link rel="stylesheet" href="./css/reset.css" />
	  
	  <script defer src="./js/jquery-3.7.1.min.js"></script>
	  <!-- lodash -->
	  <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
	  <!-- gsap -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
	  <!-- gsap_scrolltoplugin -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>
	  <!-- swiper -->
	  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
	  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
	  
	  <!-- Add icon library (페이스북 아이콘) -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	  <script defer src="./js/main.js"></script>
</head>

<body>
	<header>
		<!-- 헤더 영역 공통 부분 -->
  	<%@ include file ="header.jsp" %>
	</header>
	
	<!-- notice top -->
	<section>
		<div class="inner sub_tit_wrap">
			<div class="sub_tit_inner">
				<h2><img src="https://www.starbucks.co.kr/common/img/whatsnew/notice_tit.jpg" alt="공지사항"></h2>
	      <ul class="smap">
	      	<!-- 홈 버튼 누르면 스타벅스 메인 홈으로 이동 -->
          <li><a href="./index.jsp"><img src="https://image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로"></a></li>
          <li><img class="arrow" src="https://image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
          <li class="en"><a href="#">WHAT'S NEW</a></li>
          <li><img class="arrow" src="https://image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
          <li><a href="./notice.jsp" class="this">공지사항</a></li>
	      </ul>
			</div>
		</div>
	</section>
	
	<!-- notice contents -->
	<section>
		<div class="inner notice_det_wrap">
			<div class="notice_det_inner">
				<ul class="nmap">
					<li class="det__title">서비스 개선 및 서비스 점검 안내</li>
					
					
					<!-- facebook 아이콘 추가 -->
					<li class="fa fa-facebook"><a href="https://www.facebook.com/?locale=ko_KR"></a></li>
				</ul>
			</div>
			<div class="notice__contents">
			
				<p>안녕하세요. 스타벅스 코리아입니다. 보다 나은 서비스 제공을 위한 시스템 점검을 진행합니다.</p>
			</div>
		</div>
	</section>
	
	<!-- 목록 버튼 -->
	<section>
		<div class="inner btn--list">
			<a href="./notice.jsp" class="btn--li">목록</a>
		</div>
	</section>
	
	<!-- 윗글 & 아랫글 -->
	<section>
		<div class=""></div>
	</section>
	
</body>
</html>