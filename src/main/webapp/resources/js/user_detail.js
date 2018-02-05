
//차트관련
var chartMap2;
/**Create the Google Map*/
var gmap;

//사용자가 선택한 국가들 저장하는 리스트
var selected_country_list=[];

//사용자가 선택한 도시들 저장하는 리스트
var selected_city_list=[];
//그동안 ajax로 받아온 국가리스트 
var selected_country_list_remember=[];
//마커리스트
var  marker_list=[];
//데이터
var city_data=[];

var rcm_url = 'http://ec2-13-125-75-105.ap-northeast-2.compute.amazonaws.com:8000/';
/**
 * Setup breaking points between amCharts and Google Maps
 */
AmCharts.amBreakLevel = 2;
AmCharts.amBreakLevelReturn = 2; // used to return from GMap
AmCharts.gBreakLevel = 5; //이 값보다 작으면 구글맵이 감춰진다.



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
            
        	//city_data = data;
        	//console.log(data);
            //구글맵에 도시 인포 뿌려주기
            if(url.match("/country")){
            
            	console.log(data);
            	  //추천 도시 데이터 마커. 한 위치당 하나의마커가 필요하므로 for문으로
            	  //marker_list =[] 전역으로 뺐음..
            		
            	var marker_list_size = marker_list.length;
            	console.log(marker_list_size);
            	  for(var i=0 ; i<data.length; i++){
            		  
            		  (function(i){ //i값을 제대로 넘겨주기 위한 클로저 처리
            			  
            			  var marker = new google.maps.Marker({
            				  position: {lat: data[i].fields.lat, lng: data[i].fields.lng},
            			      map: gmap,
            			      title: data[i].fields.name,
            			      animation: null
            			    });
            			  marker_list.push(marker);
            			  //정보창
            			  var infowindow = new google.maps.InfoWindow({
            				    content: "<div id='infowindow_contents'><h2 id='firstHeading' class='firstHeading'>"+data[i].fields.name+"</h2></div>"
            				    			+"<div><input type='button' id='choose"+data[i].pk+"' class='choose action-button' value='선택' ) />" //onclick=chosen("+data[i].pk+"
            				    			+"<input type='button' id='cancel"+data[i].pk+"' class='cancel action-button' value='취소' /></div>"
            				  });
            			  
            			  //마커 클릭하면 정보창 보이게.
            			  marker_list[i+marker_list_size].addListener('click', function() {
            				    infowindow.open(gmap, marker_list[i+marker_list_size]);
            				  	//console.log(marker_list[i]);

            				  	
            				  	//info window의 선택버튼눌렀을 경우 city_list에 도시번호 저장한다. 그리고 인포윈도우 닫음
            				  	$('#choose'+data[i].pk).on('click', function(){
            				  		
            				  		console.log('선택버튼 함수 안 ');
            				  		var index = selected_city_list.indexOf(data[i].pk); 
		            		    	if(index == -1){
		            		    		
		            		    		selected_city_list.push(data[i].pk);
	            						console.log(selected_city_list);
	            						toggleBounce(marker_list[i+marker_list_size]); //마커 애니메이션 효과
	            						
		            		    	}
            						$('#choose'+data[i].pk).off(); // 버튼에 연결되어있는 이벤트를 모두 삭제함. 이게 CLICK 함수 안에 설정되어 있는 거라 누를 때마다 연결되는 것 같다.
            						infowindow.close();
            							//선택한 도시의 마커색깔 바꿔주기
            						marker_list[i+marker_list_size].setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');
            						
            					});
            				  	
            				  	//info window의 취소버튼 눌렀을 경우 city_list에 도시번호 삭제한다. 그리고 인포윈도우 닫음
            				  	$('#cancel'+data[i].pk).on('click', function(){
            						
            						console.log('취소버튼 함수 안 ');
            						
		            		    			//만약 도시가 기록되어 있는데 사용자가 누르면 지워야 한다.
            						var index = selected_city_list.indexOf(data[i].pk); 
		            		    	if(index != -1){
		            		    				//이미 저장되어 있으면 삭제
		            		    		selected_city_list.splice(index,1);
	            						toggleBounce(marker_list[i+marker_list_size]); //마커 애니메이션 효과 없앰
		            		    	}
            						
            				  		console.log(selected_city_list);

            						$('#cancel'+data[i].pk).off();
            						infowindow.close();
            						marker_list[i+marker_list_size].setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');

            					});
            				  	
            				  });
            		  })(i);
            		  

            	  }
            	
            	  console.log(marker_list);
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
        		    	//console.log(event);
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
        		    		//mapData2.areas
        		    	}
     		        
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
    "areas": [
    {
	      "id": "AE",
	      "color": "#82d7cd"
	    },
	    {
		      "id": "AU",
		      "color": "#82d7cd"
		 },
		 {
		      "id": "BR",
		      "color": "#82d7cd"
		 },
		 {
		      "id": "CA",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "CN",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "DE",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "FR",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "ID",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "IN",
		      "color": "#ef2929"
		  },
		  {
		      "id": "IT",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "JP",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "KR",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "VN",
		      "color": "#82d7cd"
		  },
		  {
		      "id": "US",
		      "color": "#82d7cd"
		  }
    ]
  },
  "areasSettings": {
    "autoZoom": true,
    "selectedColor": "#0bff85"//초록색
  },
  "zoomControl": {
	"zoomControlEnabled": true,
    "bottom": 10,
    "right": 10
    /*,"zoomFactor":1*/
  },
  "autoDisplay": true,
  "listeners": [{
	    "event": "clickMapObject",
	    "method": function(event) {
	    	console.log(event);
	    	
	    		//그동안 한번도 안 부른 국가이면 AJAX로 데이터 불러온다.
	    	var index = selected_country_list_remember.indexOf(event.mapObject.id); 
	    	if(index == -1){
	    		console.log('selected_country_list_remember');
	    		console.log(selected_country_list_remember);
	    		selected_country_list_remember.push(event.mapObject.id);	
	    			//선택된 국가 도시 데이터 불러오기
		    	ajaxController(rcm_url+'country/'+ event.mapObject.id); 

	    	}
	    		
	    		//만약iso가 기록되어 있는데 사용자가 누르면 지워야 한다.
    			//누르면 추가, 눌렀는데 다시 누르면 제거
	    	var index = selected_country_list.indexOf(event.mapObject.id); 
	    	if(index == -1){
		    	console.log();		
	    			//사용자가 선택한 국가iso 저장
		    	selected_country_list.push(event.mapObject.id);
		    	//event.mapObject.color = "#D01781";//분홍색
		    	
		    	// update color in data
		    	var area  = chartMap2.getObjectById(event.mapObject.id);
		    	area.color = "#D01781";//분홍색
		    	area.colorReal = area.color;
		    	area.validate();
		    	
	    	}else{
	    			//이미 저장되어 있으면 삭제
	    		selected_country_list.splice(index,1);
	    		// update color in data
		    	var area  = chartMap2.getObjectById(event.mapObject.id);
		    	area.color = "#0bff85";//분홍색
		    	area.colorReal = area.color;
		    	area.validate();
		    	
	    		
	    	}
    	
	    	
	    	console.log('selected_country_list');	    	
	    	console.log(selected_country_list);
	    	//chartMap2.validateData();
	    }}
  	,{
	    "event": "zoomCompleted",
	    "method": function( event ) {
	
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

		
		        // switch to Google map
		        document.getElementById( "chartdiv_rcm" ).style.visibility = "hidden";
		        document.getElementById( "gmap" ).style.visibility = "visible";
		        google.maps.event.trigger(gmap, 'resize'); // 구글맵 갱신.
		        
	      }
	    }
  }]
} );

//구글맵 초기화
window.initGoogleMap=function(data) {
  gmap = new google.maps.Map( document.getElementById( 'gmap' ), {
    scrollwheel: true,
    
  } );
  

   
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

//구글마커 선택했을 시에 애니메이션 효과
var toggleBounce = function(marker) {
	
		console.log(marker.getAnimation());
	  if (marker.getAnimation() !== null) {
		  
		  marker.setAnimation(null);
	  } else {
		  marker.setAnimation(google.maps.Animation.BOUNCE);
	  }
	}