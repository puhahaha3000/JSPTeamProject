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
		location.href='./memberAddView.jsp';
	}
	function updateFnc() {
		location.href='./memberUpdateView.jsp';
	}
	function deleteFnc() {
		location.href='./memberDeleteView.jsp';
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
		</tr>
		<tr>
			<c:forEach var="memberDto" items="${memberList}">
				<td>${memberDto.no}</td>
				<td>${memberDto.nickname}</td>
				<td>${memberDto.email}</td>
			</c:forEach>		
		</tr>	
	</table>
	
	<button onclick="addFnc()">추가</button>
	<button onclick="updateFnc()">수정</button>
	<button onclick="deleteFnc()">삭제</button>

	<jsp:include page="/Tail.jsp" />
</body>

</html>