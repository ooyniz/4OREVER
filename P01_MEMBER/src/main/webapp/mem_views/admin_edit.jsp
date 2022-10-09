<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/member_db";
	String user = "root";
	String passwd = "password";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");
	
	String mem_num = null;
	String mem_id = null;
	String mem_pw = null;
	String mem_name = null;
	String mem_email = null;
	String mem_phone = null;
	String mem_class = null;
	String mem_regDate = null;
	String sql = null;
	ResultSet rs = null;
	
	mem_num = request.getParameter("mem_num");
	
	sql = "SELECT * FROM member WHERE mem_num=" + mem_num;
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		mem_id = rs.getString("mem_id");
		mem_pw = rs.getString("mem_pw");
		mem_name = rs.getString("mem_name");
		mem_email = rs.getString("mem_email");
		mem_phone = rs.getString("mem_phone");
		mem_class = rs.getString("mem_class");
		mem_regDate = rs.getString("mem_regDate");
	}
	%>
	<!-- header.jsp 시작 -->
	<%@ include file="../header.jsp"%>
	<!-- header.jsp 끝 -->
	<h1>관리자 전용 회원수정 페이지</h1>
	<hr>
	<div>
		<form action="../mem_models/member_dao.jsp" method="post">
			<label>회원No</label>
			<input type="text" disabled="disabled" value="<%=mem_num%>">
			<br>
		
			<label>ID</label>
			<input type="text" disabled="disabled" value="<%=mem_id%>">
			<br>
			
			<label for="password">Password</label>
			<input type="password" id="password" value="<%=mem_pw%>" name="userPW">
			<br>
			
			<label for="name">이름</label>
			<input type="text" id="name" value="<%=mem_name%>" name="userName">
			<br>
			
			<label for="email">email</label>
			<input type="email" id="email" value="<%=mem_email%>" name="userMail">
			<br>
			
			<label for="phone">연락처</label>
			<input type="text" id="phone" value="<%=mem_phone%>" name="userPhone">
			<br>
			
			<label>회원 등급</label>
			<%
			// 부관리자는 관리자로 못만들게
			if ((int)session.getAttribute("user_class") == 200) {
			%>
			<select name="userClass">
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<%
			} else {
				%>
			<select name="userClass">
				<option value="100">100</option>
				<option value="200">200</option>
				<option value="300">300</option>
			</select>
			<%
			}
			%>
			<br>
			
			<label>가입일시</label>
			<input type="text" disabled="disabled" value="<%=mem_regDate%>">
			<br>
			
			<input type="hidden" value="EDIT_ADMIN" name="actionType">
			<input type="hidden" value="<%=mem_num%>" name="userNum">
			<input type="submit" value="수정">
		</form>
		
		<form action="../mem_models/member_dao.jsp" method="post">
			<input type="hidden" value="DELETE_ADMIN" name="actionType">
			<input type="hidden" value="<%=mem_num%>" name="userNum">
			<input type="submit" value="탈퇴">
		</form>
	</div>
</body>
</html>