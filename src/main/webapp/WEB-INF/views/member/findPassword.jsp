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
<script type="text/javascript" src="../../../resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../../../resources/js/additional-methods.min.js"></script>
<script type="text/javascript" src="../../../resources/js/messages_ko.min.js"></script>

<title>회원가입</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>

	<form id="form" action="findPassword" method="post">
		<div>
			이메일<input type="text" name="memberEmail" id="memberEmail" placeholder="Email을 입력하세요"/>
		</div>
		
		<div class="row">
			<div>
				<button type="submit">비밀번호 찾기</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
	
	$(function(){
        $("form").validate({
            
            //규칙
            rules: {
            	memberEmail: {
                    required : true,
                    minlength : 2,
                    email : true
                }
                
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
            	memberEmail: {
                    required : "이메일을 입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    email : "올바른 이메일 형식이 아닙니다."
                }
        });
})

	</script>
	
</body>
</html>