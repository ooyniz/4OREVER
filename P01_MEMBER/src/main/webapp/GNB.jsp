<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네비게이션 바</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
</head>
<!-- style -->
<style>
@font-face {
	font-family: 'NeoDunggeunmo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

ul,button {
	font-family: 'NeoDunggeunmo';
}
</style>
<body>
	<hr>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid" id="GNB">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/P01_MEMBER/index.jsp">Home🏠</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/P01_MEMBER/mem_views/member01.jsp">왕인성🧔🏻‍♀️</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/P01_MEMBER/mem_views/member02.jsp">곽유진👧🏻</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/P01_MEMBER/mem_views/member03.jsp">김정수👦🏻</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/P01_MEMBER/mem_views/member04.jsp">노태권👨🏻‍🦱</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/P01_MEMBER/mem_views/member05.jsp">송성혁🧑🏻</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/P01_MEMBER/mem_views/member06.jsp">조규태🧒🏻</a></li>
				</ul>
				<button class="btn btn-outline-success m-1" type="button"
					onclick="location.href='/P01_MEMBER/mem_views/mem_edit.jsp' ">정보수정</button>

				<!-- 여기에 if else넣어서 이동링크 ㄱ -->
				<button class="btn btn-outline-success m-1" type="button"
					v-if="userClass == 300"
					onclick="location.href='/P01_MEMBER/mem_views/adminPage.jsp' ">관리자페이지</button>
			</div>
		</div>
	</nav>
	<script>
		let app = new Vue({
			el : '#GNB',
			data : {
				userClass :
	<%=session.getAttribute("user_class")%>
		,
			},
		})
	</script>
</body>
</html>