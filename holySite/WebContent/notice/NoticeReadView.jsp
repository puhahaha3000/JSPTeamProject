<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">
</head>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">

	window.onload = function() {
		navBtnCngFnc();
	}
	function pageMoveListFnc() {
		location.href = "./list";
	}
</script>
<body>

	<div>
		<jsp:include page="/Header.jsp"/>
		<c:if test="${member.grade eq '1'}">
		<h3>글수정</h3>
		</c:if>
		<form action="./update" method="post">
		번호:<input type="text" name="no" value="${noticeDto.no}"><br>
		작성자:<input type="text"  name="writer" value="${noticeDto.writer.nickname}"><br>
		제목:<input type="text"  name="title" value="${noticeDto.title}"><br>
		<c:if test="${member.grade eq '1'}">
		<h3>내용:</h3><textarea  name="text" style="width: 500px; height: 500px; resize: none;">${noticeDto.text}
		</textarea><br>
		</c:if>
		<c:if test="${member.grade eq '0'}">
		<h3>내용:</h3><textarea  name="text" style="width: 500px; height: 500px; resize: none; readonly">${noticeDto.text}
		</textarea><br>
		</c:if>
		<c:if test="${member.grade eq '1'}">
		
		<input type="submit" value="수정">
		<a href="./delete?no=${noticeDto.no}">
			<input type="button" value="삭제">
		</a>
		</c:if>
			<input type="reset" value="취소" onclick="pageMoveListFnc();">
		
		
		</form>
		<jsp:include page="/Tail.jsp"/>
	</div>

</body>

</html>