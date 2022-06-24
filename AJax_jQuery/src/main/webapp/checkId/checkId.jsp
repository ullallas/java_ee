<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%> <%-- XML파일 태그 시작 전의 공백 문자 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<%--
DB 연동 - 아이디가 "hong"이면 이미 DB에 저장된 아이디 취급
 --%>

<c:set var="result" value="false" />
<c:if test="${param.user_id == 'hong'}">
	<c:set var="result" value="true" />
</c:if>

<?xml version="1.0" encoding="UTF-8"?>

<check_id>
	<result>${result}</result>
</check_id>

<%--
* trimDirectiveWhitespaces 속성
jsp에서 서블릿이나 EL을 이용할 경우 로딩된 페이지에서 소스보기를 해 보면 공백으로 표기가 된다.
trimDirectiveWhitespaces 속성을 true로 할 경우 해당 공백을 모두 제거해 준다.
--%>