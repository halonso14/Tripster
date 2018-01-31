//------------------------------
//SCROLL ANIMATIONS
//------------------------------	
	
	//initialize margin-top
	var jQueryih = jQuery(window).height();
	jQuery('.cst03').css({'marginTop': jQueryih + 'px' });
	

	jQuery(window).scroll(function(){            
		var jQueryiw = jQuery('body').innerWidth();

		/**/
		if(jQuery(window).scrollTop() != 0){
			jQuery('.mtnav2').stop().animate({top: '0px'}, 500);
			jQuery('.logo2').stop().animate({width: '50px',marginTop: '-13px'}, 100);
		}       
		else {
			 if ( jQueryiw < 992 ) {
				jQuery('.logo2').stop().animate({width: '108px',marginTop: '-13px'}, 100);	
			  }
			  else{
			   jQuery('.mtnav2').stop().animate({top: '30px'}, 500);
			   	jQuery('.logo2').stop().animate({width: '108px',marginTop: '-43px'}, 100);	
			  }
			
		}
		

		//Conditions
		if(jQuery(window).scrollTop() < jQueryih){
			jQuery('.navbar-wrapper3').addClass('navbar-fixed-top2');
			jQuery('.cst03').css({'marginTop': jQueryih + 'px' });
			
			
			//How long the first shrinked menu apears
			if(jQuery(window).scrollTop() > jQueryih-400 ){
				jQuery('.navbar-fixed-top2').stop().animate({top: '-60px'}, 500);
			}
			if(jQuery(window).scrollTop() < jQueryih-400){
				jQuery('.navbar-fixed-top2').stop().animate({top: '0px'}, 500);
			}


			//Swaps menu colors
			if(jQuery(window).scrollTop() < 800){
				jQuery('.navbar-wrapper3').removeClass('navbg');
				jQuery('.nav2').removeClass('navdark');
				jQuery('.nav2').addClass('navlight');				
			}
			if(jQuery(window).scrollTop() == 0){
				//jQuery('.navbar-wrapper3').removeClass('navbar-fixed-top2');
					
			}
		}     
		
		else {
			//If scroll top is bigger than screen shows second menu
			if(jQuery(window).scrollTop() > jQueryih){
				jQuery('.navbar-wrapper3').addClass('navbg');
				jQuery('.nav2').removeClass('navlight');
				jQuery('.nav2').addClass('navdark');
			}
			jQuery('.navbar-wrapper3').addClass('navbar-fixed-top2');
			jQuery('.navbar-fixed-top2').stop().animate({top: '0px'}, 500);
		
		}
		
		
		
		
		//Social
		if(jQuery(window).scrollTop() >= 0){
			jQuery('.social1').stop().animate({top:'0px'}, 100);
			
			setTimeout(function (){
				jQuery('.social2').stop().animate({top:'0px'}, 100);
			}, 100);
			
			setTimeout(function (){
				jQuery('.social3').stop().animate({top:'0px'}, 100);
			}, 200);
			
			setTimeout(function (){
				jQuery('.social4').stop().animate({top:'0px'}, 100);
			}, 300);
			
			setTimeout(function (){
				jQuery('.gotop').stop().animate({top:'0px'}, 200);
			}, 400);				
			
		}       
		else {
			setTimeout(function (){
				jQuery('.gotop').stop().animate({top:'100px'}, 200);
			}, 400);	
			setTimeout(function (){
				jQuery('.social4').stop().animate({top:'-120px'}, 100);				
			}, 300);
			setTimeout(function (){
				jQuery('.social3').stop().animate({top:'-120px'}, 100);		
			}, 200);	
			setTimeout(function (){
			jQuery('.social2').stop().animate({top:'-120px'}, 100);		
			}, 100);	

			jQuery('.social1').stop().animate({top:'-120px'}, 100);			

		}
		
		
	});	
	
	
	
		//Center searchfield
		//jQuery('.sboxpurple').addClass('searchvalign');
		
		var $ = jQuery.noConflict();
		
		$(document).ready(function(){
			function centerSearch(){
				var $sih = $(window).height();
				var $srcHeight = $('.searchcontainer').innerHeight();
				var $srcValign = $sih/2 - $srcHeight;
				
				$('.searchcontainer').css({'opacity': 0, 'marginTop' : $srcValign - 30  +'px'});

				setTimeout(function (){
					$('.searchcontainer').stop().animate({'opacity': 1, 'marginTop' : $srcValign  +'px'}, 1000);		
				
				}, 1500);
				
			}
			centerSearch();
			
			jQuery(window).resize(function() {
			
				setTimeout(function (){
					location.reload();
				}, 200);
			
				centerSearch();
			});
			


			
		});	
	
	