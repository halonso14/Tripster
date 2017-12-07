<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

	<h1>회원가입</h1>

	<form role="form" method="post">
		<div>
			이메일<input type="text" name="memberEmail" placeholder="Email을 입력하세요"/>
		</div>
		<div>
			비밀번호<input type="password" name="memberPassword" placeholder="비밀번호를 입력하세요"/>
		</div>
		<!-- <div>
			비밀번호확인<input type="password" name="memberPassword" placeholder="다시 입력하라고"/>
		</div> -->
		<div>
			닉네임<input type="text" name="memberName" placeholder="닉네임넣어라"/>
		</div>
		<div>
			생년월일<input type="date" name="memberBirthday"/>
		</div>
		
		<div class="row">
			<div>
				<button type="submit">회원가입</button>
			</div>
		</div>
	</form>

</body>
</html>