<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 및 삭제</title>

<!-- 부트스트랩 -->
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		crossorigin="anonymous">
</head>
<body>
<!-- header.jsp 시작 -->
<%@ include file="../header.jsp" %>
<!-- header.jsp 끝 -->
<h1>회원 수정 페이지</h1>
<hr>
<div>
	<label>ID</label>
	<input type="text" value="아이디" disabled><br>
	
	<label>PW</label>
	<input type="password" value="비밀번호"><br>
	
	<label>회원 명</label>
	<input type="text" value="이름"><br>
	
	<label>email</label>
	<input type="email" value="email@google.com"><br>
	
	<label>phone</label>
	<input type="text" value="010-1234-1234"><br>
	
	<label>회원 등급</label>
	<input type="text" value="관리자" disabled><br>
	
	<label>가입일자</label>
	<input type="text" value="2001-10-01" disabled><br>
</div>

<button>수정</button>
<button>탈퇴</button>
<!-- footer.jsp 시작 --> 
<%@ include file="../footer.jsp" %>
<!-- footer.jsp 끝 -->
</body>
</html>