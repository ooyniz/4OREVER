<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4OREVER</title>
<!-- 아이콘 -->
<link rel="icon" type="image/x-icon" href="/P01_MEMBER/images/favicon.png" />
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
<body style="color: f9ecd9">
	<!-- header.jsp 시작 -->
	<%@ include file="./header.jsp"%>
	<!-- header.jsp 끝 -->
	<%
	if (session.getAttribute("alert") != null) {
		%>
		<script>alert('<%=session.getAttribute("alert")%>')</script>
		<%
		session.setAttribute("alert", null);
	}
	
	if (session.getAttribute("loginState").equals("login")) {
	%>
	<jsp:include page="./login_page.jsp" />
	<%
	} else {
	%>
	<jsp:include page="./logout_page.jsp" />
	<%
	}
	%>
	<!-- footer.jsp 시작 -->
	<%@ include file="./footer.jsp"%>
	<!-- footer.jsp 끝 -->
</body>
</html>