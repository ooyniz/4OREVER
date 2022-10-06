<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4OREVER :: 회원가입</title>
<style>

</style>

</head>
<body>
	<% //parameter
	/**
	* @param userID 로그인하는 유저 아이디 from join.jsp
	* @param userPW 로그인하는 유저 비밀번호 from join.jsp
	* @param userName 로그인하는 유저 이름 from join.jsp
	* @param userMail 로그인하는 유저 이메일 from join.jsp
	* @param userPhone 로그인하는 유저 전화번호 from join.jsp
	* @param userRRN 로그인하는 유저 주민등록번호 from join.jsp
	* @return
	*/
	 %>
	<hr>
	<!-- Start of header -->
	<header>
	<%@ include file="../header.jsp"%>
	
	</header>
	<!-- End of header -->
	<!-- Start of nav -->
	<nav>
	
	</nav>
	<!-- End of nav -->
	<h1>회원가입</h1>
	<form method="post" action="./member_dao.jsp">
		ID<br>
		<input type="text" placeholder = "ID" name="userID" maxlength = "20">
		<input type="submit" value= "ID 중복 체크"><br>
		PassWord<br>
		<input type="password" placeholder = "PassWord" name="userPW" maxlength = "20"><br>
		Name<br>
		<input type="text" placeholder = "Name" name="userName" maxlength = "20"><br>
		e-mail<br>
		<input type="email" placeholder = "e-mail" name="userMail" maxlength = "20"><br>
		phone number<br>
		<input type="text" placeholder = "phone" name="userPhone" maxlength = "20"><br>
		RRN<br>
		<input type="text" name="userRRN" maxlength = "20"> -
		<input type="password" name="userRRN" maxlength = "20"><br><br>
		<input type="button" value= "제출"><br>
	</form>
	
	
	<!-- Start of footer -->
	<footer>
	
	<%@ include file="../footer.jsp"%>
	</footer>
	<!-- End of footer -->
</body>
</html>