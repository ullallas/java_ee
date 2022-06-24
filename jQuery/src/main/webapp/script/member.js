$(function(){
	$('#join').submit(function(){
		var user_id = $('input[name="user_id"]').val(); //input[name=user_id]도 가능
		if(!user_id){
			alert("아이디를 입력하세요.");
			$('input[name="user_id"]').focus();
			return false;
		}
		
		if(!$('input[name="user_pw"]').val()){
			alert("비밀번호를 입력하세요.");
			$('input[name="user_pw"]').focus();
			return false;
		}
		
		if(!$('input[name="juminno"]').val()){
			alert("주민번호를 입력하세요.");
			$('input[name="juminno"]').focus();
			return false;
		}
		
		if(!$('input[name="gender"]').is(':checked')){
			alert("성별을 선택하세요.");
			//document.form1.gender[0].checked = true; //남자로 체크됨, [1]은 여자 --> 자바스크립트
			//$('input[name="gender"]:eq(0)').attr('checked', true);
			$('input[name="gender"]:eq(0)').prop('checked', true);
			return false;
		}
		
		if(!$('input[name="email"]').val()){
			alert("이메일을 입력하세요.");
			$('input[name="email"]').focus();
			return false;
		}
		
		if(!$('input[name="url"]').val()){
			alert("홈페이지를 입력하세요.");
			$('input[name="url"]').focus();
			return false;
		}
		
		if(!$('input[name="hpno"]').val()){
			alert("핸드폰 번호를 입력하세요.");
			$('input[name="hpno"]').focus();
			return false;
		}
		
		if(!$('input[name="hobby"]').is(':checked')){
			alert("취미를 선택하세요.");
			$('input[name="hobby"]:eq(0)').attr('checked', true);
			return false;
		}
		
		if( $('select[name="job"] > option:selected').index() < 1){ //0번부터 시작
			alert("직업을 선택하세요");
			$('select[name="job"] > option:eq(1)').attr('selected', true);
			return false;
		}
		
		//입력한 내용을 화면에 출력
		var user_id = $('input[name="user_id"]').val(); //위에서 선언했으므로 없어도 됨
		var user_pw = $('input[name="user_pw"]').val(); 
		var juminno = $('input[name="juminno"]').val(); 
		var gender = $('input[name="gender"]:checked').val(); 
		var email = $('input[name="email"]').val(); 
		var url = $('input[name="url"]').val(); 
		var hpno = $('input[name="hpno"]').val(); 
		var job = $('select[name="job"] > option:selected').val(); 
		
		var hobby = $('input[name="hobby"]:checked');
		var hobby_val = "";
		hobby.each(function(){ //each = 반복문
			hobby_val += $(this).val() + " "; //$(this) -> 반복문 안에서 hobby 안에 포함된 객체
		});
		
		var result = '<ul>';
		result += '<li>아이디 : ' + user_id + '</li>';
		result += '<li>비밀번호 : ' + user_pw + '</li>';
		result += '<li>주민번호 : ' + juminno + '</li>';
		result += '<li>성별 : ' + gender + '</li>';
		result += '<li>이메일 : ' + email + '</li>';
		result += '<li>홈페이지 : ' + url + '</li>';
		result += '<li>핸드폰 : ' + hpno + '</li>';
		result += '<li>취미 : ' + hobby_val + '</li>';
		result += '<li>직업 : ' + job + '</li>';
		result += '</ul>';
		
		$('body').html(result);
		
		//전송처리를 강제 종료
		return false;
	});
});