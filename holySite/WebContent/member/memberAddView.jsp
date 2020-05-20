<%@page import="spms.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 삭제</title>

</head>

<body>
	<jsp:include page="/Header.jsp" />
	<form action="./add" method="post">
		<table>
			<tr>
				<td>아이디(이메일)</td>		
				<td><input type="text" value="" name='email'></td>		
			</tr>
			<tr>
				<td>닉네임</td>		
				<td><input type="text" value="" name='nickname'></td>		
			</tr>
			<tr>
				<td>비밀번호</td>		
				<td><input type="text" value="" name='pwd'></td>		
			</tr>
			<tr>
				<td>회원등급</td>		
				<td><input type="text" value="0" name='grade'></td>		
			</tr>
		</table>
		
		<input type="submit" onclick="" value="가입하기">
		<input type="reset" value="초기화">
		<input type="button" value="취소" onclick="location.href='./memberListView.jsp'">
	</form>
	<jsp:include page="/Tail.jsp" />
</body>

</html>