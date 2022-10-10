<%@page import="java.sql.*"%>
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
	<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/member_db";
	String user = "root";
	String passwd = "password";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");
	
	String sql = null;
	ResultSet rs = null;
	ArrayList<String> allUserIdList = new ArrayList<String>();

	sql = "SELECT mem_id FROM member;";
	pstmt = con.prepareStatement(sql);
   	rs = pstmt.executeQuery(sql);
   	
   	while (rs.next()) {
		allUserIdList.add(rs.getString(1));
   	}
	%>
	<!-- 아이디 중복검사용. 자바에 있는 아이디를 자바스크립트로 옮기기 -->
	 <script type="text/javascript">
		 	let allUserIdList = [];
	</script>
	 <%
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
			<sup id="important">*</sup>ID<br>
			<input type="text" placeholder="ID" name="userID" maxlength="20" @input="[idCheck(), canSubmitCheck()]" v-model="userId">
				{{idCheckResult}}<br>
				
			<sup id="important">*</sup>PassWord<br>
			<input type="password" placeholder="PassWord" name="userPW" maxlength="20"><br> <sup id="important">
			
			*</sup>PassWord Check<br>
			<input type="password" placeholder="PassWord" name="userPW" maxlength="20">
			<span style="color: gray">비밀번호는 6자리 이상이어야 하며 영문과 숫자를 반드시 포함해야 합니다. </span> <br>
			
			<sup id="important">*</sup>Name<br>
			<input type="text" placeholder="Name" name="userName" maxlength="20"><br>
			
			e-mail<br>
			<input type="email" placeholder="e-mail" name="userMail" maxlength="20"><br>
			
			phone number<br>
			<input type="text" placeholder="phone" name="userPhone" maxlength="20"><br>
			
			<sup id="important">*</sup>RRN<br>
			<input type="text" name="userRRN1" minlength="6" maxlength="6" v-model="RRN1" @input="checkRRN()">
			- <input type="password" name="userRRN2" minlength="7" maxlength="7" v-model="RRN2" @input="checkRRN()">
			{{rrnCheckResult}}<br><br>
			
			<input type="hidden" name="actionType" value="JOIN">
			<input v-if="canSubmit" type="submit" value="제출">
			<input v-else type="submit" value="제출" disabled="disabled"><br>
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
			isDuplicate : '사용 가능한 아이디입니다.',
			canSubmit : false,
			checkNum : [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5, 0],
			RRN1 : '',
			RRN2 : '',
			isValid : '유효하지 않은 주민번호입니다.',
		},
		methods: {
			idCheck() {
				let duplicate = false;
				for (let i = 0; i < allUserIdList.length; i++) {
					if (this.userId == allUserIdList[i]) duplicate = true;
				}
				
				if (duplicate) this.isDuplicate = '중복된 아이디입니다.';
				else this.isDuplicate = '사용 가능한 아이디입니다.';
			},

			canSubmitCheck() {
				if (this.idCheckResult == '사용 가능한 아이디입니다.') {
					this.canSubmit = true;
				} else {
					this.canSubmit = false;
				}
			},
			
			checkRRN() {
				// 모두 숫자이고, 길이가 맞으며, 유효성 검사를 통과할 때
				if (!/[^0-9]/.test(this.RRN) && this.RRN.length == 13 && testRRN) {
					this.isValid = '숫자'
				} else {
					this.isValid = '유효하지 않은 주민번호입니다.'
				}
			},
		},
		computed: {
			idCheckResult() {
				if (this.userId.length < 5) {
					this.isDuplicate = '5글자 이상 입력해주세요';
				}
				return this.isDuplicate;
			},
			rrnCheckResult() {
				return this.isValid;
			},
			RRN() {
				return this.RRN1 + '' + this.RRN2;
			},
			testRRN() {
				if (RRN.length != 13) return false;
				
				let sum = 0;
				for (let i = 0; i < RRN.length; i++) {
					sum += checkNum[i] * RRN.chatAt(i);
				}
				
				if (11 - (sum % 11) == RRN.charAt(13)) {
					return true;
				}
			},
		},
	});
	</script>
</body>
</html>