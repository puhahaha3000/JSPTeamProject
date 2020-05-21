<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = "./list";
	}
</script>
<body>

	<div>
      <form action="./add" method="post">
		작성자 : <input type="text" name="writer" value="${member.nickname}" readonly="readonly"><br><br>
		제목 : <input type="text" name="title"><br><br>		           
		내용 : <input type="text" name="text" style="width: 500px; height: 500px;"><br>
		<input type="hidden" name="writerNo" value="${member.no}">
      <input type="submit" value="추가">
      <input type="reset" value="취소">
       <input type="button" value="목록" onClick='pageMoveListFnc();'>
      
      </form>
   </div>

</body>

</html>