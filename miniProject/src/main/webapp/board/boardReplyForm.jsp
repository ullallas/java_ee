<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기</title>
</head><style type="text/css">
form[name='boardReplyForm'] div {
	color: red;
	fint-size: 5pt;
}
</style>
<body>
<h3>답글쓰기</h3>
<form name="boardReplyForm" method="post" action="boardReply.do">
<input type="hidden" name="pseq" id="pseq" value="${requestScope.pseq }">
<input type="hidden" name="pg" id="pg" value="${pg }">
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
				<input type = "button" value="답글쓰기" id="boardReplyBtn">
				<input type = "reset" value="다시작성">
				<input type = "button" value="목록" onclick="location.href='boardList.do?pg=1'">
			</td>
		</tr>
	</table>
	
<!-- <script>
     function checkBoardReply(){
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
           document.boardReplyForm.submit();     
        }
        }
     }
</script> -->

</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#boardReplyBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val() == ''){
			$('#subjectDiv').html('제목을 입력하세요');
		}else if($('#content').val() == ''){
			$('#contentDiv').html('내용을 입력하세요');
		}else{
			$.ajax({
				type: 'post',
				url: '/miniProject/board/boardReply.do',
				data: {'pseq' : $('#pseq').val(), //원글번호
					   'subject': $('#subject').val(),
					   'content': $('#content').val()},
			    success: function(){
					alert('작성하신 글을 저장하였습니다.');
					location.href = '/miniProject/board/boardList.do?pg=${pg}';
				},
				error: function(e){
					console.log(e);
				}
					   
			});
		}
	});
});
</script>

</body>
</html>