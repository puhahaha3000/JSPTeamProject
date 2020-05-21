<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript">
	function pageMoveDeleteFnc(no){
		var url = "./delete?no=" + no;
		location.href = url;
	}
	
	function pageMoveListFnc(){
		location.href = "./list";
	}
</script>

<body>
	
	<div>
      <form action="./update" method="post">
      <input type="text" name="writer" value="${bulletinDto.writer.nickname}" ><br>
      <input type="text" name="title" value="${bulletinDto.title}" ><br>
      <input type="text" name="text" value="${bulletinDto.text}" style="width: 500px; height: 500px;"><br>
      <c:if test="${member.grade eq '1' || bulletinDto.writer.nickname eq member.nickname}">
      	<input type="submit" value="수정">
      </c:if>
      <c:if test="${member.grade eq '1'|| bulletinDto.writer.nickname eq member.nickname}">
      	<input type="button" value="삭제" onclick='pageMoveDeleteFnc(${bulletinDto.no});'>
      </c:if>
      <input type="button" value="취소" onClick='pageMoveListFnc();'>
      <input type="hidden" name="no" value="${bulletinDto.no}">
      </form>
   </div>
	

</body>

</html>