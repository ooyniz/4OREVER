<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<body>
<table>
	 <a href="/P01_MEMBER/index.jsp"><img src="/P01_MEMBER/images/nobg_banner.png"  width="40%" height="40%" /></a>
<%
		if( session.isNew()) {
			session.setAttribute("loginState", "logout");
			session.setAttribute("userid", null);
			session.setAttribute("userpw", null);
		}
		if(session.getAttribute("loginState").equals("login")){
%>
		<%=session.getAttribute("userid")%>님 로그인중.
		<form name="logout" method="post" action="/P01_MEMBER/mem_models/member_dao.jsp">
		  <input type="hidden" name="actionType" value="LOGOUT">
		  <input class="btn btn-outline-success" type="submit" value="로그아웃">
		</form> 
<%
		}
		else{
%>		 
		 <form name="login" method="post" action="/P01_MEMBER/mem_models/member_dao.jsp">
		    아이디 : <input type="text" name="userid" size="10">
		    비밀번호 : <input type="password" name="passwd" size="10">
		    <input type="hidden" name="actionType" value="LOGIN">
		    <input class="btn btn-outline-success" type="submit" value="로그인">
		 </form>
		 <button class="btn btn-outline-success" type="button" onclick="location.href='/P01_MEMBER/mem_views/mem_join.jsp' ">회원가입</button>
<%
			if(session.getAttribute("loginState").equals("errorID")){
				out.print("[사용자ID오류]");
			}
			
			if(session.getAttribute("loginState").equals("errorPW")){
				out.print("[사용자PW오류]");
			}
		}
%>
</table>		
<%
		if(session.getAttribute("loginState").equals("login")){
%>
			<%@ include file= "./GNB.jsp" %>
<%
		}
%>
<hr> 
</body>
</html>