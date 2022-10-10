<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
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
</head>
<!-- style -->
<style>
@font-face {
	font-family: 'NEXONFootballGothicBA1';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXONFootballGothicBA1.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NeoDunggeunmo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.btn, button {
	font-family: 'NeoDunggeunmo';
}

#spantext {
	font-family: 'NEXONFootballGothicBA1'
}
</style>
<body>
	<table>
		<a href="/P01_MEMBER/index.jsp"><img
			src="/P01_MEMBER/images/nobg_banner.png" width="30%" height="30%" /></a>
		<div class="Justify-content-end">
			<%
			if (session.isNew()) {
				session.setAttribute("loginState", "logout");
				session.setAttribute("user_num", 0);
				session.setAttribute("user_name", null);
				session.setAttribute("user_class", 0);
				session.setAttribute("alert", null);
			}
			if (session.getAttribute("loginState").equals("login")) {
			%>

			<span id="spantext"><%=session.getAttribute("userid")%>님 🤗</span>
			<form name="logout" method="post"
				action="/P01_MEMBER/mem_models/member_dao.jsp">
				<input type="hidden" name="actionType" value="LOGOUT"> <input
					class="btn btn-outline-success m-2" type="submit" value="로그아웃">
			</form>
			<%
			} else {
			%>
			<form name="login" method="post"
				action="/P01_MEMBER/mem_models/member_dao.jsp">
				<span id="spantext">아이디 : </span><input class="m-2" type="text"
					name="userid" size="10"> <span id="spantext">비밀번호 :
				</span><input class="m-2" type="password" name="passwd" size="10">
				<input type="hidden" name="actionType" value="LOGIN"> <input
					class="btn btn-outline-success m-2" type="submit" value="로그인">
			</form>
			<button class="btn btn-outline-success m-1" type="button"
				onclick="location.href='/P01_MEMBER/mem_views/mem_join.jsp' ">회원가입</button>
			<%
			if (session.getAttribute("loginState").equals("errorID")) {
				out.print("아이디가 존재하지 않습니다.");
			}

			if (session.getAttribute("loginState").equals("errorPW")) {
				out.print("비밀번호를 확인해 주세요.");
			}
			}
			%>
			<%
			if (session.getAttribute("loginState").equals("login")) {
			%>
			<%@ include file="./GNB.jsp"%>
			<%
			}
			%>
		</div>
	</table>
</body>
</html>