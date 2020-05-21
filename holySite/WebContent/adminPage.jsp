<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">

</head>

<body>

	<div>
		<jsp:include page="/Header.jsp"/>
		
		<div style="padding: 20px;">
			<ul id="mainNav">
				<c:if test="${member.grade eq '1'}">
					<li>
						<a href="<%=request.getContextPath()%>/member/list">회원목록</a>
					</li>
				</c:if>
				<li>
					<a href="<%=request.getContextPath()%>/member/add">회원가입</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/member/list">게시판</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/member/list">공지사항</a>
				</li>
<!-- 				<li><input type="button" onclick="pageMoveMemberList();" value="회원목록"></li> -->
<!-- 				<li><input type="button" onclick="pageMoveMemberAdd();" value="회원가입"></li> -->
<!-- 				<li><input type="button" onclick="pageMoveBulletinList();" value="글목록"></li> -->
<!-- 				<li><input type="button" onclick="pageMoveBulletinWrite();" value="글쓰기"></li> -->
<!-- 				<li><input type="button" onclick="pageMoveNoticeList();" value="공지목록"></li> -->
<!-- 				<li><input type="button" onclick="pageMoveNoticeWrite();" value="공지쓰기"></li> -->
			</ul>
		</div>
		
		<jsp:include page="/Tail.jsp"/>
	
	</div>

</body>

	<script type="text/javascript">
		function pageMoveMemberList(){
			location.href = "./member/list"
		}
		function pageMoveMemberAdd(){
			location.href = "./member/add"
		}
		function pageMoveBulletinList(){
			location.href = "./bulletin/list"
		}
		function pageMoveBulletinWrite(){
			location.href = "./bulletin/add"
		}
		function pageMoveNoticeList(){
			location.href = "./notice/list"
		}
		function pageMoveNoticeWrite(){
			location.href = "./notice/add"
		}
	</script>
</html>