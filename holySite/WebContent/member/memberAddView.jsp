<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 삭제</title>

</head>

<body>
	<jsp:include page="/Header.jsp" />
	<form action="">
		회원번호<br>
		아이디(이메일)<input type="text" value="">
		닉네임(이메일)<input type="text" value="">
		비밀번호(이메일)<input type="text" value="">
		회원등급<input type="text" value="">
 
	
	</form>
	<jsp:include page="/Tail.jsp" />
</body>

</html>