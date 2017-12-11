<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<title>회원가입</title>
</head>
<body>

	<h1>회원가입</h1>

	<form name="form" action="registerPost" method="post">
		<div>
			이메일<input type="text" name="memberEmail" id="memberEmail" placeholder="Email을 입력하세요"/>
		</div>
		<div>
			<button type="button" id="repeatChk">중복확인</button>
		</div>
		<div>
			비밀번호<input type="password" name="memberPassword" id="memberPassword" placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			비밀번호확인<input type="password" name="memberPasswordChk" id="memberPasswordChk" placeholder="다시 입력하라고"/>
		</div>
		<div>
			닉네임<input type="text" name="memberName" id="memberName" placeholder="닉네임넣어라"/>
		</div>
		<div>
			생년월일<input type="date" name="memberBirthday" id="memberBirthday"/>
		</div>
		
		<div class="row">
			<div>
				<button type="submit" onclick="validate()">회원가입</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
	
		
	$(document).on('click','#repeatChk',function(){
		var memberEmail = $('#memberEmail').val()
	    $.ajax({
	        url:'/member/repeatChk',
	        type:'POST',
	        data: {'memberEmail' : memberEmail},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        dataType : "json",

	        success:function(data){
	            console.log("success")
	            alert(decodeURIComponent(data.msg))


	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){

	        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
	        	}
	    });
	});
	
	
		
		function validate(){
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			var email = document.form.memberEmail;
			var password = document.form.memberPassword;
			var passwordchk = document.form.memberPasswordChk;
			
			if(email.value == ""){
				alert("이메일 입력해라");
				email.focus();
				return false;
			}
			
			if(regex.test(email.value) === false){
				alert("잘못된 이메일 형식이란다");
				email.value="";
				email.focus();
				return false;
			}
			
			if(password.value.length<4){
				alert("비번 최소 4자리 ㅇㅇ");
				password.focus();
				password.select();
				return false;
			}
		        
			if(password.value != passwordchk.value){
				alert("비번 일치 ㄴㄴ");
				password.focus();
				password.select();
				return false;
			}
		}

	</script>
	
</body>
</html>