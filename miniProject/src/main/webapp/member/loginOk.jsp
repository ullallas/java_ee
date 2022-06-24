<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>${sessionScope.memName }님 로그인</h3> <!-- ${requestScope.id == null }  -->
<input type="button" value="로그아웃" id="logoutBtn">
<input type="button" value="회원정보수정" onclick="location.href='/miniProject/member/updateForm.do'">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#logoutBtn').click(function(){
		$.ajax({
			type: 'post',
			url: '/miniProject/member/logout.do',
			success: function(){
				alert("로그아웃");
				location.href = "/miniProject/index.jsp";
			},
			error: function(err){
				console.log(err);
			}
		});
	});
});

</script>
