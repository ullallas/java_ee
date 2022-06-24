<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" bordercolor="darkgray" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<td colspan="3">
			<h2>${boardDTO.subject }</h2>
		</td>
	</tr>
	
	<tr>
		<td width="150" align="center">글번호 : ${boardDTO.seq }</td>
		<td width="150" align="center">작성자 : ${boardDTO.id }</td>
		<td width="150" align="center">조회수 : ${boardDTO.hit }</td>
	</tr>

	<tr>
		<td colspan="3" height="300" valign="top">
			<pre style="white-space: pre-wrap"> ${boardDTO.content }</pre>
		</td>
	</tr>
	
</table>
	<input type = "button" value = "목록" 
	style="margin: 5px;" onclick="location.href='/mvcBoard/board/boardList.do?pg=${pg}'">
</body>
</html>