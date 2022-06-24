$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getBoardList.do',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				console.log(index, items.seq, items.subject, items.id, items.logtime, items.hit);
				
				$('<tr/>').append($('<td/>', {
					align: 'center',
					text: items.seq
				})).append($('<td/>', {
					
					}).append($('<a/>', {
						href: '#',
						text: items.subject,
//						id: 'subjectA',
//						class: 'subjectA_'+items.seq
						class: 'subjectA subjectA_'+items.seq
					}))
				).append($('<td/>', {
					align: 'center',
					text: items.id
				})).append($('<td/>', {
					align: 'center',
					text: items.logtime
				})).append($('<td/>', {
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));
				
				//로그인 여부 - 비동적
				$('.subjectA_'+items.seq).click(function(){
					if(data.memId == null){
						alert('먼저 로그인하세요');
					}else{
						location.href = '/miniProject/board/boardView.do?seq='+items.seq+'&pg='+$('#pg').val();
					}
				});
				
				//답글
				for(i=0; i<items.lev; i++){
					$('.subjectA_'+items.seq).before('&emsp;');
				}
				if(items.pseq != 0){
					$('.subjectA_'+items.seq).before($('<img/>', {
						src: '/miniProject/img/reply.gif'
					}));
				}
			
			}); //each
			
			//로그인 여부 - 비동적
//			$('.subjectA').click(function(){
//				if(data.memId == null){
//					alert('먼저 로그인하세요');
//				}else{
//					location.href = '/miniProject/board/boardView.do?seq='+items.seq+'&pg='+$('#pg').val();
//				}
//			});
			
			//로그인 여부 - 동적
			//조상
			//$('#boardListTable').on('click', '#subjectA', function(){});
//			$(document).on('click', '#subjectA', function(){
//				//alert($(this).parent().prev().prop('tagName'));
//				//alert($(this).parent().prev().text());
//				
//				if(data.memId == null){
//					alert('먼저 로그인하세요');
//				}else{
//					var seq = $(this).parent().prev().text();
//					location.href = '/miniProject/board/boardView.do?seq='+seq+'&pg='+$('#pg').val();
//				}
//			});
			
			//페이징 처리
			$('#boardPagingDiv').html(data.pagingHTML);
		
			}, //data
		
			error: function(e){
			console.log(e);
			}
	});
});

//검색
$('#boardSearchBtn').click(function(){
	if($('#keyword').val() == '') 
		alert('검색어를 입력하세요.');
	else{
		$.ajax({
			type: 'post',
			url: '/miniProject/board/boardSearch.do',
			data: $('#boardSearchForm').serialize(), //pg, searchOption, keyword
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data));
				
				//테이블에서 기존 목록 제거
				$('#boardListTable tr:gt(0)').remove();
				
				$.each(data.list, function(index, items){
					console.log(index, items.seq, items.subject, items.id, items.logtime, items.hit);
				
					$('<tr/>').append($('<td/>', {
						align: 'center',
						text: items.seq
					})).append($('<td/>', {
						
						}).append($('<a/>', {
							href: '#',
							text: items.subject,
	//						id: 'subjectA',
	//						class: 'subjectA_'+items.seq
							class: 'subjectA subjectA_'+items.seq
						}))
					).append($('<td/>', {
						align: 'center',
						text: items.id
					})).append($('<td/>', {
						align: 'center',
						text: items.logtime
					})).append($('<td/>', {
						align: 'center',
						text: items.hit
					})).appendTo($('#boardListTable'));
					
					//로그인 여부 - 비동적
					$('.subjectA_'+items.seq).click(function(){
						if(data.memId == null){
							alert('먼저 로그인하세요');
						}else{
							location.href = '/miniProject/board/boardView.do?seq='+items.seq+'&pg='+$('#pg').val();
						}
					});
					
					//답글
					for(i=0; i<items.lev; i++){
						$('.subjectA_'+items.seq).before('&emsp;');
					}
					if(items.pseq != 0){
						$('.subjectA_'+items.seq).before($('<img/>', {
							src: '/miniProject/img/reply.gif'
						}));
					}
			
				}); //each
			
			//페이징 처리
			$('#boardPagingDiv').html(data.pagingHTML);
				
			},
			error: function(e){
			console.log(e);
			} 
		});
	}
});
