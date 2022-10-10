<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4OREVER :: 송성혁🧑🏻</title>
<!-- 아이콘 -->
<link rel="icon" type="image/x-icon"
	href="/P01_MEMBER/images/favicon.png" />
<!-- css -->
<link rel = "stylesheet" href= "/P01_MEMBER/css/memberstyles.css"/>
</head>
<body>
	<!-- Start of header -->
	<%@ include file="../header.jsp"%>
	<!-- End of header -->
	
	<!-- 내용 -->
	<section class="section-about">
		<a name="about"></a>
		<h2>About 송성혁🧑🏻</h2>
		<div class="cont-about">
			<div class="memcontainer">
				<div class="memimages">
					<img src="../images/member05.jpg" alt="내 사진" />
				</div>
			</div>
			<div class="info-about">
				<dl class="txt-about">
					<div>
						<dt>이름</dt>
						<dd>송성혁</dd>
					</div>
					<div>
						<dt>생년월일</dt>
						<dd>98.11.16</dd>
					</div>
					<div>
						<dt>거주지</dt>
						<dd>경북 구미시</dd>
					</div>
					<div>
						<dt>목표</dt>
						<dd>부족하지 않은 개발자가 되고 싶습니다.</dd>
					</div>
					<div>
						<dt>github</dt>
						<dd><a href="https://github.com/thd8172" target= "_blank"><img src="../images/memgithub.png" height="30"></a></dd>
					</div>
				</dl>
			</div>
		</div>
	</section>
	
	<!-- Start of footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of footer -->
</body>
</html>