<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 목록</title>
<style type="text/css">	
	table, tr, td{
		border: 1px solid black;
	}
	td{ 
		width : 100px;
		text-align: center;
	}
	button {
		width : 80px;
		margin-right: 20px;
		margin-top : 50px;
}
</style>
<script type="text/javascript">
	function addFnc() {
		location.href='./add';
	}
	function updateFnc() {
		location.href='./update';
	}
	function deleteFnc(no) {
		const result = confirm('정말 탈퇴하시겠습니까?')
		if(result){
			location.href='./delete?no='+no;
		}else{
			return false;
		}
		
	}

</script>
</head>

<body>
<jsp:include page="/Header.jsp" />
	<h1>회원목록</h1>
	
	<table>
		<tr>
			<td class="firstTd">회원번호</td>
			<td class="secondTd">닉네임</td>
			<td class="thirdTd">이메일</td>
			<td class="forthTd">수정</td>
			<td class="fifthTd">삭제</td>
		</tr>
		<c:forEach var="memberDto" items="${memberList}">
			<tr>
				<td>${memberDto.no}</td>
				<td>${memberDto.nickname}</td>
				<td>${memberDto.email}</td>
				<td><button onclick="updateFnc(${memberDto.no})">수정</button></td>
				<td><button onclick="deleteFnc(${memberDto.no});">삭제</button></td>
			</tr>	
		</c:forEach>		
	</table>
	
	<button onclick="addFnc()">추가</button>
	

	<jsp:include page="/Tail.jsp" />
</body>

</html>