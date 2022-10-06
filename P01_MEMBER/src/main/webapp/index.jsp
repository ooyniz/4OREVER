<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
<!-- header.jsp 시작 -->
<%@ include file="./header.jsp" %>
<!-- header.jsp 끝 -->
<%
	if(session.getAttribute("loginState").equals("login")){
%>
		 <jsp:include page="./login_page.jsp"/>
<%
	}else{
%>
		 <jsp:include page="./logout_page.jsp"/>
<%
	}
%>		
<!-- footer.jsp 시작 --> 
<%@ include file="./footer.jsp" %>
<!-- footer.jsp 끝 -->
</body>
</html>