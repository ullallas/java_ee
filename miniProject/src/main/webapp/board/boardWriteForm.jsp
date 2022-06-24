<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
form[name='boardWriteForm'] div {
	color: red;
	font-size: 5pt;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<h3>글쓰기</h3>
<form name="boardWriteForm" method="post" action="/miniProject/board/boardWrite.do">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="70" align="center">제목</td>
			<td>
				<input type="text" name="subject" id="subject" placeholder="제목을 입력하세요">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea name="content" id="content" rows="15" cols="50" placeholder="내용을 입력하세요"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
				<input type = "button" value="글쓰기" id="boardWriteBtn">
				<input type = "reset" value="다시작성">
				<input type = "button" value = "목록" onclick="location.href='/miniProject/board/boardList.do?pg=1'">
			</td>
		</tr>
	</table>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#boardWriteBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val() == ''){
			$('#subjectDiv').html('제목을 입력하세요');
		}else if($('#content').val() == ''){
			$('#contentDiv').html('내용을 입력하세요');
		}else{
			
			$.ajax({
				type: 'post',
				url: '/miniProject/board/boardWrite.do',
				//data: $('#boardWriteForm').serialize(), //.serialize() => 문자열로 들어옴 / '변수=값&변수=값&~~'
				//data: 'subject=' + $('#subject').val() + '$content=' + $('#content').val(),
				data: {'subject': $('#subject').val(),
					   'content': $('#content').val()},
				success: function(){
					alert('작성하신 글을 저장하였습니다.');
					location.href = '/miniProject/board/boardList.do?pg=1';
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	});
});
</script>
</form>
</body>
</html>