<%@page import="com.ob.biz.dao.BoardDAO"%>
<%@page import="com.ob.biz.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 값으로 DB 데이타 조회하고 화면에 표시 --%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<h1>글 상세</h1>
	<p><a href="logout.do">Log-out</a></p>
	<hr>
	<form action="updateBoard.do" method="post">
		<input type="hidden" name="seq" value="${board.seq }">
	<table>
		<tr>
			<th width="70">제목</th>
			<td>
				<input type="text" name="title" 
						value="${board.title }">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.writer}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="10" cols="40"
					name="content">${board.content}</textarea>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${board.regdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.getCnt() }</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
	</table>
	</form>
	<p>
		<a href="views/insertBoard.jsp">글등록</a>
		<a href="deleteBoard.do?seq=${board.seq }">글삭제</a>
		<a href="getBoardList.do">글목록</a>
	</p>
	
</div>

</body>
</html>