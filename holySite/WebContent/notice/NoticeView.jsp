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
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<c:forEach var="noticeDto" items="${noticeList}">
				<tr>
					<td><a href='./update?no=${noticeDto.no}'>${noticeDto.no}</a></td>
					<td>${noticeDto.title }</td>
					<td>${noticeDto.writer.nickname }</td>
					<td>${noticeDto.createdDate }</td>
					
				</tr>
			</c:forEach>
		</table>
		
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
	
</script>

</html>