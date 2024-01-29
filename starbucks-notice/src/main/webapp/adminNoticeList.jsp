<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/jquery-3.7.1.min.js"></script>
    <title>스타벅스 공지사항 어드민</title>
</head>
<body>
<%
		String searchText =  request.getParameter("search");
		if (searchText == null){
			searchText = "";
		}

%>
    <!-- 1. 게시판의 화면은 class="card"로 적용 -->
    <div class="card">

        <!-- 1-1. 게시판 이름은 class="card-header"로  <div>로 구역 설정 -->
        <div class="card-header"><a href="#"><h1>스타벅스 공지사항 어드민</h1></a></div>

        <!-- 1-2. 내용은 class="card-body"로 <div>로 구역 설정 -->
        <div class="card-body">

            <!-- 검색어 입력하기 -->
            <input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value="<%= searchText %>"><a class="search" href="javascript: searchText();">검색</a>
            
            <!-- 내용을 HTML로 작성하기 -->
<%
		// DB 접속
		String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	  String USER = "jsp";
	  String PASSWORD = "123456";
		
	  Connection conn = null; //디비 접속 성공시 접속 정보 저장
		Statement stmt = null; //쿼리를 실행하기 객체 정보
		ResultSet rs = null;
		
		Exception exception = null;
		
	  try {
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  System.out.println("오라클 접속 성공");
		  
			// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
		 	stmt = conn.createStatement();	// 2-1. Statement 생성
		 	rs = stmt.executeQuery("SELECT NUM, SUBJECT, HIT, REGDATE FROM BO_FREE WHERE SUBJECT LIKE '%" + searchText + "%' ORDER BY NUM DESC fetch first 5 rows only"); // 2-2. SQL 쿼리 실행
			
		 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
		 	while(rs.next()) {
%>            
            <div class="content-box">
                <div><%= rs.getInt("NUM") %></div>
                <div class="title"><a href="./adminNoticeUpdateForm.jsp?num=<%= rs.getInt("NUM") %>"><%= rs.getString("SUBJECT") %></a></div>
                <div><%= rs.getDate("REGDATE") %></div>
                <div class="delete"><button style="cursor: pointer;" onClick="javascript: noticeDelete(<%= rs.getInt("NUM") %>);">X</button></div>
            </div>
<% 		 		
	 	}
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류:" + e);
  }
%>

        </div>
        <!-- 1-3. 글쓰기 버튼은 class="btn"로 <div>로 구역 설정 -->
        <div class="btn">
            <a href="./adminNoticeInsertForm.jsp">글쓰기</a>
        </div>
    </div>
    
    <script>
    		// 검색어 메소드
		    function searchText() {
						location.href = "./adminNoticeList.jsp?search=" + $('#search-text').val();
				}
		    function noticeDelete(noticeNum) {
	    		if (confirm('정말 삭제하시겠습니까?')) {
	    			location.href = "./adminNoticeDelete.jsp?num=" + noticeNum;
	    		}tdl 
	    	}
    </script>
    
</body>
</html>