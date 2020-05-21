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
		height : 50px;
		text-align: center;
	}
	button {
		width : 80px;
		margin-right: 20px;
		margin-top : 50px;
	}
	.listBtn {
		margin: auto;
	}
	.firstTr{
		background-color: #4782A4;
		font-size: 18px;
		font-weight: bold;
		color: #FFFFFF;
	}
</style>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">

</head>

<body>

	<div>
	
		<jsp:include page="/Header.jsp"/>
		
		
		<h1>회원목록</h1>
	
		<table>
			<tr>
				<td class="firstTr">회원번호</td>
				<td class="firstTr">닉네임</td>
				<td class="firstTr">이메일</td>
				<td class="firstTr">수정</td>
				<td class="firstTr">삭제</td>
			</tr>
			<c:forEach var="memberDto" items="${memberList}">
				<tr>
					<td>${memberDto.no}</td>
					<td>${memberDto.nickname}</td>
					<td>${memberDto.email}</td>
					<td><button class ="listBtn" onclick="updateFnc(${memberDto.no})">수정</button></td>
					<td><button class ="listBtn" onclick="deleteFnc(${memberDto.no});">삭제</button></td>
				</tr>	
			</c:forEach>		
		</table>
	
	<button onclick="addFnc()">추가</button>
	
		
		
		<jsp:include page="/Tail.jsp"/>
		
	</div>

</body>

<script type="text/javascript">
	function addFnc() {
		location.href='./add';
	}
	function updateFnc(no) {
		location.href='./update?no='+no;
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

</html>