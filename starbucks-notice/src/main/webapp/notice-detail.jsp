<%@page import="java.sql.PreparedStatement"%>
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
	  <title>스타벅스 공지사항 상세내용</title>
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
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	
		String num = request.getParameter("num");
		
		String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	  String USER = "jsp";
	  String PASSWORD = "123456";
		
	  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	  Statement stmt = null; // 쿼리 R 실행문
	  PreparedStatement pstmt = null; // 쿼리 실행문
		ResultSet rs = null;
		
		Exception exception = null;
		
		String title = ""; 		// 공지사항 제목
		String content = ""; 	// 공지사항 내용
		String upTitle = ""; 		// 공지사항 윗글 제목
		String dwonTitle = ""; 	// 공지사항 아랫글 제목
		
	  try {
			// 0.
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  
			// 2. BO_FREE 테이블에 선택한 글 조회수 1 올리기
			String updatequery = "update BO_FREE SET HIT = HIT+1 WHERE NUM = ?";
		 	pstmt = conn.prepareStatement(updatequery);
		 	pstmt.setInt(1, Integer.parseInt(num));
		 	
		 	pstmt.executeUpdate();
		 	
		 	// 3-1. 읽기를 위해 Statment 생성
		 	stmt = conn.createStatement();
		 	
		 	// 3-2. SQL 조회 쿼리 실행
		 	rs = stmt.executeQuery("SELECT NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num);
		 	
		 	// 3-3. SQL 조회 쿼리 가져온 데이터를 자바 String 변수 set
		 	if(rs.next()) {
		 		title = rs.getString("SUBJECT");
		 		content = rs.getString("CONTENT");
		 	}
		 	
		 	// 윗글
		 	
		 	rs = stmt.executeQuery("SELECT MIN(num) NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num);
		 	
		 	// 아랫글
		 	
		 	rs = stmt.executeQuery("SELECT MAX(num)  NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num);
		 	
		} catch(Exception e) {
			exception = e;
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		}
	%>
	
	<!-- notice contents -->
	<section>
		<div class="inner notice_det_wrap">
			<div class="notice_det_inner">
				<ul class="nmap">
					<li class="det__title"><%= title %></li>
					
					
					<!-- facebook 아이콘 추가 -->
					<li class="fa fa-facebook"><a href="https://www.facebook.com/?locale=ko_KR"></a></li>
				</ul>
			</div>
			
			<div class="notice__contents">
				<p><%= content %></p>
			</div>
		</div>
	</section>
	
	<!-- 목록 버튼 -->
	<section>
		<div class="inner btn--list">
			<a href="./notice.jsp" class="btn btn-li">목록</a>
		</div>
	</section>
	
	<!-- 윗글 & 아랫글 -->
	<section>
		<div>
			<div class="">윗글</div>
			<div class=""></div>
			<div class="">아랫글</div>
			<div class=""></div>
		</div>
	</section>
	
</body>
</html>