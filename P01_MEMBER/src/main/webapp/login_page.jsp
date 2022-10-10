<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 홈</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

</script>
</head>
<!-- style -->
<style>
@font-face {
	font-family: 'SDSamliphopangche_Outline';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.card-text {
	font-family: 'SDSamliphopangche_Outline';
	font-size: 20px;
}

a {
	text-decoration: none;
	text-align: center;
}
/** 방문하지 않은 링크 */
a:link {
	color: green;
}
/** 방문한 적 있는 링크*/
a:visited {
	color: black;
}
/** 마우스를 링크에 올려두었을 때*/
a:hover {
	color: #0B3B0B;
	trasform: scale(1.4);
	transition: transform .3s;
}
</style>
<body style="color: f9ecd9">

	<div class="container">
		<div class="row">
			<!-- 간격 조절용 -->
			<div class="col"></div>
			<!-- member01.jsp -->
			<div class="col">
				<a href="/P01_MEMBER/mem_views/member01.jsp">
					<div class="card" style="width: 18rem;">
						<img src="/P01_MEMBER/images/m01.jpg" class="card-img-top"
							alt="member01">
						<div class="card-body">
							<p class="card-text">풀스택 개발자<br>왕인성</p>
						</div>
					</div>
				</a>
			</div>
			<!-- member02.jsp -->
			<div class="col">
				<a href="/P01_MEMBER/mem_views/member02.jsp">
					<div class="card" style="width: 18rem;">
						<img src="/P01_MEMBER/images/m02.jpg" class="card-img-top"
							alt="member03">
						<div class="card-body">
							<p class="card-text">
								새롭게 도전하는 개발자<br>곽유진
							</p>
						</div>
					</div>
				</a>
			</div>
			<!-- member03.jsp -->
			<div class="col">
				<a href="/P01_MEMBER/mem_views/member03.jsp">
					<div class="card" style="width: 18rem;">
						<img src="/P01_MEMBER/images/m03.jpg" class="card-img-top"
							alt="member02">
						<div class="card-body">
							<p class="card-text">성장형 개발자<br>김정수</p>
						</div>
					</div>
				</a>
			</div>
			<!-- 간격 조절용 -->
			<div class="col"></div>
		</div>
	<br>
		<!-- 2번째 줄 -->
		<div class="row">
			<!-- 간격 조절용 -->
			<div class="col"></div>
			<!-- member04.jsp -->
			<div class="col">
				<a href="/P01_MEMBER/mem_views/member04.jsp">
					<div class="card" style="width: 18rem;">
						<img src="/P01_MEMBER/images/m04.jpg" class="card-img-top"
							alt="member04">
						<div class="card-body">
							<p class="card-text">열정이 넘치는 개발자<br>노태권</p>
						</div>
					</div>
				</a>
			</div>
			<!-- member05.jsp -->
			<div class="col">
				<a href="/P01_MEMBER/mem_views/member05.jsp">
					<div class="card" style="width: 18rem;">
						<img src="/P01_MEMBER/images/m05.jpg" class="card-img-top"
							alt="member05">
						<div class="card-body">
							<p class="card-text">성실한 개발자<br>송성혁</p>
						</div>
					</div>
				</a>
			</div>
			<!-- member06.jsp -->
			<div class="col">
				<a href="/P01_MEMBER/mem_views/member06.jsp">
					<div class="card" style="width: 18rem;">
						<img src="/P01_MEMBER/images/m06.jpg" class="card-img-top"
							alt="member06">
						<div class="card-body">
							<p class="card-text">친화성 좋은 개발자<br>조규태</p>
						</div>
					</div>
				</a>
			</div>
			<!-- 간격 조절용 -->
			<div class="col"></div>
		</div>
	</div>

</body>
</html>