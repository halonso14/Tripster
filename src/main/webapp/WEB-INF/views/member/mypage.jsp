<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
 	<%@include file="/WEB-INF/views/include/header2.jsp" %>
    <h1>My Page</h1>
    	<div>
    		이메일 : ${memberVO.memberEmail}
    	</div>
    	<div>
    		닉네임 : ${memberVO.memberName}
    	</div>
    	<div>
    		성별 : ${memberVO.memberSex}
    	</div>
    	<div>
    		생일 : <fmt:formatDate value="${memberVO.memberBirthday}" pattern="yyyy-MM-dd" />
    	</div>
    	
    	<div>
    		<form id="profileForm">
					  	<input type = "file" id="input_img" >
					  </form>
					  
					  <script>
					  	/* function fileUpload(){
					  		$(document).ready(function(){
						  		console.log("아 좀 되라고");
						  		$("#input_img").click();
					  			
					  		})
					  	} */
					  	
					  	$(document).ready(function(){
					  		console.log("찍혀라");
					  		$("#memberPic").click(function(){
					  			console.log("제발");
					  			$("#input_img").click();
					  		});
					  	});
					  	
					  </script></br>
					  <div class="col-md-4 offset-0">
							<img src="/resources/images/user.png" alt="" class="left margright20" id="profileImg"/>
							<p class="pic size12 grey margtop10">
							안녕하세요 <span class="lred">${memberVO.memberName}님</span><br/>
							<!-- <a href="javascript:void(0)" class="lblue" id="memberPicture">프로필 사진 변경</a> -->
							<button class="lblue" id="memberPic">프로필 사진 변경</button>
							</p>
							<div class="clearfix"></div>
						  </div>
    	</div>
    	
    	<div>
    		<form action="/member/updateMember" method="get">
    			<button id="modifyBtn">회원정보 수정</button>
    		</form>
    		
    		<form action="/member/dropMember" method="post">
            	<button type="submit" id="dropBtn">회원 탈퇴</button>
    		</form>
    	</div>
    	
    	
    <script>
	var result = '${msg}';
	
	if(result == 'success'){
		alert("회원정보 수정이 완료되었습니다.");
	}
	</script>
	

</body>
</html>
