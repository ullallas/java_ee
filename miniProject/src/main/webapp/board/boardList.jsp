<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color: black; text-decoration: none;}
.subjectA:hover {color: deeppink; text-decoration: underline;}
.subjectA:active {color: purple; text-decoration: none;}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>
<input type="hidden" id="pg" value="${requestScope.pg }">
<table id="boardListTable" border="1" bordercolor="#FF7A85" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="100">조회수</th>
	</tr>
	
	<!-- 동적처리 -->
</table>

<div style="float: left; width: 600px; text-align: center; ">
	<input type="button" value="글쓰기" style="margin: 5px; float:left;" onclick="location.href='/miniProject/board/boardWriteForm.do'">
	
	<%-- <c:forEach var="i" begin="1" end="${requestScope.totalP }" step="1">
			
			<c:if test="${requestScope.pg == i}">
				[ <a id="currentPaging" href="/miniProject/board/boardList.do?pg=${i }"> ${i } </a> ]
			</c:if>
			<c:if test="${requestScope.pg != i}">
				[ <a id="paging" href="/miniProject/board/boardList.do?pg=${i }"> ${i } </a> ]
			</c:if>
	
	</c:forEach> --%>
	
<%-- 	<div>${boardPaging.pagingHTML }</div> --%>
	<div id="boardPagingDiv"></div>
</div>
<br><br>

<form id="boardSearchForm">
	<input type="hidden" name="pg" id="searchPg" value="1">
	
	<div style="text-align: center;">
		<select name="searchOption">
			<option value="subject">제목</option>
			<option value="id">작성자</option>
		</select>
		<input type="search" name="keyword" id="keyword" value="${keyword }" placeholder="검색어입력">
		<input type="button" value="검색" id="boardSearchBtn">
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../script/boardList.js"></script>

<script type="text/javascript">
function boardPaging(pg2){
	var keyword = $('#keyword').val();
	
	if(keyword == ''){
		location.href = "boardList.do?pg=" + pg2;
	
	}else {
		$('#searchPg').val(pg2); //searchPg가 1로 고정되어 있기 때문에
		$('#boardSearchBtn').trigger('click'); //강제 이벤트 발생
		
		//다시 검색 버튼을 누르면 1페이지부터 검색을 할 수 있도록 searchPg를 1로 바꾸어야 한다.
		$('#searchPg').val(1);
	}
	
}
</script>






