<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function listPageMoveFnc() {
		location.href = '<%=request.getContextPath()%>/auth/login';
	}
</script>

</head>

<body>
	
	<jsp:include page="/Header.jsp"/>
	
	<p onclick="listPageMoveFnc();">Team</p>
	
	<jsp:include page="/Tail.jsp"/>

</body>

</html>