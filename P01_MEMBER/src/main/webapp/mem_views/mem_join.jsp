<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
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
	<!-- 아이디 중복검사용. 세션에 있는 아이디를 자바스크립트로 옮기기 -->
	 <script type="text/javascript">
		 	let allUserIdList = [];
	</script>
	 <%
	 @SuppressWarnings("unchecked")
	 ArrayList<String> allUserIdList = (ArrayList<String>)session.getAttribute("allUserIdList");
	 
	 for (String s : allUserIdList) {
		 %>
		 <script type="text/javascript">
		 	allUserIdList.push('<%=s%>');
		 </script>
		 <%
	 }
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
	<div id="join">
		<form method="post" action="./member_dao.jsp">
			<sup id="important">*</sup>ID<br> <input type="text"
				placeholder="ID" name="userID" maxlength="20" @input="idCheck()" v-model="userId">
				{{idCheckResult}}<br> <sup id="important">*</sup>PassWord<br>
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
	
	
	<!-- 아이디 중복 검사용 스크립트 -->
	<script>
	let app = new Vue({
		el: '#join',
		data: {
			userId : '',
			isDuplicate : '아이디가 중복이 아닙니다.',
		},
		methods: {
			idCheck() {
				let duplicate = false;
				for (let i = 0; i < allUserIdList.length; i++) {
					if (this.userId == allUserIdList[i]) duplicate = true;
				}
				
				if (duplicate) this.isDuplicate = '중복된 아이디입니다.';
				else this.isDuplicate = '아이디가 중복이 아닙니다.';
			},
		},
		computed: {
			idCheckResult() {
				return this.isDuplicate;
			}
		},
	});
	</script>
</body>
</html>