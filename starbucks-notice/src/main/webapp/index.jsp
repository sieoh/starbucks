<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Starbucks Korea Coffee</title>
  <!-- 파비콘 => png는 무거워서 아이콘은 ico 파일로 가볍게 사용 가능 -->
  <link rel="icon" href="./images/favicon.ico" />
  
  <!-- reset.css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
  
  <!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  
  <!-- Google material 아이콘 -->
  <!-- 아이콘을 이미지가 아닌, 폰트처럼 사용 가능함 -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <link rel="stylesheet" href="./css/main.css" />
  <link rel="stylesheet" href="./css/reset.css" />
  
  <!-- defer속성은 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행됨을 명시하며, 
  		 이 속성은 <script> 요소가 외부 스크립트를 참조하는 경우에만 사용 가능 -->
  <script defer src="./js/jquery-3.7.1.min.js"></script>
  
  <!-- lodash 라이브러리 -->
  <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
  
  <!-- gsap 라이브러리 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
  <!-- gsap_scrolltoplugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>
  
  <!-- swiper 라이브러리 -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

  <script defer src="./js/main.js"></script>
</head>
<body>
	<header>
	  	<!-- 헤더 영역 공통 부분 -->
	  	<%@ include file ="header.jsp" %>
	
	    <!-- badges -->
	    <div class="badges">
			<div class="badge">
			  	<img src="./img/badge1.jpg" alt="badge1" />
			</div>
			<div class="badge">
			  	<img src="./img/badge2.jpg" alt="badge2" />
			</div>
	    </div>
  	</header>
  
	<!-- visual -->
	<section class="visual">
	  	<div class="inner">
	    	<div class="title fade-in">
		      	<img src="./img/visual_title.png" alt="starbucks delightful">
		      	<a href="#" class="btn btn-brown">자세히 보기</a>
	   		</div>
		    <div class="fade-in">
		      	<img src="./img/visual_cup1.png" alt="new oatmeal latte" class="cup1 image">
		      	<img src="./img/visual_cup1_text.png" alt="new oatmeal latte text" class="cup1 text">
		    </div>
		    <div class="fade-in">
		      	<img src="./img/visual_cup2.png" alt="mocha" class="cup2 image">
		      	<img src="./img/visual_cup2_text.png" alt="mocha text" class="cup2 text">
		    </div>
		    <div class="fade-in">
		     	<img src="./img/visual_spoon.png" alt="spoon" class="spoon">
		    </div>
	  	</div>
	</section>
		
	<!-- notice -->
	<section class="notice">
	
	  	<!-- notice-line -->
	  	<div class="notice-line">
			    <div class="bg-left"></div>
			    <div class="bg-right"></div>
			    <div class="inner">
			      	<div class="inner__left">
					        <h2>공지사항</h2>
					        <div class="swiper-container">
					        		<div class="swiper-wrapper">

<%
	// java 파일을 만들지 않는 상태로 jsp에서 DB 연동
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String USER = "jsp";
	String PASSWORD = "123456";
	
	Connection conn = null;		// 디비 접속 성공시 접속 정보 저장
	Statement stmt = null;		// 쿼리를 실행하는 객체 정보
	ResultSet rs = null;			
	
	Exception exception = null;
	
	try {
		// 1. JDBC로 Oracle 연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
		stmt = conn.createStatement();	// 2-1. Statement 생성
		// rs = stmt.executeQuery("SELECT * FROM BO_FREE");	// 2-2. SQL 쿼리 실행
		rs = stmt.executeQuery("SELECT ROWNUM, T.SUBJECT FROM (SELECT * FROM BO_FREE bf ORDER BY NUM DESC) T WHERE ROWNUM <=3");	// *보다 필요한 값을 직접 입력하는 것이 더 좋음
		
		// 3. rs로 데이터 가져온 걸 웹에 보여주기 => 쿼리 실행 결과 출력
		while(rs.next()) {
%>
	            <div class="swiper-slide">
	              	<a href="javascript:void(0)"><%= rs.getString("SUBJECT") %></a>
	            </div>
<%
			
		}
	} catch(Exception e) {
	  	System.out.println("오라클 접속 오류:" + e);
  }
%>
	          </div>
	        </div>
	        <a href="./notice.jsp" class="notice-line__more">
	          <span class="material-symbols-outlined">
	            add_circle
	          </span>
	        </a>
	      </div>
	      
	      <div class="inner__right">
	        <h2>스타벅스 프로모션</h2>
	        <div class="toggle-promotion">
	          <span class="material-symbols-outlined">
	            upload
	            </span>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <!-- 수평 슬라이드(promotion(스타벅스 프로모션)) -->
	  <div class="promotion">
	    <div class="swiper-container">
	      <div class="swiper-wrapper">
	        <div class="swiper-slide">
	          <img src="./img/promotion_slide1.jpg" alt="promotion1">
	          <a href="javascript:void(0)" class="btn btn-promotion">자세히 보기</a>
	        </div>
	        <div class="swiper-slide">
	          <img src="./img/promotion_slide2.jpg" alt="promotion2">
	          <a href="javascript:void(0)" class="btn btn-promotion">자세히 보기</a>
	        </div>
	        <div class="swiper-slide">
	          <img src="./img/promotion_slide3.jpg" alt="promotion3">
	          <a href="javascript:void(0)" class="btn btn-promotion">자세히 보기</a>
	        </div>
	        <div class="swiper-slide">
	          <img src="./img/promotion_slide4.jpg" alt="promotion4">
	          <a href="#" class="btn btn-promotion">자세히 보기</a>
	        </div>
	        <div class="swiper-slide">
	          <img src="./img/promotion_slide5.jpg" alt="promotion5">
	          <a href="javascript:void(0)" class="btn btn-promotion">자세히 보기</a>
	        </div>
	      </div>
	    </div>
	    <!-- If we need pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- If we need navigation buttons -->
	    <div class="swiper-prev">
	      <span class="material-symbols-outlined">
	        arrow_back
	      </span>
	    </div>
	    <div class="swiper-next">
	      <span class="material-symbols-outlined">
	        arrow_forward
	      </span>
	    </div>
	  </div>
	</section>
		
	<!-- Rewards -->
	<section class="rewards">
		<div class="bg-left"></div>
		<div class="bg-right"></div>
		<div class="inner">
		  
		</div>
	</section>
  
</body>
</html>