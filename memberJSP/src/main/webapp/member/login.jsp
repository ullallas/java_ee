<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "member.dao.MemberDAO"%>

<%
//한글처리 - post방식
request.setCharacterEncoding("UTF-8");

//데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//DB
MemberDAO memberDAO = new MemberDAO();
String name = memberDAO.login(id, pwd);
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
if(name == null) {%>
	아이디 또는 비밀번호가 맞지 않습니다.
<%} else {%> 
	<%=name %>님 로그인
<%} %>


</body>
</html>