<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="result" value="false" />
<c:set var="message" value="덧글 삭제에 실패하였습니다." />

<c:if test="${param.num != 0 }">
	<c:set var="result" value="true" />
	<c:set var="message" value="덧글이 삭제되었습니다." />
</c:if>

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result>${result }</result>
	<message>${message }</message>
</comment>