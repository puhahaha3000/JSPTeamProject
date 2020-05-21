<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">

</head>

<body>
	
	<div>
	
		<jsp:include page="/Header.jsp"/>
		
		<img style="height:500px;" src="./img/board.png"/>
		<input type="button" onclick="pageMoveLogin();" value="로그인">
		<input type="button" onclick="pageMoveMemberAdd();" value="회원가입">
		<input type="button" onclick="pageMoveNoticeList();" value="공지사항">
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
	
	function pageMoveNoticeList(){
		location.href = '<%=request.getContextPath()%>/notice/list';
	}
</script>

</html>