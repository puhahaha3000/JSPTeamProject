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
		<h3>글쓰기</h3>
		<form action="./write" method="post">
		작성자:<input type="text" placeholder="작성자" value="${member.Nickname }"><br>
		제목:<input type="text" placeholder="제목"><br>
		내용:<input type="text" placeholder="내용" style="width: 500px; height: 500px;"><br>
		<input type="submit" value="추가">
		<input type="reset" value="취소">
		
		</form>
	</div>

</body>

</html>