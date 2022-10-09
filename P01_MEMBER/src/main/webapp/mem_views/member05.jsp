<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송성혁</title>
<!-- 아이콘 -->
<link rel="icon" type="image/x-icon" href="/P01_MEMBER/images/favicon.png" />
<!-- style -->
<style>
	.box {
	width: 450px;
	height: 450px;
	border-radius: 70%;
	overflow: hidden;
	}
	.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
	}
</style>
</head>
<body>
	<!-- Start of header -->
	<%@ include file="../header.jsp"%>
	<!-- End of header -->
<div class="box">
<img class="profile" src="../images/member05.jpg" width="1024"/>
</div>
	<!-- Start of footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of footer -->
</body>
</html>