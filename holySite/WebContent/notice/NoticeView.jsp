<%@page import="spms.dao.NoticeDao"%>
<%@page import="spms.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/common.css" type="text/css">


</head>
	<%-- <% 
		ArrayList<NoticeDao> noticeList = 
		(ArrayList<NoticeDao>)request.getAttribute("noticeList");

	%> --%>

<body>

	<div>
		<jsp:include page="/Header.jsp"/>
		<div style='margin-left: 50px; margin-top:20px;'>
		<table id='tb'>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="noticeDto" items="${noticeList}">
				<tr>
					<td>${noticeDto.no}</td>
					<td><a href='./update?no=${noticeDto.no}'>${noticeDto.title }</a></td>
					<td>${noticeDto.writer.nickname }</td>
					<td>${noticeDto.createdDate }</td>
					
				</tr>
			</c:forEach>
		</table>
		
		<input class="pageBtn" type="button" value="&#8592;" onclick="pageMovePre(${pageNo})">
		<c:forEach var="i" begin="1" end="${pageCnt}">
			<input class="pageBtn" type="button" value="${i}" onclick="pageMove(${i})">
		</c:forEach>
		<input class="pageBtn" type="button" value="&#8594;" onclick="pageMoveNext(${pageNo}, ${pageCnt})">
		
		<c:if test="${member.grade eq '1'}">
			<button onclick="addTable();">추가</button>
		</c:if>
		
		</div>
		<jsp:include page="/Tail.jsp"/>
		
	</div>
	

</body>

<script type="text/javascript">
	
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