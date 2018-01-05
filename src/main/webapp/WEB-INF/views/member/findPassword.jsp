<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-2.0.3.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/resources/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="/resources/js/messages_ko.min.js"></script>
	
    <title>비밀번호 찾기</title>

    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/findpassword.css" rel="stylesheet" media="screen">

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
    <!-- <script src="../resources/assets/js/jquery.v2.0.3.js"></script> -->




</head>
<body>
<!-- 100% Width & Height container  -->
<div class="findpassword-fullwidith">

	<form action="findPassword" method="post">
    <!-- findpassword Wrap  -->
    <div class="findpassword-wrap">
        <a href="/"><img src="/resources/images/logo.png" class="findpassword-img" alt="logo"/></a><br/>
        <div class="findpassword-c1">
            <div class="cpadding50">
                <input type="text" class="form-control logpadding" name="memberEmail" placeholder="이메일을 입력하세요">
            </div>
        </div>
        <div class="findpassword-c2">
            <div class="logmargfix">
                <div class="chpadding50">
                    <div class="alignbottom">
                        <button class="btn-search4" type="submit">비밀번호 찾기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="findpassword-c3">
            <div class="right"><a href="javascript:void();" class="whitelink" onclick="register();">회원가입</a></div>
        </div>
    </div>
    <!-- End of findpassword Wrap  -->
    </form>
    
    <script>
    	function register(){
    		window.close();
    		window.opener.top.location.href = "/member/register";
    	}
    </script>

</div>
<!-- End of Container  -->

	<script type="text/javascript">
	
	$(function(){
		
        $("form").validate({
            
            //규칙
            rules: {
            	memberEmail: {
                    required : true,
                    minlength : 2,
                    email : true,
                }
                
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
            	memberEmail: {
                    required : "이메일을 입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    email : "올바른 이메일 형식이 아닙니다.",
                }
            
            }
        });
})
	</script>
	
	<script>
	var result = '${msg}';
    if(result == 'fail'){
        alert("가입된 이메일이 아닙니다.");
    }
    
    if(result == 'success'){
    	alert("가입된 이메일로 임시비밀번호가 전송되었습니다.")
    	window.close();
    }
	</script>

<!-- Javascript  -->
<script src="/resources/assets/js/initialize-findpassword.js"></script>
<script src="/resources/assets/js/jquery.easing.js"></script>
<!-- Load Animo -->
<script src="/resources/plugins/animo/animo.js"></script>
<script>
    function errorMessage(){
        $('.login-wrap').animo( { animation: 'tada' } );
    }
</script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/dist/js/bootstrap.min.js"></script>
</body>
</html>