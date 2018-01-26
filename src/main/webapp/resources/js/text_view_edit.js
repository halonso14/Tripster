/*
 * 18/1/25 목
 * 버튼에 들어간 애니메이팅 설정 주석 모두 지움. backup 파일에 살아있다.
 * */

//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches
var data =[1,1,"",1,"0,7","20,100","",""];
var count = 0; //index는 li 안에서만 쓸 수 있기 때문에 범용적으로 쓰기 위해 count 변수를 만들었다. count=다음 fieldset값, count-1: 현재 필드셋 값인듯
var memberID= 0;
$().ready(function(){
    
    //get memberID first before get his/her detail info
    memberID = $('#memberID').val();
    console.log('#memberID:'+memberID);
    
});

$("#progressbar li").click(function(){
	
    console.log('index:'+$(this).index()); //ok
    console.log('count:'+count); //ok 다른 질문 누르기 바로 직전 index
    
    var index = $(this).index();
    var i= count;
    saveData();
    //자기자신을 다시 눌렀을 때는 밑의 작업을 할 필요가 없당
    //자기 자신을 다시 눌렀을 때가 아닐 때
    if(index!= count){
    	console.log('안으로 들어옴');
    	next_fs = $($(".next").get(index)).parent();
    	current_fs = $($(".next").get(count)).parent();

    	//console.log(next_fs);
    	//console.log(current_fs);
    	
    	if(index==7 || count==7){
            if(count==0)
                current_fs = $($(".next").get(count)).parent();
            else
                current_fs = $($(".previous").get(count-1)).parent();
            
            next_fs = $($(".previous").get(index-1)).parent();
    
        }
        //console.log(current_fs);
        next_fs.show();
        current_fs.hide();
        
        if(0>(index-count)){ //예를 들어 8번에서 4번으로 옮겼을 떄
            
            var i= count;
            while(i> index){ //현재 질문지 뒤의 질문리스트 들을 다 액티브로 바꾼다
                $("#progressbar li").eq(i).removeClass("active");
                i--;
            }
            
        }else if(0<(index-count)){ 
            var i= count;
            while(i<= index){
                $("#progressbar li").eq(i).addClass("active");
                i++;
            }
        }
        count=index; //count를 현재 인덱스로 맞춰준다
    }
	
});

$(".next").click(function(){
    console.log('check');
	//if(animating) return false;
	//animating = true;
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	
	//console.log(current_fs);
	//console.log(next_fs);
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
    //console.log(count);
    // add data to data object
    saveData();
    count++;
    
	//show the next fieldset
	next_fs.show(); 
	current_fs.hide();
	//hide the current fieldset with style
	
    
});

$(".previous").click(function(){
    
    
    // add data to data object
	saveData();
    count--;
    
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.hide();
	
	
});

$("#done").click(function(){

	console.log('done 함수 안쪽');
	//location.href = "http://127.0.0.1:8080/member/mypage";
	window.location.replace("http://127.0.0.1:8080/member/mypage");
});

$(".submit").click(function(){
    //last question data
    if(count==7){//  blog url. textarea
         //val= $(':input:text[name="q'+count+'"]').val();
        val= $("#q"+count).val();
        console.log(val);
        data[count]= val;
    }

    console.log(JSON.stringify(data));
    alert(JSON.stringify(data));
    
    $.ajax({
        url: "http://127.0.0.1:8000/research/"+memberID+"/insert",
        method:"POST",
        //data: JSON.stringify({user_id:memberID, age:"4", gender:"4"}),
        data: JSON.stringify(data),
        dataType: 'text',
        crossDomain: true,
        success: function(data){//error함수를 설정했더니 서버에서 보내는 값이 200이어도 계속 error함수로 넘어가서.. 그냥 success 함수로 data 확인하는걸로
        	console.log(data);
        	if(data == "saved"){
        		console.log("success");
	            	//추천페이지를 안내하는 fieldset을 띄운다
	        	
	        	current_fs = $($(".previous").get(count-1)).parent();
	        	next_fs = current_fs.next(); //그다음 fieldset 얻어옴
	            console.log(next_fs);
	            next_fs.show();
	            current_fs.hide();
	            
	            	//설문질문 누르는 것을 막음.
	            $("#progressbar li").off("click");

        	}else{
        		console.log("서버가 saved 문장을 안 보낸다.");
        	}
        	
        }/*,
        error:function(e){
            console.log("fail..");
            console.log("ERROR: ", e);
        },*/
        });/*.done(function() {
            $( this ).addClass( "done" );
            alert("done")
        })*/
	return false;
    
    
});


var saveData = function(){
	
	if(count==2){//국가와 도시 리스트 

    	country = selected_country_list.toString();
		console.log('val: '+ country);
		city = selected_city_list.toString();
		console.log('val: '+ city);
	
		data[count]= country;
		data[8]= city; //데이터의 가장 마지막에 넣어주었음
        
    }else if(count==5){// 0,10두 값만 
    	
    	console.log('count=5 안 ');
    	//user_datil.js 파일에 있는 선택국가리스트를 data에 저장한다
    		// 기본 /(요 안에)/ -> /\s/ : \s공백찾아라 -> /\s/gi: g는 검색된 모든 결과를 리턴, i는 대소문자 가리지마라
    		// /(패턴을 집어넣는다)/ 여기 같은 경우 0일 ~ 10일
    		// (알파벳+숫자+_ 조합)(공백)(알파벳+숫자+_ 조합 아닌애들)(공백)(알파벳+숫자+_ 조합) /(검색된 모든 결과를 리턴하시오(리턴값 리스트임))
    	//var pattern = /((d+)[일]\s~\s(d+)[일])+((d+)[만원]\s(\~)\s(d+)[만원])+$/;
    	val = $('.days').find('.tooltip-inner').text().split(" ");
    	console.log(val[0]+','+val[5]);
    	result = val[0]+','+val[5];
    	data[count]= result;
    	
    }else if(count==6){// 0,10두 값만 
    
    	val = $('.budg').find('.tooltip-inner').text().split(" ");
    	result = val[0]+','+val[5];
    	data[count]= result;
    	
    	
    }else if(count==7){//  blog url. textarea
         val= $("#q"+count).val();
        console.log(val);
        data[count]= val;
        
    }else{ //라디오박스형
        val = $(':input:radio[name="q'+count+'"]:checked').val();
        data[count]= val;
    }

	//데이터로 넘길 값들을 확인해본다. 나주에 막아야지.
    console.log(JSON.stringify(data));
	
};