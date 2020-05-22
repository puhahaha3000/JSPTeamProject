<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div style='margin-left: 50px; margin-top:20px;'>
		<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
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
		
		<input class="pageBtn" type="button" value="&#8592;" onclick="pageMovePre(${pageNo})">
		
		<fmt:parseNumber value="${((pageNo - 1) / 10)}" type="number" var ="paNo" integerOnly="true"></fmt:parseNumber>

		<c:set var="startNo" value="${paNo * 10 + 1}"></c:set>
		<c:set var="endNo" value="${(paNo + 1) * 10}"></c:set>
		<c:if test="${endNo > pageCnt }">
			<c:set var="endNo" value="${pageCnt }"></c:set>
		</c:if>
		
		<c:forEach var="i" begin="${startNo}" end="${endNo}">
			<input class="pageBtn" type="button" value="${i}" onclick="pageMove(${i})">
		</c:forEach>
		
		<input class="pageBtn" type="button" value="&#8594;" onclick="pageMoveNext(${pageNo}, ${pageCnt})">
		
		<form action="./add">
			<button>글쓰기</button>
		</form>
		
		</div>
		<jsp:include page="/Tail.jsp"/>
		
	</div>

</body>

<script type="text/javascript">
	window.onload = function(){
	var navObjArr = document.getElementsByClassName("pageBtn");
	var locInt = <%=request.getAttribute("pageNo")%>;
	var navObj = '';
	
	for (var i = 0; i < navObjArr.length; i++) {
		if(navObjArr[i].value == locInt){
			navObj = navObjArr[i];
			break;
		}
	}
	
	if(navObj != ''){
		navObj.style.backgroundColor = "#FFFFFF";
		navObj.style.color = "#59b1eb";
	}
}
	
	function addTable() {
		location.href="./add"

	}
	
	function pageMove(obj){
		location.href="./list?pageNo=" + obj;
	}
	
	function pageMovePre(obj){
		obj--;
		if(obj < 1){
			obj = 1;
		}else {
			location.href="./list?pageNo=" + obj;
		}
	}

	function pageMoveNext(obj, pageCnt){
		obj++;
		if(obj > pageCnt){
			obj = pageCnt;
		}
		location.href="./list?pageNo=" + obj;
	}
	
</script>

</html>