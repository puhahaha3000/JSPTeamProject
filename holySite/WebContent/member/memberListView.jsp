<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	table, tr, td{
		border: 1px solid black;
	}
	td{ 
		width : 100px;
		text-align: center;
	}
	button {
		width : 80px;
		margin-right: 20px;
		margin-top : 50px;
}
</style>
</head>

<body>

	<h1>회원목록</h1>
	
	<table>
		<tr>
			<td class="firstTd">회원번호</td>
			<td class="secondTd">닉네임</td>
			<td class="thirdTd">회원등급</td>
		</tr>
		<tr>
			<td>샘플1</td>
			<td>우와</td>
			<td>우와아</td>
		</tr>
	</table>
	
	<button>추가</button>
	<button>수정</button>
	<button>삭제</button>

</body>

</html>