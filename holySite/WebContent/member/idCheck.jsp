<%@page import="spms.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>아이디 중복체크</title>

</head>

<body>
	<br>
    <b><font size="5" color="gray">이메일(ID) 중복체크</font></b>
    <br><br>
 	
 	<form form id="checkId" action="/member/idcheck" method="post">
    <input type="text" id="getText" name="email">
	<input type="submit" value="중복체크">
    </form>
    <br><br>
    <input type="button" value="창닫기" onclick="window.close()">  


	
	
	
</body>

</html>