<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta charset="UTF-8">
<title>회원정보수정</title>
<style type="text/css">
#updateForm div {
	color: red;
	font-size: 8pt;
	font-weight:bold;
}
</style>

<h3>회원정보수정</h3>
<form name="updateForm" id="updateForm" method="post" action="/miniProject/member/update.do">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="50" align="center">이름</td>
			<td>
				<input type="text" name="name" id="name">
				<div id="nameDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="50" align="center">아이디</td>
			<td>
				<input type="text" name="id" id="id" readonly>
			</td>
		<tr>
			<td width="100" align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd" id="pwd">
				<div id="pwdDiv"></div>
			</td>
		<tr>
			<td width="50" align="center">재확인</td>
			<td>
				<input type="password" name="repwd" id="repwd">
				<div id="repwdDiv"></div>
			</td>
		</tr>
		<tr>
			<td align="center">성별</td>
			<td>
				<label><input type="radio" name="gender" id="gender1" value="0">남</label>
				<label><input type="radio" name="gender" id="gender2" value="1">여</label>
			</td>
		</tr>
		<tr>
			<td align="center">이메일</td>
			<td>
				<input type="text" name="email1" > 
				@
				<input type="email" list="email2" name="email2" value="" placeholder="직접입력" >
				<datalist id="email2">
					<option value="gmail.com">
					<option value="daum.net">
					<option value="naver.com">
				</datalist>
			</td>
		</tr>
		<tr>
			<td align="center">핸드폰</td>
			<td>
				<select name="tel1" style="width: 70px;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019">019</option>
				</select>
				-
				<input type="text" name="tel2" id="tel2" size="5" >
				-
				<input type="text" name="tel3" id="tel3" size="5" >
			</td>
		</tr>
		<tr>
			<td width="50" align="center">주소</td>
			<td>
				<input type="text" name="zipcode" id="zipcode" readonly> <!-- value="${memberDTO.zipcode }" -->
				<input type="button" value="우편번호검색" onclick="checkPost()"><br>
				<input type="text" name="addr1" id="addr1" size="50" readonly><br>
				<input type="text" name="addr2" id="addr2" size="50"><br>
			</td>
		</tr>
		<tr>
		<td colspan="2" align="center">
				<input type = "button" value="회원정보수정" id="updateBtn">
				<input type = "reset" value="다시작성" onclick="location.reload()">
			</td>
		</tr>
	</table>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../script/member_jQuery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject/member/getMember.do',
		dataType: 'json',
		success: function(data){
			//alert( JSON.stringify(data) );
			
			$('input[name="name"]').val(data.name);
			$('input[name="id"]').val(data.id);
			$('input[name="gender"]:eq(' + data.gender + ')').attr("checked", true);
			$('input[name="email1"]').val(data.email1);
			$('input[name="email2"]').val(data.email2);
			$('select[name="tel1"]').val(data.tel1);
			$('input[name="tel2"]').val(data.tel2);
			$('input[name="tel3"]').val(data.tel3);
			$('input[name="zipcode"]').val(data.zipcode);
			$('input[name="addr1"]').val(data.addr1);
			$('input[name="addr2"]').val(data.addr2);
		},
		error: function(err){
			console.log(err);
		} 
	});
});

//회원정보 수정
$('#updateBtn').click(function(){
	$('#nameDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#name').val() == ''){
		$('#nameDiv').html('이름을 입력하세요');
		$('#nameDiv').css('color', 'red');
		$('#nameDiv').css('font-size', '8pt');
		$('#nameDiv').css('font-weight', 'bold');
	}else if($('#pwd').val() == ''){
		$('#pwdDiv').html('비밀번호를 입력하세요');
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwdDiv').css('font-weight', 'bold');
	
	}else if($('#repwd').val() != $('#pwd').val()){
		$('#repwdDiv').html('비밀번호가 맞지 않습니다');
		$('#repwdDiv').css('color', 'red');
		$('#repwdDiv').css('font-size', '8pt');
		$('#repwdDiv').css('font-weight', 'bold');
	
	}else{
		//$('#updateForm').submit();
		
		$.ajax({
			type: 'post',
			url: '/miniProject/member/update.do',
			data: $('#updateForm').serialize(), //.serialize() => 문자열로 들어옴 / '변수=값&변수=값&~~'
			success: function(){
				alert('회원님의 정보를 수정하였습니다.');
				location.href = '/miniProject/index.jsp';
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
</script>
