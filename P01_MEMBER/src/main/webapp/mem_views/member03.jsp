<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4OREVER :: 김정수👦🏻</title>
<!-- 아이콘 -->
<link rel="icon" type="image/x-icon"
	href="/P01_MEMBER/images/favicon.png" />
<!-- css -->
<link rel="stylesheet" href="/P01_MEMBER/css/memberstyles.css" />
</head>
<body>
	<!-- Start of header -->
	<%@ include file="../header.jsp"%>
	<!-- End of header -->

	<!-- 내용 -->
	<section class="section-about">
		<a name="about"></a>
		<h2>About 김정수👦🏻</h2>
		<div class="cont-about">
			<div class="memcontainer">
				<div class="memimages">
					<img src="../images/member03.jpg" alt="내 사진" />
				</div>
			</div>
			<div class="info-about">
				<dl class="txt-about">
					<div>
						<dt>이름</dt>
						<dd>김정수</dd>
					</div>
					<div>
						<dt>생년월일</dt>
						<dd>99.01.14</dd>
					</div>
					<div>
						<dt>거주지</dt>
						<dd>대구 달서구</dd>
					</div>
					<div>
						<dt>목표</dt>
						
						<dd>잘 짜여진 코드를 만드는 개발자가 되고 싶습니다.</dd>
					</div>
					<div>
						<dt>github</dt>
						<dd><a href="https://github.com/YJU-KimJeongSu" target= "_blank"><img src="../images/memgithub.png" height="30"></a></dd>
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