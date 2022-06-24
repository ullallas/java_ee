<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//전역변수 - 1번 처리
	String name = "홍길동";
	int age = 25;
%>
<% 	//스크립트릿
	//자바코드 - 지역변수
	age++;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  안녕하세요 JSP!! <br> //웹 주석 -->
<%-- Hello JSP!! <br> //JSP 주석 --%>
나의 이름은 <%=name %> 입니다 <br>
<!-- 내 나이는 <%=age %>살 입니다 <br>  -->
<%-- 내 나이는 <% out.println(age); %>살 입니다 <br> --%>
</body>
</html>

<%--
JSP는 내용이 바뀔때만 컴파일 동작이 일어난다.
컴파일 - 서버가 꺼졌다가 다시 켜진다 -> 처음부터 다시 시작
--%>