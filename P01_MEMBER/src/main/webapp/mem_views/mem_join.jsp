<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4OREVER :: 회원가입</title>
</head>

<style>
#important {
	color: red;
}
</style>

<body>
	<%
	//parameter
	/**
	* @param userID 로그인하는 유저 아이디 to member_dao.jsp
	* @param userPW 로그인하는 유저 비밀번호 to member_dao.jsp
	* @param userName 로그인하는 유저 이름 to member_dao.jsp
	* @param userMail 로그인하는 유저 이메일 to member_dao.jsp
	* @param userPhone 로그인하는 유저 전화번호 to member_dao.jsp
	* @param userRRN 로그인하는 유저 주민등록번호 to member_dao.jsp
	* @return
	*/
	%>
	<hr>
	<!-- header 시작 -->
	<header>
		<!-- include file="../header.jsp" 시작 -->
		<%@ include file="../header.jsp"%>
		<!-- include file="../header.jsp" 끝 -->

	</header>
	<!-- header 끝 -->

	<!-- nav 시작 -->
	<nav></nav>
	<!-- nav 끝 -->

	<h1>회원가입</h1>

	<!-- 회원가입 시작 -->
	<div>
		<form method="post" action="./member_dao.jsp">
			<sup id="important">*</sup>ID<br> <input type="text"
				placeholder="ID" name="userID" maxlength="20"> <input
				type="submit" value="ID 중복 체크"><br> <sup id="important">*</sup>PassWord<br>
			<input type="password" placeholder="PassWord" name="userPW"
				maxlength="20"><br> <sup id="important">*</sup>PassWord
			Check<br> <input type="password" placeholder="PassWord"
				name="userPW" maxlength="20"> <span style="color: gray">비밀번호는
				6자리 이상이어야 하며 영문과 숫자를 반드시 포함해야 합니다. </span> <br> <sup id="important">*</sup>Name<br>
			<input type="text" placeholder="Name" name="userName" maxlength="20"><br>
			e-mail<br> <input type="email" placeholder="e-mail"
				name="userMail" maxlength="20"><br> phone number<br>
			<input type="text" placeholder="phone" name="userPhone"
				maxlength="20"><br> <sup id="important">*</sup>RRN<br>
			<input type="text" name="userRRN" maxlength="20"> - <input
				type="password" name="userRRN" maxlength="20"><br> <br>
			<input type="hidden" name="actionType" value="JOIN"> <input
				type="submit" value="제출"><br>
		</form>
	</div>
	<!-- 회원가입 끝 -->

	<!-- footer 시작 -->
	<footer>
		<!-- include file="../footer.jsp" -->
		<%@ include file="../footer.jsp"%>
		<!-- include file="../footer.jsp" -->
	</footer>
	<!-- footer 끝 -->
</body>
</html>