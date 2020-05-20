<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판</title>

<link rel="stylesheet" href="./css/common.css" type="text/css">

</head>

<body>
	
	<div id="page">
		<jsp:include page="/Header.jsp"/>
	
		<p>게시판 홈페이지입니다.</p>
		<input type="button" onclick="pageMoveLogin();" value="로그인">
		<input type="button" onclick="pageMoveMemberAdd();" value="회원가입">
	
		<jsp:include page="/Tail.jsp"/>
	</div>

</body>

<script type="text/javascript">
	function pageMoveLogin() {
		location.href = '<%=request.getContextPath()%>/auth/login';
	}
	
	function pageMoveMemberAdd(){
		location.href = '<%=request.getContextPath()%>/member/add';
	}
</script>

</html>