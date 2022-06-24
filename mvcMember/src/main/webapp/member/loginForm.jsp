<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
#loginForm div {  /* form[name='loginForm'] div{} -> name 속성 // .loginForm div{} -> class속성 */
	color: red;
	font-size: 8pt;
	font-weight:bold;
}
</style>
</head>
<body>
<h3>로그인</h3>
<form name="loginForm" id="loginForm" class="loginForm" method="post" action="/mvcMember/member/login.do">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="50" align="center">아이디</td>
			<td>
				<input type="text" name="id" id="id">
				<div id="idDiv"></div>
			</td>
		<tr>
		<tr>
			<td width="100" align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd" id="pwd">
				<div id="pwdDiv"></div>
			</td>
		<tr>
		<tr>
		<td colspan="2" align="center">
				<input type = "button" value="로그인" onclick="checkLogin()">
				<input type = "button" value="회원가입" onclick="location.href='/mvcMember/member/writeForm.do'">
			</td>
		</tr>
	
	</table>
</form>
<script type = "text/javascript" src="../script/member.js"> </script>
</body>
</html>