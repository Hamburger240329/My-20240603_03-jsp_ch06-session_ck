<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인 페이지</title>
</head>
<body>
	<%
		String validMem = (String) session.getAttribute("ValidMem");
		// 로그인에 성공한 상태면 validMem 의 값은 yes 이고, 비로그인 상태면 null 값임
		String sessionId = (String) session.getAttribute("sessionId");
		String name = "";
		if (validMem != null){ // 참이면 로그인 상태
			
			out.println(sessionId + " 님 로그인 중"+"<br>");
			
			Enumeration enuSession = session.getAttributeNames(); //세션안에 있는 속성들의 이름들을 가져옴 - String 으로 되어있는 배열 이라고 보면 됨
			
			while(enuSession.hasMoreElements()){
				name = enuSession.nextElement().toString();
				out.println(name + "<br>"); // 한줄 띄우기
				String sessionVal = (String) session.getAttribute(name);
				out.println(sessionVal + "<br>");
			}
	%>			
		<br>
		<a href="logout.jsp">로그아웃</a>
		<br>
	<%	
		}else {//비로그인 상태
			out.println("로그인 페이지로 이동하세요.");
		}
	%>
</body>
</html>