<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#subjectA:link {color: black; text-decoration: none;}
#subjectA:visited {color: black; text-decoration: none;}
#subjectA:hover {color: deeppink; text-decoration: underline;}
#subjectA:active {color: purple; text-decoration: none;}

#currentPaging {
	color: red;
	text-decoration: underline;
}
#paging {
	color: black;
	text-decoration: none;
}

</style>
</head>
<body>
<table border="1" bordercolor="darkgray" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="100">조회수</th>
	</tr>
	
	<c:if test="${requestScope.list != null }">
		<c:forEach var="boardDTO" items="${requestScope.list }"> <!-- 자료형(BoardDTO)이 없기 때문에 변수명(boardDTO)만 적어줌 -->
			<tr>
				<td align="center">${boardDTO.seq }</td>
				<td>
					<a id="subjectA" href="/mvcBoard/board/boardView.do?seq=${boardDTO.seq }&pg=${pg}">${boardDTO.subject }</a>
				</td>
				<td align="center">${boardDTO.id }</td>
				<td align="center">
					<fmt:formatDate value="${boardDTO.logtime }" pattern="yyyy.MM.dd" />
				</td>
				<td align="center">${boardDTO.hit }</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<div style="float: left; width: 700px; text-align: center; ">
	<input type="button" value="글쓰기" style="margin: 5px; float:left;" onclick="location.href='/mvcBoard/board/boardWriteForm.do'">
	
	<c:forEach var="i" begin="1" end="${requestScope.totalP }" step="1">
			
			<c:if test="${requestScope.pg == i}">
				[ <a id="currentPaging" href="/mvcBoard/board/boardList.do?pg=${i }"> ${i } </a> ]
			</c:if>
			<c:if test="${requestScope.pg != i}">
				[ <a id="paging" href="/mvcBoard/board/boardList.do?pg=${i }"> ${i } </a> ]
			</c:if>
	
	</c:forEach>
</div>
</body>
</html>