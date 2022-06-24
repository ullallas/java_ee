<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: auto;
}

#header {
	margin: auto;
	/* margin-left: 30px;
	margin-right: 30px; */
	width: 1000px;
	height: 10%;
	text-align: center;
}
#container {
	margin: auto;
	width: 1000px;
	/* margin-left: 30px; */
	/* margin-right: 30px; */
	height: 500px;
	background: Lavenderblush;
}
#container:after {
	content: ' ';
	display: block;
	clear: both;
	float: none;
}
#nav {
	/* margin-left: 10px; */
	width: 28%;
	height: 100%;
	float: left;
	background: plum;
}
#section {
	margin-left: 10px;
	width: 71%;
	height: 100%;
	float: left;
	background: Lightpink;
}
#footer {
	width: 1700px;
	height: 10%;
}
</style>
</head>
<body>
<div id="header">
	<h1>
		<img src="/miniProject/img/malsook.jpg" width="60"
		alt="malsook" onclick="location.href='/miniProject/index.jsp'" style="cursor: pointer;">MVC를 이용한 미니 프로젝트</h1>
	<br>
	<jsp:include page="./main/menu.jsp" />
</div>
<div id="container">
	<div id="nav">
		<jsp:include page="./main/nav.jsp" />
	</div>
	<div id="section">
		<c:if test="${empty display }">
			<h1>
				감사합니다 땡큐~ <br>
				Have a lovely day ♥
				<img src="/miniProject/img/malsook.jpg" alt="malsook"  width="500">
			</h1>
		</c:if>
		<c:if test="${not empty display }">
			<jsp:include page="${display }" />
		</c:if>
	</div>
</div>
<div id="footer">
	<p>낄낄~</p>
</div>
</body>
</html>