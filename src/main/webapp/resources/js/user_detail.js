
//차트관련
var chartMap2;
/**Create the Google Map*/
var gmap;

//사용자가 선택한 국가들 저장하는 리스트
var selected_country_list=[];

/**
 * Setup breaking points between amCharts and Google Maps
 */
AmCharts.amBreakLevel = 5;
AmCharts.amBreakLevelReturn = 2; // used to return from GMap
AmCharts.gBreakLevel = 5; //이 값보다 작으면 구글맵이 감춰진다.


//amcharts 세팅함수
AmCharts.ready( function() {
/*	 
	//map chart---------------------------------
	chartMap = new AmCharts.AmMap();
	chartMap.dataProvider = mapData;
	chartMap.projection = "eckert3";
	chartMap.areasSettings = {
							    "autoZoom": true,
							    "selectedColor": "#CC0000"
							  };
	  
	chartMap.addListener({
	    "event": "descriptionClosed",
	    "method": function(ev) {
	      ev.chart.selectObject();
	    }
	  });
	chartMap.write("chartdiv");
*/
});


//화면 데이터세팅
$(document).ready(function(){   
		
	$("#budget").slider({
		min:0,
		max:1000,
		step:1,
		range: true,
		value:[200,300],
		unit: " 만원"
	});
	
	$("#how_many_days").slider({
		min:0,
		max:100,
		step:1,
		range: true,
		value:[0,10],
		unit: " 일"
	});
	
});


//ymmu ajax-------------------------------------------
var ajaxController= function(url){
    
	console.log(url);
    $.ajax({
        method: "GET",
        url: url,
        crossDomain: true,
        dataType: 'json',
        success: function(data){
            
        	console.log(data);
            //구글맵에 도시 인포 뿌려주기
            if(url.match("/country")){
            
            	//console.log(data);
            	  //추천 도시 데이터 마커. 한 위치당 하나의마커가 필요하므로 for문으로
            	  marker_list =[]
            	  for(var i=0 ; i<data.length-1; i++){
            		  
            		  (function(i){ //i값을 제대로 넘겨주기 위한 클로저 처리
            			  
            			  var marker = new google.maps.Marker({
            			      //position: {lat: -25.363, lng: 131.044},
            				  position: {lat: data[i].fields.lat, lng: data[i].fields.lng},
            			      map: gmap,
            			      title: data[i].fields.name
            			    });
            			  marker_list.push(marker);
            			  //정보창
            			  var infowindow = new google.maps.InfoWindow({
            				    content: "<div id='contents'><h2 id='firstHeading' class='firstHeading'>"+data[i].fields.name+"</h2></div>"
            				    			+"<div><input type='button' id='choose"+data[i].pk+"' class='choose action-button' value='선택' />"
            				    			+"<input type='button' id='cancel"+data[i].pk+"' class='cancel action-button' value='취소' /></div>"
            				  });
            			  
            			  //마커 클릭하면 정보창 보이게.
            			  marker_list[i].addListener('click', function() {
            				    infowindow.open(gmap, marker_list[i]);
            	        			//국가/도시정보 세팅
            	            	$('#fligh_price_ymmu').text('KRW '+data[i].flight_price);
            	            	$('#exchange_ymmu').text(data[i].exchange);
            	            	$('#airport_ymmu').text(data[i].airport);
            	            	$('#safe_ymmu').text(data[i].safe);
            	            	
            				  });
            		  })(i);
            		  
            	  }
            	

            }
            else if(url.match("/recommand")){ //추천페이지 데이터 바인딩

            	console.log('추천데이터 ajax 데이터부분');
            	console.log(data);
            		//구글맵 세팅.
            	initGoogleMap(data);
            	
            	    //추천국가 amcharts에 색깔 표시
            	chartMap2.dataProvider.areas= [];
            	for(var i=data.length-1; i>-1;i--){
            	
            		if(typeof data[i].iso2 == 'undefined'){
            			console.log('여기서 끝남:'+i)
            			break;
            		} //undefined 나오는 순간 for문 브레이크
            		else{
                			chartMap2.dataProvider.areas.push({
		          			      "id": data[i].iso2,
		        			      "color": "#8d1cc6"
		        			 });
            		}	
            	}//for
            	
            	//amchart에 추천 국가 눌렀을 때 그 나라 데이터 바인딩 되도록 세팅
            	chartMap2.listeners.push({
        		    "event": "clickMapObject",
        		    "method": function(event) {
        		    	console.log(event);
        		    	//console.log(event.mapObject.id);
        		    	
        		    			//만약iso가 기록되어 있는데 사용자가 누르면 지워야 한다.
        		    			//누르면 추가, 눌렀는데 다시 누르면 제거
        		    	var index = selected_country_list.indexOf(event.mapObject.id); 
        		    	if(index == -1)
        		    				//사용자가 선택한 국가iso 저장
            		    	selected_country_list.push(event.mapObject.id);
        		    	else{
        		    				//이미 저장되어 있으면 삭제
        		    		selected_country_list.splice(index,1);
        		    		mapData2.areas
        		    	}
        		    				
        		    	/*
        		    	for(var i=data.length-1; i>-1;i--){
        	            	
                    		if(typeof data[i].iso2 == 'undefined'){
                    			break;
                    		} //undefined 나오는 순간 for문 브레이크
                    		else if(data[i].iso2 == event.mapObject.id){
                    			 $('.description_title').text(data[i].name_han+' '+data[i].name_eng); //지도서 클릭한 나라 이름
                    			 $('.country_or_city_description').text(data[i].description); //지도서 클릭한 나라 소개
                    			 $('#exchange_ymmu').html('<br>1'+data[i].money_unit+' = '+ data[i].exchange+'원<br>'+'10'+data[i].money_unit+' = '+ data[i].exchange*10+'원<br>'); //지도서 클릭한 나라 환율
                    			 $('#safe_ymmu').html(data[i].safe+'<br>'); //지도서 클릭한 나라 환율
                    			 $('#bigmac_ymmu').html('약 '+data[i].bigmac_price+data[i].money_unit+'<br><br>'+'<b>US달러 가격</b><br>'+data[i].bigmac_price_dallor); //지도서 클릭한 나라 환율
                    			 $('#country_or_city_title_image').attr('src', '/resources/images/'+data[i].iso2+'_main.jpg');
                    		
                    			 	//관련 국가를 다녀가는 일정
                    			 ajaxController("/rcm/"+data[i].iso2);
                    		
                    		
                    		}	
                    	}//for
        		    	*/

        		    	
        		        // GMap inited?
        		        if ( typeof gmap === "undefined" )
        		          return;
        		    	// sync position
        		        gmap.setCenter( {
        		          lat: chartMap2.zoomLatitude(),
        		          lng: chartMap2.zoomLongitude()
        		        } );
        		        //console.log('zoomlevel:'+chartMap2.zoomLevel());
        		        
        		        google.maps.event.trigger(gmap, 'resize'); // 구글맵 갱신.
        		        
        		    }
        		  });
            	
            }//else if
            else if(url.match("/rcm")){ //
            	
            	console.log("/rcm 들어옴");
            	var planList = data.planList;
            		
            		//슬라이드 갱신 필요
            	$('.related-plan-list').slick('removeSlide',null,null, true);
            	console.log('슬라이드 갱신');
            	//$('.related-plan-list').slick(getSliderSettings());
            		//관련일정 slick에 달아줌
            	bindingPlanListToSlick(planList);
            	
            }
        }//success

    }); 
    
} //ajaxfunction


//링크처리 함수
var goto = function(url){
	
	location.href = url;
};



/**
 * Create the amCharts Map
 */
var chartMap2 = AmCharts.makeChart( "chartdiv_rcm", {
  "type": "map",
  "theme": "light",
  "projection": "eckert3",
  "dataProvider": {
    "map": "worldLow",
    "getAreasFromMap": true,
    "areas": []
  },
  "areasSettings": {
    "autoZoom": true,
    "selectedColor": "#0bff85"
  },
  "zoomControl": {
	"zoomControlEnabled": true,
    "bottom": 10,
    "right": 10
    /*,"zoomFactor":1*/
  },
  "listeners": [{
	    "event": "clickMapObject",
	    "method": function(event) {
	    	console.log(event);
    			//만약iso가 기록되어 있는데 사용자가 누르면 지워야 한다.
    			//누르면 추가, 눌렀는데 다시 누르면 제거
	    	var index = selected_country_list.indexOf(event.mapObject.id); 
	    	if(index == -1){
	    				//사용자가 선택한 국가iso 저장
		    	selected_country_list.push(event.mapObject.id);
		    	event.mapObject.color = "#D01781";
		    	/*
		    	chartMap2.dataProvider.areas.push({
				      "id": event.mapObject.id,
				      "color": "#D01781"
				 });
		    	 */
		    	//추천데이터. 크로스도메인 설정됨
		    	ajaxController('http://127.0.0.1:8000/country/'+ event.mapObject.id);

		    	
	    	}else{
	    			//이미 저장되어 있으면 삭제
	    		selected_country_list.splice(index,1);
	    		event.mapObject.color = "#67b7dc";
	    		
	    	}
	    	console.log(selected_country_list);
	    	chartMap2.validateData();
	    }}
  	,{
	    "event": "zoomCompleted",
	    "method": function( e ) {
	
	      // GMap inited?
	      if ( typeof gmap === "undefined" )
	        return;

	     if ( chartMap2.zoomLevel() >= AmCharts.amBreakLevel ) {
		        // sync position
		        gmap.setCenter( {
		          lat: chartMap2.zoomLatitude(),
		          lng: chartMap2.zoomLongitude()
		        } );
		        console.log('after gmap -> setCenter');
		        console.log('chartMap2 zoomlevel:'+chartMap2.zoomLevel());
		        // set zoom level
		        gmap.setZoom( AmCharts.gBreakLevel );
		        //gmap.setZoom(chartMap2.zoomLevel());
		        //console.log('gmap.getCenter: '+gmap.getZoom());
		
		        // switch to Google map
		        document.getElementById( "chartdiv_rcm" ).style.visibility = "hidden";
		        document.getElementById( "gmap" ).style.visibility = "visible";
		        google.maps.event.trigger(gmap, 'resize'); // 구글맵 갱신.
	      }
	    }
  }]
} );


window.initGoogleMap=function(data) {
  gmap = new google.maps.Map( document.getElementById( 'gmap' ), {
    scrollwheel: true,
    
  } );
  

  /*
  //추천 도시 데이터 마커. 한 위치당 하나의마커가 필요하므로 for문으로

  marker_list =[]
  for(var i=0 ; i<data.length-2; i++){
	  
	  (function(i){ //i값을 제대로 넘겨주기 위한 클로저 처리
		  
		  var marker = new google.maps.Marker({
		      //position: {lat: -25.363, lng: 131.044},
			  position: {lat: data[i].lat, lng: data[i].lng},
		      map: gmap,
		      title: data[i].name
		    });
		  marker_list.push(marker);
		  //정보창
		  var infowindow = new google.maps.InfoWindow({
			    content: "<div id='contents'><h1 id='firstHeading' class='firstHeading'>"+data[i].name+"</h1></div>"
			  });
		  
		  //마커 클릭하면 정보창 보이게.
		  marker_list[i].addListener('click', function() {
			    infowindow.open(gmap, marker_list[i]);
            	
			  });
	  })(i);
	  
  }
*/
  
  gmap.addListener( "zoom_changed", function() {
    /**Switch back to amCharts*/
    if ( gmap.getZoom() < AmCharts.gBreakLevel ) {

      // sync position
      var center = gmap.getCenter();
      chartMap2.zoomToLongLat(
        AmCharts.amBreakLevelReturn,
        center.lng(),
        center.lat(),
        true
      );
      console.log('gmap.addListener: '+ center);
      // switch to Google map
      document.getElementById( "chartdiv_rcm" ).style.visibility = "visible";
      document.getElementById( "gmap" ).style.visibility = "hidden";
      //console.log(gmap);
    }
  } );
}


/** Function which tries to convert between amCharts zoom level and Google's */
function amZoomLevelToGoogle( level ) {

  // round
  level = Math.round( level );
  var newLevel = Math.round( Math.sqrt( level ) );

  // find a zoom level
  AmCharts.zoomLevels.forEach( function( zoomLevel ) {
    if ( level >= zoomLevel.am )
      newLevel = zoomLevel.g;
  } );
  return newLevel;
}

/** Function which tries to convert between Google's zoom level and amCharts */
function gZoomLevelToAm( level ) {

  // round
  level = Math.round( level );
  var newLevel = Math.round( Math.sqrt( level ) );

  // find a zoom level
  AmCharts.zoomLevels.forEach( function( zoomLevel ) {
    if ( level >= zoomLevel.g )
      newLevel = zoomLevel.am;
  } );
  return newLevel;
}

//
var chosen= function(iso2){
	
}
