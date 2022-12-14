<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4OREVER :: 관리자 페이지</title>
<!-- 아이콘 -->
<link rel="icon" type="image/x-icon"
	href="/P01_MEMBER/images/favicon.png" />
<!-- css -->
<link rel="stylesheet" href="/P01_MEMBER/css/memedit.css" />
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
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
</head>
<body>
	<%
		String driverName = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/member_db";
		String user = "root";
		String passwd = "password";
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, user, passwd);
		PreparedStatement pstmt = null;
		request.setCharacterEncoding("utf-8");
		
		String mem_num = null;
		String mem_id = null;
		String mem_name = null;
		String mem_email = null;
		String mem_phone = null;
		String mem_class = null;
		String sql = null;
		ResultSet rs = null;
		
		sql = "SELECT count(*) from member;";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
		
		int limitCnt = 0;
		int currentPageNo = 0;
		int pageCnt = 0;
		int recordCnt = 0;
		
		try {
			limitCnt = Integer.parseInt(request.getParameter("limitCnt"));
			currentPageNo = Integer.parseInt(request.getParameter("currentPageNo"));
		} catch (Exception e) {
			limitCnt = 10;
			currentPageNo = 0;
		}
		
		while (rs.next()) {
			recordCnt = rs.getInt(1);
		}
		
		pageCnt = recordCnt / limitCnt;
		
		if (recordCnt % limitCnt != 0) {
			pageCnt++;
		}
		
		int startRecord = currentPageNo * limitCnt;
		
		sql = "SELECT mem_num, mem_id, mem_name, mem_email, mem_phone, mem_class FROM member LIMIT ?, ?;";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRecord);
		pstmt.setInt(2, limitCnt);
		rs = pstmt.executeQuery();
		
		
	%>
<!-- header.jsp 시작 -->
<%@ include file="../header.jsp"%>
<!-- header.jsp 끝 -->
	<br>
	<h1>관리자 페이지</h1>
	
	<form method="post" action="./adminPage.jsp">
	페이지당 표시할 줄 : 
		<select name="limitCnt">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="50">50</option>
			<option value="100">100</option>
		</select>
		<input type="hidden" name="currentPageNo" value="0">
		<input type="submit" value="확인">
	</form>
	<br>
	
	<div id="adminPage">
		<table class="table table-striped" border="2">
			<thead>
				<tr>
					<th>회원No</th>
					<th>ID</th>
					<th>이름</th>
					<th>email</th>
					<th>휴대폰 번호</th>
					<th>회원등급</th>
					<th>회원등급 수정</th>
					<th>수정</th>
					<th>탈퇴</th>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
					mem_num = rs.getString("mem_num");
					mem_id = rs.getString("mem_id");
					mem_name = rs.getString("mem_name");
					mem_email = rs.getString("mem_email");
					mem_phone = rs.getString("mem_phone");
					mem_class = rs.getString("mem_class");
					
					if (mem_class.equals("100")) mem_class = "신규 회원";
					else if (mem_class.equals("150")) mem_class = "일반 회원";
					else if (mem_class.equals("200")) mem_class = "열심 회원";
					else if (mem_class.equals("300")) mem_class = "관리자";
				%>
				<tr>
					<td><%=mem_num%></td>
					<td><%=mem_id%></td>
					<td><%=mem_name%></td>
					<td><%=mem_email%></td>
					<td><%=mem_phone%></td>
					<td><%=mem_class%></td>
					<%
					if (mem_class.equals("관리자")) {
					%>
					<td></td>
					<%
					} else {
					%>
					<td>
						<select id = "mem_class" name = "userClass" class = "mem_class">
							<option value = "100">신규 회원</option>
							<option value = "150">일반 회원</option>
							<option value = "200">열심 회원</option>
						</select>
					</td>
					<%
					}
					%>
					<%
					if (mem_class.equals("관리자")) {
					%>
					<td></td>
					<%
					} else {
					%>
					<td>
					<form action="../mem_models/member_dao.jsp" method="post" id="adminForm">
						<input type="hidden" value="EDIT_ADMIN" name="actionType">
						<input type="hidden" value="<%=mem_num%>" name="userNum">
						<input type="button" value="수정" @click="editSubmitCheck()">
					</form>
					</td>
					<%
					}
					%>
					<td>
					<form action="../mem_models/member_dao.jsp" method="post" id="adminForm2">
						<input type="hidden" value="DELETE_ADMIN" name="actionType">
						<input type="hidden" value="<%=mem_num%>" name="userNum">
						<input type="button" value="탈퇴" @click="deleteSubmitCheck()">
					</form>
					</td>
				</tr>
				
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div class="d-flex justify-content-center">
	<a href="./adminPage.jsp?currentPageNo=0&limitCnt=<%=limitCnt%>">[FIRST]</a>
	<%
	// 화면에 표기되는 페이지랑 내부에 동작하는 페이지랑 다름 주의 
	
	// 이전 버튼
	if (currentPageNo > 0) {
	%>
	<a href="./adminPage.jsp?currentPageNo=<%=(currentPageNo-1)%>&limitCnt=<%=limitCnt%>">[PRE]</a>
	<%
	} else {
	%>
	[PRE]
	<%
	}
	
	// [1] [2] [3] ... 페이지 선택 버튼 
	
	// pageCnt가 64일때, currentPageNo가 0~10이면 0~10 표시
	// currentPageNo가 61~64이면 61~64까지만 표시
	
	// 1. currentPageNo를 올림해서 (ex : 1 -> 10 , 61 -> 70)
	// 2. pageCnt랑 비교해서 작거나 같으면 temp-10부터 10개 표시 (ex : 10 <= 64 -> 1~10)
	// 3. 크면 temp-10부터 pageCnt까지 표시 (ex : 70 > 64 -> 60~64)
	
	int temp = ((currentPageNo/10)+1) * 10; // 1. currentPageNo를 올림해서 (ex : 1 -> 10 , 61 -> 70)
	
	// 2. pageCnt랑 비교해서 작거나 같으면 temp-10부터 10개 표시 (ex : 10 <= 64 -> 1~10)
	if (temp <= pageCnt) {
		for (int i = temp-10; i < temp; i++) {
			if (i == currentPageNo) {
	%>
				[<%=(i+1)%>]
	<%
			} else {
	%>
				<a href="./adminPage.jsp?currentPageNo=<%=i%>&limitCnt=<%=limitCnt%>">[<%=(i+1)%>]</a>
	<%
			}
		}
	}
	
	// 3. 크면 temp-10부터 pageCnt까지 표시 (ex : 70 > 64 -> 60~64)
	else {
		for (int i = temp-10; i < pageCnt; i++) {
			if (i == currentPageNo) {
	%>
				[<%=(i+1)%>]
	<%
			} else {
	%>
				<a href="./adminPage.jsp?currentPageNo=<%=i%>&limitCnt=<%=limitCnt%>">[<%=(i+1)%>]</a>
	<%
			}
		}
	}
	%>
	
	<%
	// 다음 버튼
	if (currentPageNo < pageCnt - 1) {
%>
		<a href="./adminPage.jsp?currentPageNo=<%=(currentPageNo+1)%>&limitCnt=<%=limitCnt%>">[NXT]</a>		
<%
	} else {
%>
		[NXT]
<%
	}
	%>
	<a href="./adminPage.jsp?currentPageNo=<%=(pageCnt-1)%>&limitCnt=<%=limitCnt%>">[END]</a>
	</div>
	<br>
	
<!-- footer.jsp 시작 --> 
<%@ include file="../footer.jsp" %>
<!-- footer.jsp 끝 -->

<script>
		let adminPage = new Vue({
			el: '#adminPage',
			methods: {
				editSubmitCheck() {
					if (confirm("정말 수정하시겠습니까?")) {
						let form = document.getElementById('adminForm');
						form.submit();
					}
				},
				deleteSubmitCheck() {
					if (confirm("정말 삭제하시겠습니까?")) {
						let form2 = document.getElementById('adminForm2');
						form2.submit();
					}
				},
			},
		})
	</script>
</body>
</html>