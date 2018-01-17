
					  					  	
$(document).ready(function(){
	$("#memberPicture").click(function(){
		$("#input_img").click();
	});
});
					  	

var sel_file;
$(document).ready(function() {
    $("#input_img").on("change", fileChange);
});


function fileChange(e) {
	e.preventDefault();
	var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }
        sel_file = f;
        var reader = new FileReader();
        reader.onload = function(e) {
            $("#profileImg").attr("src", e.target.result);
        	$("#profileImg").css("height", "53px")
        	$("#profileImg").css("width", "53px")
        }
        reader.readAsDataURL(f);
    });
    var file = files[0]
    console.log(file)
    var formData = new FormData();
    formData.append("file", file);
		$.ajax({
    	url: '/uploadProfile',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			alert("프로필 이미지가 변경 되었습니다.")
		  }
		})
 		function checkImageType(fileName){
 			var pattern = /jpg$|gif$|png$|jpeg$/i;
 			return fileName.match(pattern);
 		}
 		function getOriginalName(fileName){
 			if(checkImageType(fileName)){
 				return;
 			}
 			var idx = fileName.indexOf("_") + 1 ;
 			return fileName.substr(idx);
 		}
 		function getImageLink(fileName){
 			if(!checkImageType(fileName)){
 				return;
 			}
 			var front = fileName.substr(0,12);
 			var end = fileName.substr(14);
 			return front + end;
 		}
}

	$(document).ready(function(){
  		$("#dropBtn").click(function(){
  			$("#delMember").click();
  		});
  	});
	
	$(document).ready(function(){
		$("#delMember").click(function(){
			if(!confirm("정말 탈퇴하시겠습니까?")){
				document.form.submit();
			}else{
				return;
			}
		})
	})
	
				  
					  
//<!-- 기본정보 변경 유효성 검사 -->			  

$(function() {
	$("#changeProfile").validate({
		//규칙
		rules : {
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


//<!-- 비밀번호 변경 유효성 검사 -->			  

$(function() {
	$("#chkPassword").validate({
		//규칙
		rules : {
			curMemberPassword : {
				required : true,
				minlength : 4,
				remote : "/member/passwordChk"
			},
			memberPassword : {
				required : true,
				minlength : 4
			},
			memberPasswordChk : {
				required : true,
				minlength : 4,
				equalTo : memberPassword
			}
		},
		//규칙체크 실패시 출력될 메시지
		messages : {
			curMemberPassword : {
				required : "기존 비밀번호를 입력하세요",
				minlength : "최소 {0}글자이상이어야 합니다",
				remote : "기존 비밀번호를 확인하세요."
			},
			memberPassword : {
				required : "비밀번호를 입력하세요.",
				minlength : "최소 {0}글자이상이어야 합니다"
			},
			memberPasswordChk : {
				required : "비밀번호를 다시 입력하세요.",
				minlength : "최소 {0}글자이상이어야 합니다",
				equalTo : "비밀번호가 일치하지 않습니다."
			}
		}
	});
})


//<!-- 컨트롤러에서 넘어오는 완료 메시지 -->

var result = '${msg}';
if(result == 'profile'){
    alert("기본정보 변경이 완료되었습니다.");
}
if(result == 'password'){
    alert("비밀번호 변경이 완료되었습니다.");
}
            
				  
