<%@page import="spms.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 수정</title>
<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = './list';
	}
	
	function deleteFnc(no) {
		const result = confirm('정말 탈퇴하시겠습니까?')
		if(result){
			location.href='./delete?no='+no;
		}else{
			return false;
		}	
	}
	function updateFnc(no) {
		location.href = './update?no='+no;
	}
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">

</head>

<body>
	
	<div>
	
		<jsp:include page="/Header.jsp"/>
		
		
		<form action="./update" method="post">
			<table>
				<tr>
					<td>아이디(이메일)</td>		
					<td><input type="text" value="${memberDto.email}" name='email'></td>		
				</tr>
				<tr>
					<td>닉네임</td>		
					<td><input type="text" value="${memberDto.nickname}" name='nickname'></td>		
				</tr>
				<tr>
					<td>비밀번호</td>		
					<td><input type="text" value="${memberDto.pwd}" name='pwd'></td>		
				</tr>
				<tr>
					<td>회원등급</td>		
					<td><input type="text" value="${memberDto.grade}" name='grade'></td>		
				</tr>
			</table>
			<input type="hidden" value="${memberDto.no}" name='no'>		
			<input type="submit" value="수정">
			<input type="button" value="삭제" onclick="deleteFnc(${memberDto.no})">
			<input type="button" value="취소" onclick="pageMoveListFnc()">
		</form>
		
		
		<jsp:include page="/Tail.jsp"/>
		
	</div>
	
	
</body>

</html>