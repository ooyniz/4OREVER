<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4OREVER :: μ‘μ±νπ§π»</title>
<!-- μμ΄μ½ -->
<link rel="icon" type="image/x-icon"
	href="/P01_MEMBER/images/favicon.png" />
<!-- css -->
<link rel = "stylesheet" href= "/P01_MEMBER/css/memberstyles.css"/>
</head>
<body>
	<!-- Start of header -->
	<%@ include file="../header.jsp"%>
	<!-- End of header -->
	
	<!-- λ΄μ© -->
	<section class="section-about">
		<a name="about"></a>
		<h2>About μ‘μ±νπ§π»</h2>
		<div class="cont-about">
			<div class="memcontainer">
				<div class="memimages">
					<img src="../images/member05.jpg" alt="λ΄ μ¬μ§" />
				</div>
			</div>
			<div class="info-about">
				<dl class="txt-about">
					<div>
						<dt>μ΄λ¦</dt>
						<dd>μ‘μ±ν</dd>
					</div>
					<div>
						<dt>μλμμΌ</dt>
						<dd>98.11.16</dd>
					</div>
					<div>
						<dt>κ±°μ£Όμ§</dt>
						<dd>κ²½λΆ κ΅¬λ―Έμ</dd>
					</div>
					<div>
						<dt>λͺ©ν</dt>
						<dd>λΆμ‘±νμ§ μμ κ°λ°μκ° λκ³  μΆμ΅λλ€.</dd>
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