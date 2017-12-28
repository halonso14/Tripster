<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.0.3.js"></script>
<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/resources/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/resources/js/messages_ko.min.js"></script>

<title>회원정보 수정</title>

    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/register.css" rel="stylesheet" media="screen">
    <!-- Animo css-->
    <link href="/resources/plugins/animo/animate+animo.css" rel="stylesheet" media="screen">

    <link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>
    <!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/font-awesome.css" media="screen" />
    <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->

    <!-- Load jQuery -->
    <!-- <script src="assets/js/jquery.v2.0.3.js"></script> -->
</head>
<body>
<!-- 100% Width & Height container  -->
<div class="register-fullwidith">

    <form action="updateMember" method="post">
        <!-- Register Wrap  -->
        <div class="register-wrap">
            <a href="/"><img src="/resources/images/logo.png" class="register-img" alt="logo"/></a><br/>
            <div class="register-c1">
                <div class="cpadding50">
                    이메일<input type="text" class="form-control logpadding" name="memberEmail" id="memberEmail" value="${memberVO.memberEmail}" readonly="readonly"/>
                    <br/>
                    비밀번호<input type="password" class="form-control logpadding" name="memberPassword" id="memberPassword" placeholder="비밀번호를 입력하세요">
                    <br/>
                    비밀번호확인<input type="password" class="form-control logpadding" name="memberPasswordChk" id="memberPasswordChk" placeholder="비밀번호를 확인하세요">
                    <br/>
                    닉네임<input type="text" class="form-control logpadding" name="memberName" id="memberName" value="${memberVO.memberName}"/>
                    <br/>
                    성별<input type="text" class="form-control logpadding" name="memberSex" id="memberSex" value="${memberVO.memberSex}" readonly="readonly"/>
                    <br/>
                    생년월일<input type="date" class="form-control logpadding" name="memberBirthday" id="memberBirthday" value="<fmt:formatDate value="${memberVO.memberBirthday}" pattern="yyyy-MM-dd" />"/>
                </div>
            </div>
            <div class="register-c2">
                <div class="logmargfix">
                    <div class="chpadding50">
                        <div class="alignbottom">
                            <button class="btn-search4" onclick="cancel()"> 취  소 </button>
                        </div>
                        <div class="alignbottom2">
                            <button class="btn-search4"  type="submit" onclick="errorMessage()"> 수  정 </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="register-c3">
                
            </div>
        </div>
        <!-- End of Login Wrap  -->
    </form>

</div>
<!-- End of Container  -->

<!-- Javascript  -->
<script src="/resources/assets/js/initialize-registerpage.js"></script>
<script src="/resources/assets/js/jquery.easing.js"></script>
<!-- Load Animo -->
<script src="/resources/plugins/animo/animo.js"></script>
<script>

	function cancel(){
		event.preventDefault();
		history.go(-1);
	}

    function errorMessage(){
        $('.register-wrap').animo( { animation: 'tada' } );
    }
</script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/dist/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
        $("form").validate({
            
            //규칙
            rules: {
                memberPassword: {
                    required : true,
                    minlength : 4
                },
                memberPasswordChk: {
                    required : true,
                    minlength : 4,
                    equalTo : memberPassword
                },
                memberName: {
                    required : true,
                    minlength : 2
                },
                memberBirthday: {
                	required : true
                }
                
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
                memberPassword: {
                    required : "비밀번호를 입력하세요.",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                memberPasswordChk: {
                    required : "비밀번호를 다시 입력하세요.",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    equalTo : "비밀번호가 일치하지 않습니다."
                },
                memberName: {
                    required : "닉네임을 입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                memberBirthday: {
                	required : "생년월일을 입력하세요."
                }
                
            }
        });
})
	</script>

</body>
</html>