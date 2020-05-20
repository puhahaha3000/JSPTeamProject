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
      <form action="./list">
		작성자 : <input type="text" name="writer" value="${bulletin.writer}"><br><br>
		제목 : <input type="text" name="title" value="${bulletin.title}"><br><br>		           
		내용 : <input type="text" name="text" value="${bulletin.text}" style="width: 500px; height: 500px;"><br>
      <input type="submit" value="추가">
      <input type="reset" value="취소">
      
      </form>
   </div>

</body>

</html>