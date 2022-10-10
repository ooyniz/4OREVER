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
<!-- 아이콘 -->
<link rel="icon" type="image/x-icon"
	href="/P01_MEMBER/images/favicon.png" />
<!-- css -->
<link rel="stylesheet" href="/P01_MEMBER/css/memedit.css" />
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
	<br>
	<h1>회원가입</h1>

	<!-- 회원가입 시작 -->
	<div id="join">
		<form action="../mem_models/member_dao.jsp" method="post" id="form">
			<label for="mem_id"><sup id="important">*</sup>ID</label><br>
			<input type="text" placeholder="ID" name="userID" maxlength="20" id="mem_id" @input="[idCheck(), canSubmitCheck()]" v-model="userId">
				{{idCheckResult}}<br>
				
			<label for="password"><sup id="important">*</sup>PassWord</label><span style="color: gray"> &nbsp;&nbsp;&nbsp;비밀번호는 6자리 이상이어야 하며 영문과 숫자를 반드시 포함해야 합니다. </span><br>
			<input type="password"
				v-model="password" placeholder="PassWord" name="userPW" id="mem_pw" 
				maxlength="20" @blur="[passwordValid(), canSubmitCheck()]">
				<!-- blur 태그: 체크아웃 되는지 검사 -->
			<div v-if="!passwordValidFlag">유효하지 않은 비밀번호 입니다.</div>
			<br>
		
			<input
				type="password" v-model="passwordCheck" placeholder="PassWord Check"
				name="userPWck" maxlength="20" @blur="[passwordCheckValid(), canSubmitCheck()]">
			<div v-if="!passwordCheckFlag">비밀번호가 동일하지 않습니다.</div>
			<br>
			
			<label for="mem_name"><sup id="important">*</sup>Name</label><br>
			<input type="text" placeholder="Name" name="userName" maxlength="20" id="mem_name"><br>
			
			<label for="mem_email">e-mail</label><br>
			<input type="email" placeholder="e-mail" name="userMail" maxlength="20" id="mem_email"><br>
			
			<label for="mem_phone">phone number</label><br>
			<input type="text" placeholder="phone" name="userPhone" maxlength="20" id="mem_phone"><br>
			
			<label for="mem_RRN1"><sup id="important">*</sup>RRN</label><br>
			<input type="text" name="userRRN1" minlength="6" maxlength="6" id="mem_RRN1" v-model="RRN1" @input="[checkRRN(), canSubmitCheck()]">
			- <input type="password" name="userRRN2" minlength="7" maxlength="7" id="mem_RRN2" v-model="RRN2" @input="[checkRRN(), canSubmitCheck()]">
			{{rrnCheckResult}}<br><br>
			
			<input type="hidden" name="actionType" value="JOIN">
			<input type="submit" v-if="canSubmit" value="제출" @click="submit()">
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
			password: null, // 비밀번호
			passwordCheck: null, // 비밀번호 확인
			passwordValidFlag: true, // 비밀번호 유효성 검사 
			passwordCheckFlag: true, // 비밀번호랑 비밀번호 확인이 똑같은지 검사
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
				if (this.idCheckResult == '사용 가능한 아이디입니다.'
						&& this.isValid == '유효한 주민번호 입니다'
						&& this.passwordValidFlag
						&& this.passwordCheckFlag) {
					this.canSubmit = true;
				} else {
					this.canSubmit = false;
				}
			},
			
			checkRRN() {
				// 모두 숫자이고, 길이가 맞으며, 유효성 검사를 통과할 때
				if (!/[^0-9]/.test(this.RRN) && this.RRN.length == 13 && this.testRRN()) {
					this.isValid = '유효한 주민번호 입니다'
				} else {
					this.isValid = '유효하지 않은 주민번호입니다.'
				}
			},
			passwordValid () {
				if (/^(?=.*[a-z])(?=.*[0-9]).{6,20}$/.test(this.password)) { // 비밀번호 유효성 검사(영어&숫자 혼합해서 6 ~ 20자리)
					this.passwordValidFlag = true
			    } else {
			    	this.passwordValidFlag = false
			    }
			},
			
			passwordCheckValid () {
			    if (this.password === this.passwordCheck) { // 비밀번호랑 비밀번호 확인이 맞는지 검사
			        this.passwordCheckFlag = true
			    } else {
			     	this.passwordCheckFlag = false
			    }
			},
			
			testRRN() {
				if (this.RRN.length != 13) return false;
				
				let sum = 0;
				for (let i = 0; i < this.RRN.length; i++) {
					sum += this.checkNum[i] * (String)(this.RRN.charAt(i));
				}
				
				if ((11 - (sum % 11)) % 10 == (String)(this.RRN.charAt(12))) {
					return true;
				}
			},
			
			submit() {
				// vue js 안에서 input type="submit" 작동 안됨
				// 바닐라 js로 직접 클릭 이벤트를 만들어주니 됨
				let temp = document.getElementMyId('form');
				temp.submit();
			}
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
		},
	});
	</script>
</body>
</html>