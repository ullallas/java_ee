<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
form[name='loginForm'] div {  /* form[name='loginForm'] div{} -> name 속성 // .loginForm div{} -> class속성 */
	color: red;
	font-size: 8pt;
	font-weight:bold;
}
</style>
<form name="loginForm" id="loginForm" class="loginForm" method="post" action="/miniProject/member/login.do">
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
				<input type = "button" value="로그인" id="loginBtn">
				<input type = "button" value="회원가입" onclick="location.href='/miniProject/member/writeForm.do'">
			</td>
		</tr>
	</table>
</form>
<div id="loginResultDiv"></div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script type = "text/javascript" src="/miniProject/script/member.js"></script> 상대번지 // http://localhost:8080/memberJSP/script/member.js -> 절대번지-->
<!-- <script type = "text/javascript" src="../script/member_jQuery.js"></script> -->
<script type="text/javascript">
//로그인
$('#loginBtn').click(function(){
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#id').val() == ''){
		$('#idDiv').html('아이디를 입력하세요');
		$('#idDiv').css({'color': 'red', 
						 'font-size': '8pt', 
						 'font-weight': 'bold'});
	
	}else if($('#pwd').val() == ''){
		$('#pwdDiv').html('비밀번호를 입력하세요');
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwdDiv').css('font-weight', 'bold');
	
	}else{
		//1번인 경우
		//$('#loginForm').submit();
		
		//2번인 경우
		$.ajax({
			url: '/miniProject/member/login.do',
			type: 'post',
			data: {'id' : $('#id').val(), 
				   'pwd' : $('#pwd').val()}, //서버로 보낼 데이터, JSON
			dataType: 'text', //서버로부터 받는 데이터 형식
			success: function(data){
				data = data.trim();
				alert(data);
				
				if(data == 'ok'){
					location.href = "/miniProject/index.jsp";
				
				} else if(data == 'fail'){
					$('#loginResultDiv').text('로그인 실패');
					$('#loginResultDiv').css({'color': 'red', 
						 'font-size': '13pt', 
						 'font-weight': 'bold'});
				}
			},
			
			error: function(err){
				console.log(err);
			}
		});
	}
});
</script>
