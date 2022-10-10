<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 및 삭제</title>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body>
	<%
		String driverName = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/member_db";
		String user = "root";
		String passwd = "root";
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, user, passwd);
		PreparedStatement pstmt = null;
		request.setCharacterEncoding("utf-8");
		
		String sql = null;
		String mem_id = null;
		String mem_pw = null;
		String mem_name = null;
		String mem_email = null;
		String mem_phone = null;
		String mem_class = null;
		String mem_regDate = null;
		
		int userNum = (int) session.getAttribute("user_num");
		sql = "SELECT * FROM member WHERE mem_num=" + userNum;
		pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
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
	<h1>회원 수정 페이지</h1>
	<hr>
	<div>
		<form action="../mem_models/member_dao.jsp" method="post">
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
			<input type="text" disabled="disabled" value="<%=mem_class%>">
			<br>
			
			<label>가입일시</label>
			<input type="text" disabled="disabled" value="<%=mem_regDate%>">
			<br>
			
			<input type="hidden" value="EDIT" name="actionType">
			<input type="submit" value="수정">
		</form>
		
		<form action="../mem_models/member_dao.jsp" method="post">
			<input type="hidden" value="DELETE" name="actionType">
			<input type="submit" value="탈퇴">
		</form>
	</div>

	<!-- footer.jsp 시작 -->
	<%@ include file="../footer.jsp"%>
	<!-- footer.jsp 끝 -->
</body>
</html>