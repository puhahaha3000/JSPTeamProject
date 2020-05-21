<%@page import="spms.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" >
<title>회원 추가</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">
<script type="text/javascript">
	<% MemberDto memberDto = (MemberDto)request.getAttribute("memberDto"); %>
	<% int result = (Integer)request.getAttribute("result"); %>
	window.onload = function(){
		var resultVar = <%=result%>;
		if(resultVar == 0 ){
			alert("에러");
		}
	
	}
</script>
</head>

<body>

	<div>
	
		<jsp:include page="/Header.jsp"/>
		
			<form id="loginForm" action="./add" method="post">
				
				<c:if test="${memberDto != null}">
				<table>
					<tr>
						<td>아이디(이메일)</td>		
						<td><input type="text" value="${memberDto.getEmail()}" name='email'></td>		
					</tr>
					<tr>
						<td>닉네임</td>		
						<td><input type="text" value="${memberDto.getNickname()}" name='nickname'></td>		
					</tr>
					<tr>
						<td>비밀번호</td>		
						<td><input type="text" value="${memberDto.getPwd()}" name='pwd'></td>		
					</tr>
					<tr>
						<td>회원등급</td>		
						<td>회원</td>		
					</tr>
				</table>
				</c:if>
				<input type="button" onclick="checkFnc()" value="가입하기">
				<input type="reset" value="초기화">
				<input type="button" value="취소" onclick="pageMoveListFnc()">
				
			</form>
		
		
		
		
		<jsp:include page="/Tail.jsp"/>
		
	</div>
	
</body>

<script type="text/javascript">
	
	
	function pageMoveListFnc() {
		location.href = "./list";
	}
	
	function checkFnc() {
		var formObj = document.getElementById('loginForm');
		var email = document.getElementsByName('email')[0];
		var nickname = document.getElementsByName('nickname')[0];
		var pwd = document.getElementsByName('pwd')[0];
		
		if(email.value==""){
			alert("이메일을 입력해주세요");
			return false;
		}else if (nickname.value=="") {
			alert("닉네임을 입력해주세요");
			return false;
		}else if(pwd.value==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}else {
			formObj.submit();
		}
		
	}
	
</script>

</html>