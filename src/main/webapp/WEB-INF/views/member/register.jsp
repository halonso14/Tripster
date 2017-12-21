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
<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/resources/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/resources/js/messages_ko.min.js"></script>
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
    <!-- <script src="/resources/assets/js/jquery.v2.0.3.js"></script> -->

<title>회원가입</title>
</head>
<body>
<!-- 100% Width & Height container  -->
<div class="register-fullwidith">

    <form role="form" action="registerPost" method="post">
        <!-- Register Wrap  -->
        <div class="register-wrap">
            <a href="/"><img src="/resources/images/logo.png" class="register-img" alt="logo"/></a><br/>
            <div class="register-c1">
                <div class="cpadding50">
                    이메일<input type="text" class="form-control logpadding" name="memberEmail" id="memberEmail" placeholder="Email을 입력하세요">
                    <br/>
                    비밀번호<input type="password" class="form-control logpadding" name="memberPassword" id="memberPassword" placeholder="비밀번호를 입력하세요">
                    <br/>
                    비밀번호확인<input type="password" class="form-control logpadding" name="memberPasswordChk" id="memberPasswordChk" placeholder="비밀번호를 확인하세요">
                    <br/>
                    닉네임<input type="text" class="form-control logpadding" name="memberName" id="memberName" placeholder="닉네임을 입력하세요">
                    <br/>
                    성별
                    <div class="form-control">
                    남<input type="radio" class="radio-inline" name="memberSex" id="male" value="남자" checked="checked">
                    여<input type="radio" class="radio-inline" name="memberSex" id="female" value="여자">
                    </div>
                    <br/>
                    생년월일<input type="date" class="form-control logpadding" name="memberBirthday" id="memberBirthday">
                </div>
            </div>
            <div class="register-c2">
                <div class="logmargfix">
                    <div class="chpadding50">
                        <div class="alignbottom">
                            <button class="btn-search4" onclick="cancel()"> 취  소 </button>
                        </div>
                        <div class="alignbottom2">
                            <button class="btn-search4" type="submit" onclick="errorMessage()">회원가입</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="register-c3">
                
            </div>
        </div>
        <!-- End of Register Wrap  -->
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
	
	/* $(document).on('click','#repeatChk',function(){
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
	}); */
	
	$(function(){
		
        $("form").validate({
            
            //규칙
            rules: {
            	memberEmail: {
                    required : true,
                    minlength : 2,
                    email : true,
                    remote : "/member/repeatChk"
                },
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
            	memberEmail: {
                    required : "이메일을 입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    email : "올바른 이메일 형식이 아닙니다.",
                    remote : "중복된 이메일입니다."
                },
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