<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>

	<div>
		<h3>글수정</h3>
		<form action="./update" method="post">
		번호:<input type="text" name="no" value="${noticeDto.no}"><br>
		작성자:<input type="text"  name="writer" value="${noticeDto.writer.nickname}"><br>
		제목:<input type="text"  name="title" value="${noticeDto.title}"><br>
		내용:<input type="text"  name="text" value="${noticeDto.text}" style="width: 500px; height: 500px;"><br>
		<input type="submit" value="수정">
		<a href="./delete?no=${noticeDto.no}">
			<input type="button" value="삭제">
		</a>
		<a href="./list">
			<input type="reset" value="취소">
		</a>
		
		</form>
	</div>

</body>

</html>