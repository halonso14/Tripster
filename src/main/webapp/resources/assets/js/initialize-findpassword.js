		$(document).ready(function($){
			function onBgresize() {
				var $gfwidth = window.innerWidth;
				var $gfheight = window.innerHeight;
				
				var $loginw = $('.findpassword-wrap').width();
				var $loginh = $('.findpassword-wrap').height();
				
				$('.findpassword-fullwidith').css({'width': $gfwidth +'px', 'height': $gfheight +'px'});
				
				$('.findpassword-wrap').css({'margin-left': $gfwidth/2-$loginw/2 +'px', 'margin-top': $gfheight/2-$loginh/2 +'px'});
				
			}
			onBgresize();
			$(window).resize(function() {
				onBgresize();
			});
		});		