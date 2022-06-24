<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center; width: 900px;">
	<h3>구구단</h3>
</div>
<table border="1" cellspacing="0" cellpadding="10">
<% for(int i=1; i<=9; i++){ %>
	<tr>
	<% for(int dan=2; dan<=9; dan++){ %>
	<td width="120" align="center"><%=dan%> * <%=i%> = <%=dan*i%></td>
	<% }//for dan %>
	</tr>
<% }//for i %>
</table>
</body>
</html>

<%-- for문, 스크립트릿, 출력문 (<%  %> <%=  %>), 정렬은 테이블로
2*1=2   3*1=3         9*1=9
2*2=4   3*2=6         9*2=18
~~~

2*9=18   3*9=27         9*9=81
--%>