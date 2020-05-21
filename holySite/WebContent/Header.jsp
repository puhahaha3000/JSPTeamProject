<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div >
		<a href="<%=request.getContextPath()%>/index.jsp">
			<img src="<%=request.getContextPath()%>/img/logo.png">
		</a>
		<div style="background-color:#4782A4; color:#ffffff; 
		background: linear-gradient(to left, #FFFFFF, #4782A4);
		height:20px; padding: 5px; font-weight: bold"></div>
		<c:if test="${member.email ne null}" var="result">
			<span style="float:right;">
				<c:if test="${member.grade eq '1' }" var="result2">
					관리자님 안녕하세요.
				</c:if>
				<c:if test="${!result2 }">
					${member.nickname}님 안녕하세요.
				</c:if>
				<a href="<%=request.getContextPath()%>/auth/logout">로그아웃</a>
			</span>
		</c:if>
		<c:if test="${!result }">
			<span style="float:right;">
				GUEST님 안녕하세요.
				<a href="<%=request.getContextPath()%>/member/add">회원가입</a>
			</span>
		</c:if>
	</div>

