<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결 테스트 JSP 페이지</title>
</head>

<body>
<h1>데이터베이스 연결 테스트</h1>
<hr>
<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/book_db";
	String user = "root";
	String passwd = "root";
	
	Class.forName(driverName);
	System.out.println("드라이버 로드 성공");
%>
	<br><h2>드라이버 로드 성공</h2>
<%
	Connection con = DriverManager.getConnection(url,user,passwd);
	System.out.println("데이터베이스 연결 성공");
%>
	<br><h2>데이터베이스 연결 성공</h2>
<%
	con.close();
%>
</body>

</html>