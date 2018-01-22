//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches
var data =[];
var count = 0; //index는 li 안에서만 쓸 수 있기 때문에 범용적으로 쓰기 위해 count 변수를 만들었다. count=다음 fieldset값, count-1: 현재 필드셋 값인듯
var memberID= 0;
$().ready(function(){
    
    //var user_id = /*window.location.protocol + "//" + window.location.host + "/" +*/ (window.location.pathname).split('/')[1];
    
    //get memberID first before get his/her detail info
    memberID = $('#memberID').val();
    console.log('#memberID:'+memberID);
    
    /*
    $.get("http://127.0.0.1:8000/research/"+memberID, function(data){
        console.log(data);
    });
    */
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

    	console.log(next_fs);
    	console.log(current_fs);
    	
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
	
	
	console.log(current_fs);
	console.log(next_fs);
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
    console.log(count);
    // add data to data object
    saveData();
    /*
     * var val;
    if(count==3){//  checkbox
        checklist=[];
        for(var i=0 ; i<6; i++){
            if($(':input:checkbox[name="q'+count+i+'"]').is(":checked")){
                checklist.push( $(':input:checkbox[name="q'+count+i+'"]').val());
            }
        }
        
        val=checklist;
        
    }else{
        val = $(':input:radio[name="q'+count+'"]:checked').val();
    }
    data[count]= val;
    console.log(JSON.stringify(data));
    
     */
    count++;
    
	//show the next fieldset
	next_fs.show(); 
	current_fs.hide();
	//hide the current fieldset with style
	/*
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});//animate
    */
    
});

$(".previous").click(function(){
    
    
    // add data to data object
	saveData();
	/*
    var val;
    if(count==3){//  checkbox
        checklist=[];
        for(var i=0 ; i<6; i++){
            if($(':input:checkbox[name="q'+count+i+'"]').is(":checked")){
                checklist.push( $(':input:checkbox[name="q'+count+i+'"]').val());
            }
        }
        
        val=checklist;
    }else if(count==11){//  blog url. textarea
         val= $("#q"+count).val();
        console.log(val);
    
    }else{
        val = $(':input:radio[name="q'+count+'"]:checked').val();
    }
        
    data[count]= val;
    console.log(JSON.stringify(data));
    */
    count--;
    
    //애니메이팅 설정이 프로그래스바 누르는 것과 버튼 누를 때 에러를 일으켜서 막아놓음 
	//if(animating) return false;
	//animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.hide();
	
	/*
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});*/
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
        data: JSON.stringify({user_id:memberID, age:"4", gender:"4"}),
        dataType: 'text/plain',
        crossDomain: true,
        success: function(){
            console.log("success");

        },
        error:function(){
            console.log("fail..");
            
            	//추천페이지를 안내하는 fieldset을 띄운다
        	
        	current_fs = $($(".previous").get(count-1)).parent();
        	next_fs = current_fs.next(); //그다음 fieldset 얻어옴
            console.log(next_fs);
            next_fs.show();
            current_fs.hide();
            
            	//설문질문 누르는 것을 막음.
            $("#progressbar li").off("click");
        },
        }).done(function() {
            $( this ).addClass( "done" );
            alert("done")
        });
	return false;
    
    
});


var saveData = function(){
	
	if(count==2 || count==7){//리스트형  
        checklist='';
        
        val=checklist;
        
    }else if(count==5 || count==6){//  blog url. textarea
             
    }else if(count==11){//  blog url. textarea
         val= $("#q"+count).val();
        console.log(val);
    
    }else{ //라디오박스형
        val = $(':input:radio[name="q'+count+'"]:checked').val();
    }
    data[count]= val;
    console.log(JSON.stringify(data));
	
};