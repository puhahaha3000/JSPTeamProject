<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div >
		<img src="<%=request.getContextPath()%>/img/logo.png">
		<div style="background-color:#4782A4; color:#ffffff; 
		background: linear-gradient(to left, #FFFFFF, #4782A4);
		height:20px; padding: 5px; font-weight: bold"></div>
		<c:if test="${member.email ne null}">
			<span style="float:right;">
				${member.nickname}
				<a class="button" href="<%=request.getContextPath()%>/auth/logout">로그아웃</a>
			</span>
		</c:if>
	</div>

