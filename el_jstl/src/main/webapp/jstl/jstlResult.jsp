<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<%-- request.setCharactorEncoding("UTF-8"); --%>
	<fmt:requestEncoding value="UTF-8" />
	<li>이름 : ${param.name }</li><br>

	<li>나이 : ${param.age }
		<c:if test="${param.age >=19 }"><strong>성인</strong></c:if>
		<c:if test="${param.age < 19 }"><strong>청소년</strong></c:if>
	</li><br>
	
	<li>색깔 : ${param.color } <%-- request.getParameter("color") --%>
		<c:if test="${param.color == 'red' }"><strong>빨강</strong></c:if>
		<c:if test="${param.color == 'green' }"><strong>초록</strong></c:if>
		<c:if test="${param.color == 'blue' }"><strong>파랑</strong></c:if>
		<c:if test="${param.color == 'violet' }"><strong>보라</strong></c:if>
		<c:if test="${param.color == 'cyon' }"><strong>하늘</strong></c:if>
	</li><br>
	<li>색깔 : ${param.color } <%-- request.getParameter("color") --%>
		<c:choose>
			<c:when test="${param.color == 'red' }"><strong>빨강</strong></c:when>
			<c:when test="${param.color == 'green' }"><strong>초록</strong></c:when>
			<c:when test="${param.color == 'blue' }"><strong>파랑</strong></c:when>
			<c:when test="${param.color == 'violet' }"><strong>보라</strong></c:when>
			<c:otherwise><strong>하늘</strong></c:otherwise>
		</c:choose>
	</li><br>
	
	<!-- 취미 항목에서 선택한 값들만 넘어온다 -->
	<li>취미 : 
		${paramValues['hobby'][0] } <%-- request.getParameter("color") --%>
		${paramValues['hobby'][1] } <%-- paramValue.hobby[1] --%>
		${paramValues['hobby'][2] }
		${paramValues['hobby'][3] }
		${paramValues['hobby'][4] }
	</li><br>
	<li>취미 : 
		<c:forEach var="data" items="${paramValues.hobby }">
			${data }
		</c:forEach>
	</li><br>
</ul>
</body>
</html>