<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<!-- header.jsp 시작 -->
<%@ include file="../header.jsp" %>
<!-- header.jsp 끝 -->

	<h1>관리자 페이지</h1>
	<hr>
	<table border="1">
		<thead>
			<tr>
				<th>No.</th>
				<th>ID</th>
				<th>회원명</th>
				<th>email</th>
				<th>phone</th>
				<th>회원등급</th>
		</thead>
		<tbody>
			<tr>
				<th>1</th>
				<th>admin</th>
				<th>관리자</th>
				<th>관리자@google.com</th>
				<th>010-1234-1234</th>
				<th>관리자</th>
			</tr>
			<tr>
				<th>2</th>
				<th>guest</th>
				<th>손님</th>
				<th>손님@google.com</th>
				<th>010-5678-5678</th>
				<th>손님</th>
			</tr>

		</tbody>
	</table>
<!-- footer.jsp 시작 --> 
<%@ include file="../footer.jsp" %>
<!-- footer.jsp 끝 -->
</body>
</html>