<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="result" value="true" />
<c:set var="message" value="덧글이 등록되었습니다." />
<c:set var="num" value="${param.num }" />
<c:set var="writer" value="${param.user_name }" />
<c:set var="content" value="${param.comment }" />
<c:set var="datetime" value="${param.datetime }" />

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result>${result }</result>
	<message>${message }</message>
	<item>
		<num>${num }</num>
		<writer>${writer }</writer>
		<content>${content }</content>
		<datetime>${datetime }</datetime>
	</item>
</comment>