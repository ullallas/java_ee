<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<style type="text/css">
form[name='boardUpdateForm'] div {
	color: red;
	fint-size: 5pt;
}
</style>
<body>
<h3>글수정</h3>
<form name="boardUpdateForm">
<input type="hidden" name="seq" id="seq" value="${seq}">
<input type="hidden" name="pg" id="pg" value="${pg}">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="70" align="center">제목</td>
			<td>
				<input type="text" name="subject" id="subject" value="">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea name="content" id="content" rows="15" cols="50"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
				<input type = "button" value="글수정" id="boardUpdateBtn">
				<input type = "reset" id="resetBtn" value="다시작성" onclick="location.reload()">
				<input type = "button" value = "목록" onclick="location.href='boardList.do?pg=${pg}'"> <!-- /miniProject/board/boardList.do?pg=${pg} -->
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getBoardView.do',
		data: {'seq' : $('#seq').val()},
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#subject').val(data.subject);
	        $('#content').val(data.content);
		},
		error: function(e){
			console.log(e);
		}
	
	});

//수정버튼
$('#boardUpdateBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() == ''){
		$('#subjectDiv').html('제목을 입력하세요');
		$('#subjectDiv').css('color', 'red');
		$('#subjectDiv').css('font-size', '8pt');
		$('#subjectDiv').css('font-weight', 'bold');
	}else if($('#content').val() == ''){
		$('#contentDiv').html('내용을 입력하세요');
		$('#contentDiv').css('color', 'red');
		$('#contentDiv').css('font-size', '8pt');
		$('#contentDiv').css('font-weight', 'bold');
	}else{
		$.ajax({
			type: 'post',
			url: '/miniProject/board/boardUpdate.do',
			data: {
				'seq': $('#seq').val(),
				'subject': $('#subject').val(),
				'content': $('#content').val()
			},
			success: function(){
				alert('글을 수정하였습니다.');
				location.href = '/miniProject/board/boardList.do?pg='+$('#pg').val();
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
	});
});

</script>
	
<!-- <script type="text/javascript">
     function checkBoardUpdate(){
        const subjectEle = document.getElementById('subject');
        const contentEle = document.getElementById('content');
        const subjectDiv = document.getElementById('subjectDiv');
        const contentDiv = document.getElementById('contentDiv');

        subjectDiv.innerText = "";
        contentDiv.innerText = "";
        
        if(subjectEle.value === ""){
           subjectDiv.innerText = "제목을 입력하세요.";
        }else{
        if(contentEle.value === ""){
           contentDiv.innerText = "내용을 입력하세요.";
        }else{
           document.boardUpdateForm.submit();     
        }
        }
     }
</script> -->


</body>
</html>