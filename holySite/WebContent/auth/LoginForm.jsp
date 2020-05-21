<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">

</head>

<body>
	<div>
		<jsp:include page="/Header.jsp"/>
		
		<h2>로그인</h2>
		<form action="./login" method="post">
			이메일: 	<input type="text" name="email"><br>
			암호: 	<input type="password" name="password"><br>
			<input type="submit" value="로그인">
			<input type="button" onclick="pageMoveAddMember();" value="회원가입">		
		</form>
		
		<jsp:include page="/Tail.jsp"/>
	</div>
</body>

<script type="text/javascript">
	function pageMoveAddMember(){
		location.href = "../member/add";
	}
</script>

</html>
