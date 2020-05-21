<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = "./list";
	}
</script>

</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css" type="text/css">
<body>

	<div>
		<jsp:include page="/Header.jsp"/>
		<div style="margin-left: 50px; margin-top: 20px;">
		<h3>글쓰기</h3>
		<form action="./write" method="post">
		작성자:<input type="text"  name="writer" value="${member.nickname }"><br>
		제목:<input type="text"  name="title"><br>
		내용:<input type="text"  name="text" style="width: 500px; height: 500px;"><br>
		<input type="hidden" name="writerNo" value="${member.no }">
		<div style="margin-left: 35px;">
			<input type="submit" value="추가">
			<input type="reset" value="취소" onclick="pageMoveListFnc();">
		</div>
		
		</form>
		
		</div>
		<jsp:include page="/Tail.jsp"/>
	</div>

</body>

</html>