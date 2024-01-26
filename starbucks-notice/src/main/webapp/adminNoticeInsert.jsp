<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception"%>
<%@ page import="java.sql.*"%>
<%	
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		String korname = request.getParameter("korname");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	  String USER = "jsp";
	  String PASSWORD = "123456";
		
	  Connection conn = null; //디비 접속 성공시 접속 정보 저장
		PreparedStatement pstmt = null; //쿼리를 실행하기 객체 정보
		
		Exception exception = null;
		
		try {
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  System.out.println("오라클 접속 성공");
		  
			// 2. BO_FREE 테이블 화면 폼으로부터 가져온 데이터 입력
			String insertQuery = "INSERT INTO BO_FREE(NAME, SUBJECT, CONTENT) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(insertQuery);
			pstmt.setString(1, korname);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			exception = e;
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if (conn != null) try {conn.close();} catch(SQLException ex) {}
		}
%>

<%
		if (exception == null) {
%>
<!-- 성공 케이스 -->
<script>
		alert('공지사항 글이 성공적으로 등록되었습니다.')
		location.href = '<%= request.getContextPath() %>/adminNoticeList.jsp';
</script>
<%
 } else {
%>
<!-- 실패 케이스 -->
<script>
		alert('공지사항 글 등록을 실패하였습니다.')
</script>
공지사항 글 등록이 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() %>
<%
		}
%>
		
		
		
		
		