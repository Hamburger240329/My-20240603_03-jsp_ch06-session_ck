<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 테스트</title>
</head>
<body>
	<%
		int sessionTime = session.getMaxInactiveInterval(); // 세션 유효시간 -> 초(1800초) -> 30분 
		out.println("세션의 기본 유효시간 :" + sessionTime + "<br>");
		session.setMaxInactiveInterval(600); //초 단위로 지정 - 세션의 유효시간 10분으로 변경
		sessionTime = session.getMaxInactiveInterval(); // 세션 유효시간변경 -> 초(600초) -> 10분
		out.println("세션의 변경 유효시간 :" + sessionTime + "<br>");			
	%>
	<hr>
	<%
		long firstTime = session.getCreationTime(); // 세션의 생성된 시점의 시간
		long lastTime = session.getLastAccessedTime(); // 세션의 마지막 사용시간
		
		long keepTime = (lastTime - firstTime)/60; // 사이트에서 세션이 유지되었던 시간
		out.println("세션유지시간:" + keepTime + "<br>");
		String session_id = session.getId();
		out.println("세션 고유 아이디:" + session_id);
	%>
	<br>
	<a href = "loginCheck.jsp">로그인 확인 페이지로 가기</a><br><br>
	<a href = "login.jsp">로그인 페이지 가기</a>
</body>
</html>