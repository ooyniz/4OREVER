<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 dao</title>
</head>
<body>
	<%
	/**	
	* @param userID 	로그인하는 유저 아이디 from mem_join.jsp
	* @param userPW 	로그인하는 유저 비밀번호 from mem_join.jsp
	* @param userName 	로그인하는 유저 이름 from mem_join.jsp
	* @param userMail 	로그인하는 유저 이메일 from mem_join.jsp
	* @param userPhone 	로그인하는 유저 전화번호 from mem_join.jsp
	* @param userRRN 	로그인하는 유저 주민등록번호 from mem_join.jsp
	* @param actionType	DB의 액션과 요청한 회원 등급 class(optional) from mem_join.jsp / mem_edit.jsp / admin.sjp
	*
	* @return sqlResult	SQL문의 실행 결과 to mem_join.jsp / mem_edit.jsp / admin.jsp
	*/
	%>
	
	<!-- in session : user_num, user_name, loginState, class, mem_idList -->

	<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/member_db";
	String user = "root";
	String passwd = "password";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");
	
    String actionType = request.getParameter("actionType");
    int userNum = 0;
	String userID = null;
	String userPW = null;
	String userName = null;
	String userMail = null;
	String userPhone = null;
	String userRRN = null;
	int userClass = 0;
	ArrayList<String> allUserIdList = new ArrayList<String>();
	String sql = null;
	int sqlResult = 0;

	switch (actionType) {
		case "LOGIN":
			userID = request.getParameter("userid");
		    userPW = request.getParameter("passwd");
		    /* SELECT문으로 아이디 비밀번호 확인하고 성공하면 세선에 loginState, user_num, user_name, user_class 수정 */
		    /* loginState = errorID / errorPW / login */
		    sql = "SELECT mem_id, mem_pw, mem_name, mem_num, mem_class FROM member WHERE mem_id=?";
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, userID);
		    ResultSet rs = pstmt.executeQuery();
		    		    
		    // errorID. 둘다 틀린 상황 - if (rs.next())가 false
		    // errorPW. id만 맞는 상황 - 조회는 되지만, pw를 체크해줘야함
		    // login. id, pw 둘다 맞는 상황
		    if (rs.next()) {
		    	String memPW = rs.getString("mem_pw");
		    	if (userPW.equals(memPW)) {
		    		// login
		    		session.setAttribute("loginState", "login");
		    		session.setAttribute("user_num", rs.getInt("mem_num"));
		    		session.setAttribute("user_name", rs.getString("mem_name"));
		    		session.setAttribute("user_class", rs.getInt("mem_class"));
		    	} else {
		    		// errorPW
		    		session.setAttribute("loginState", "errorPW");
			    	session.setAttribute("user_num", 0);
			    	session.setAttribute("user_name", null);
			    	session.setAttribute("user_class", 0);
		    	}
		    } else {
		    	// errorID
		    	session.setAttribute("loginState", "errorID");
		    	session.setAttribute("user_num", 0);
		    	session.setAttribute("user_name", null);
		    	session.setAttribute("user_class", 0);
		    }
		   	
		    break;
		    
		/* LOGIN에서 세션에 넣어준 정보 초기화 */
		case "LOGOUT":
			// 현재 로그아웃 버튼이 주소 문제로 작동 안해서 테스트 안해봄
			session.setAttribute("loginState", "logout");
		    session.setAttribute("user_num", 0);
		    session.setAttribute("user_name", null);
		    session.setAttribute("user_class", 0);
			break;
			
		/* mem_edit에서 받은 데이터로 쿼리문 실행하고 결과 성공/실패 출력 */
		/* 아이디 중복검사, 주민번호 유효성 검사 끝난 데이터만 넘어옴 */
		case "EDIT":
			userNum = (int) session.getAttribute("user_num");
			userPW = request.getParameter("userPW");
			userName = request.getParameter("userName");
			userMail = request.getParameter("userMail");
			userPhone = request.getParameter("userPhone");
			
			sql = "UPDATE member SET mem_pw=?, mem_name=?, mem_email=?, mem_phone=? WHERE mem_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userPW);
			pstmt.setString(2, userName);
			pstmt.setString(3, userMail);
			pstmt.setString(4, userPhone);
			pstmt.setInt(5, userNum);
			
			sqlResult = pstmt.executeUpdate();
			
			if (sqlResult == 1) {
				// 그냥 script 쓰면 제어권이 이미 index에 가있으므로 작동 안됨.
				session.setAttribute("alert", "회원정보가 성공적으로 수정되었습니다");
			} else {
				session.setAttribute("alert", "회원정보 수정에 실패하였습니다.");
			}
			
			break;
			
		/* 회원탈퇴 */
		case "DELETE":
			userNum = (int) session.getAttribute("user_num");
			sql = "DELETE FROM member WHERE mem_num=" + userNum;
			pstmt = con.prepareStatement(sql);
			sqlResult = pstmt.executeUpdate();
			
			if (sqlResult == 1) {
				session.setAttribute("loginState", "logout");
				session.setAttribute("user_num", 0);
				session.setAttribute("user_name", null);
				session.setAttribute("user_class", 0);
				session.setAttribute("alert", "회원탈퇴가 완료되었습니다");
			} else {
				session.setAttribute("alert", "회원탈퇴에 실패하였습니다.");
			}
			
			break;
			
		/* 관리자가 하는 정보 수정 */
		case "EDIT_ADMIN":
			userNum = Integer.parseInt(request.getParameter("userNum"));
			userPW = request.getParameter("userPW");
			userName = request.getParameter("userName");
			userMail = request.getParameter("userMail");
			userPhone = request.getParameter("userPhone");
			userClass = Integer.parseInt(request.getParameter("userClass"));
			
			sql = "UPDATE member SET mem_pw=?, mem_name=?, mem_email=?, mem_phone=?, mem_class=? WHERE mem_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userPW);
			pstmt.setString(2, userName);
			pstmt.setString(3, userMail);
			pstmt.setString(4, userPhone);
			pstmt.setInt(5, userClass);
			pstmt.setInt(6, userNum);
			
			sqlResult = pstmt.executeUpdate();
			
			if (sqlResult == 1) {
				session.setAttribute("alert", "회원정보가 성공적으로 수정되었습니다");
			} else {
				session.setAttribute("alert", "회원정보 수정에 실패하였습니다.");
			}
			
			break;
			
		case "DELETE_ADMIN":
			userNum = Integer.parseInt(request.getParameter("userNum"));
			sql = "DELETE FROM member WHERE mem_num=" + userNum;
			pstmt = con.prepareStatement(sql);
			sqlResult = pstmt.executeUpdate();
			
			if (sqlResult == 1) {
				session.setAttribute("alert", "회원탈퇴가 완료되었습니다");
			} else {
				session.setAttribute("alert", "회원탈퇴에 실패하였습니다.");
			}
			break;
			
		case "JOIN":
			userID = request.getParameter("userID");
			userPW = request.getParameter("userPW");
			userName = request.getParameter("userName");
			userMail = request.getParameter("userMail");
			userPhone = request.getParameter("userPhone");
			userRRN = request.getParameter("userRRN1") + "-" + request.getParameter("userRRN2");
			
			sql = "INSERT INTO member (mem_id, mem_pw, mem_name, mem_email, mem_phone, mem_RRN) VALUES (?, ?, ?, ?, ?, ?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			pstmt.setString(3, userName);
			pstmt.setString(4, userMail);
			pstmt.setString(5, userPhone);
			pstmt.setString(6, userRRN);
			
			sqlResult = pstmt.executeUpdate();
			
			if (sqlResult == 1) {
				session.setAttribute("alert", "회원가입에 성공하였습니다");
			} else {
				session.setAttribute("alert", "회원가입에 실패하였습니다");
			}
			
			break;
	}
%>

<jsp:forward page="../index.jsp"/>

</body>
</html>