		$(document).ready(function($){
			function onBgresize() {
				var $gfwidth = window.innerWidth;
				var $gfheight = window.innerHeight;
				
				var $loginw = $('.register-wrap').width();
				var $loginh = $('.register-wrap').height();
				
				$('.register-fullwidith').css({'width': $gfwidth +'px', 'height': $gfheight +'px'});
				
				$('.register-wrap').css({'margin-left': $gfwidth/2-$loginw/2 +'px', 'margin-top': $gfheight/2-$loginh/2 +'px'});
				
			}
			onBgresize();
			$(window).resize(function() {
				onBgresize();
			});
		});		