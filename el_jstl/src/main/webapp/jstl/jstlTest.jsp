<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- uri가 url보다 큼 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h3>변수 설정</h3>
<body>
<c:set var="name" value="홍길동" />
<c:set var="age" >25</c:set>

나의 이름은 <c:out value="${name }" /> 입니다 <br> <!-- 둘 다 상관없지만 c:out이 더 보안에 좋음 -->
내 나이는 ${age }살 입니다 <br>
나의 키는 ${height }cm 입니다 <br>

<h3>forEach</h3>
<c:forEach var="i" begin="1" end="10" step="1">
	<c:set var="sum" value="${sum + i }" />
	${i }
</c:forEach>
<br>
1 ~ 10까지의 합 = ${sum }
<br><br>
<c:forEach var="j" begin="0" end="9" step="1">
	${10 - j }
</c:forEach>
<br>

<h3>문자열 분리</h3>
<c:forTokens var="car" items="소나타,아우디,링컨,페라리,벤츠" delims=",">
${car }<br>
</c:forTokens>

<h3>jstlStart.jsp에서 넘어온 데이터 출력</h3>
결과 = ${ requestScope.list } <%-- request.getAttriute("list") --%>

<h3> list에서 2번째 값 출력 </h3>
${ list[2] } <!-- requestScope 생략가능 => pageScope에 list가 없어서 -->

<h3> list의 항목을 하나씩 출력 </h3>
<c:forEach var="data" items="${list }"> <%-- for(String data : list) --%>
	${data }
</c:forEach>

<h3> list2의 항목을 하나씩 출력 </h3>
<c:forEach var="personDTO" items="${requestScope.list2 }"> <%-- for(PersonDTO personDTO : list2) --%>
	이름 = ${personDTO.getName() } &emsp; 나이 = ${personDTO.getAge() } <br>
	이름 = ${personDTO.name } &emsp; 나이=${personDTO.age } <br> <!-- 메소드명을 변수명처럼 사용할 수 있다 -->
</c:forEach>
</body>
</html>