<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
		
		<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일자</td>
		</tr>
		<c:forEach var="bulletinDto" items="${bulletinList}">
			<tr>
				<td>${bulletinDto.no}</td>
				<td><a href="./update?no=${bulletinDto.no}">${bulletinDto.title}</a></td>
				<td>${bulletinDto.writer.nickname}</td>
				<td>${bulletinDto.createdDate}</td>
			</tr>
		</c:forEach>
		</table>
		<form action="./add">
		<button>글쓰기</button>
		</form>
		
		
		<jsp:include page="/Tail.jsp"/>
		
	</div>

</body>

<script type="text/javascript">
	
</script>

</html>