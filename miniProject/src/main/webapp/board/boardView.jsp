<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="boardViewForm">
<input type="hidden" name="seq" value="${seq }">
<input type="hidden" name="pg" id="seq" value="${pg}">
<table border="1" width="450" bordercolor="darkgray" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<td colspan="3">
			<h2><span id="subjectSpan"></span></h2>
		</td>
	</tr>
	
	<tr>
		<td width="150" align="center">글번호 : <span id="seqSpan"></td>
		<td width="150" align="center">작성자 : <span id="idSpan"></td>
		<td width="150" align="center">조회수 : <span id="hitSpan"></td>
	</tr>

	<tr>
		<td colspan="3" height="300" valign="top">
			<div style="width: 100%; height: 100%; overflow: auto;">
				 <pre style="white-space: pre-line; word-break; break-all;">
				 	<span id="contentSpan">
				 </pre>
			</div>
		</td>
	</tr>
	
</table>
	<input type = "button" value = "목록" 
	style="margin: 5px;" onclick="location.href='/miniProject/board/boardList.do?pg=${pg}'">
<span id="boardViewSpan">
	<!-- 글수정, 글삭제 버튼은 본인의 글일 때만 뜨게 한다 (if) -->
	<input type="button" value="글수정" onclick="mode(1)">
	<input type="button" value="글삭제" id="boardDeleteBtn">
</span>
	
	<input type="button" value="답글" onclick="mode(3)">
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getBoardView.do',
		data: 'seq='+$('input[name="seq"]').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if(data.memId == data.id)
				$('#boardViewSpan').show();
			else
				$('#boardViewSpan').hide();

		},
		error: function(e){
			console.log(e);
		}
	});
});

//글삭제 버튼
$('#boardDeleteBtn').click(function(){
	if(confirm("정말로 삭제하시겠습니까?"))
		$.ajax({
			type: 'post',
			url: '/miniProject/board/boardDelete.do',
			data: 'seq=${seq}',
			success: function(){
				alert("선택하신 글을 삭제하였습니다.");
				location.href='boardList.do?pg=1';
			},
			error: function(e){
				console.log(e);
			}
		
		});
});
</script>
	
<script type="text/javascript">
	function mode(num){
		if(num==1){ //글수정, seq, pg
			document.boardViewForm.method = "post";
			document.boardViewForm.action = "/miniProject/board/boardUpdateForm.do";
			document.boardViewForm.submit();
		
		}else if(num==2){ //글삭제
			if(confirm("정말로 삭제하시겠습니까?")){
				document.boardViewForm.method = "post";
				document.boardViewForm.action = "/miniProject/board/boardDelete.do";
				document.boardViewForm.submit();
			}
		
		}else if(num==3){ //답글
			document.boardViewForm.method = "post";
			document.boardViewForm.action = "/miniProject/board/boardReplyForm.do";
			document.boardViewForm.submit();
			// submit <<  form안에 있는 입력상자의 데이터를 들고 페이지 이동
		}
	}
</script>
</body>
</html>