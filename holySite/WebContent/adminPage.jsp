<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>

	<input type="button" onclick="pageMoveMemberList();" value="회원목록">
	<input type="button" onclick="pageMoveMemberAdd();" value="회원가입">
	<input type="button" onclick="pageMoveBulletinList();" value="글목록">
	<input type="button" onclick="pageMoveBulletinWrite();" value="글쓰기">
	<input type="button" onclick="pageMoveNoticeList();" value="공지목록">
	<input type="button" onclick="pageMoveNoticeWrite();" value="공지쓰기">

</body>

	<script type="text/javascript">
		function pageMoveMemberList(){
			location.href = "./member/list"
		}
		function pageMoveMemberAdd(){
			location.href = "./member/add"
		}
		function pageMoveBulletinList(){
			location.href = "./bulletin/list"
		}
		function pageMoveBulletinWrite(){
			location.href = "./bulletin/add"
		}
		function pageMoveNoticeList(){
			location.href = "./notice/list"
		}
		function pageMoveNoticeWrite(){
			location.href = "./notice/add"
		}
	</script>
</html>