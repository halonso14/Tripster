	function loadScript() {
	    setTimeout(function (){
		  $('#map-canvas').css({'display':'block'});
		  var script = document.createElement('script');
		  script.type = 'text/javascript';
		  script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyCb1-Itd2i_3RlBDhbMBYhb9uL6V7HdX6g&callback=initialize';
		  document.body.appendChild(script);
		  
//		  google.maps.event.trigger(map, 'resize');
	    }, 500);	
	}