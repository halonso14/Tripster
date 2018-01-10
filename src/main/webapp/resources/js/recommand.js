//지도데이터 초기데이터
var mapData2={
	    "map": "worldLow",
	    "getAreasFromMap": true, //추가
	    "areas": [{
	      "id": "US",
	      "color": "#8d1cc6",
	      "description": "United States is now selected.</br></br>Close this description box to unselect the area.",
	      "images": [{
	        "latitude": 40.712784,
	        "longitude": -74.005941,
	        "type": "circle",
	        "label": "New York"
	      }]
	    }]
	  };


//차트관련
var chartMap2;

//서버 데이터 관련
var rcmCountryList;

/**
 * Create the Google Map
 */
var gmap;

/**
 * Setup breaking points between amCharts and Google Maps
 */
AmCharts.amBreakLevel = 64;
AmCharts.amBreakLevelReturn = 32; // used to return from GMap
AmCharts.gBreakLevel = 8;

AmCharts.ready( function() {
	
	//map chart 2 for recommand-----
	chartMap2 = new AmCharts.AmMap();
	chartMap2.dataProvider = mapData2;
	chartMap2.projection = "eckert3";
	chartMap2.areasSettings = {
							    "autoZoom": true,
							    "selectedColor": "#CC0000"
							  };
	//예제에 있어서 넣긴했는데.
	chartMap2.zoomControl= {
							    "bottom": 10,
							    "right": 10
							};  
	
	
	
	chartMap2.addListener({
	    "event": "zoomCompleted",
	    "method": function( e ) {  //18/1/8 예제에 포함되어 있어 넣었음.

	        /**
	         * GMap inited?
	         */
	        if ( typeof gmap === "undefined" )
	          return;

	        if ( chartMap2.zoomLevel() >= AmCharts.amBreakLevel ) {

	          // sync position
	          gmap.setCenter( {
	            lat: chartMap2.zoomLatitude(),
	            lng: chartMap2.zoomLongitude()
	          } );

	          // set zoom level
	          gmap.setZoom( AmCharts.gBreakLevel );

	          // switch to Google map
	          document.getElementById( "chartdiv_rcm" ).style.visibility = "hidden";
	          document.getElementById( "gmap" ).style.visibility = "visible";
	        }
	  }}); //addToListener
		
	chartMap2.write("chartdiv_rcm");
	
});

//구글맵
function initGoogleMap() {
	  gmap = new google.maps.Map( document.getElementById( 'gmap' ), {
	    scrollwheel: true
	  } );

	  gmap.addListener( "zoom_changed", function() {
	    /**
	     * Switch back to amCharts
	     */
	    if ( gmap.getZoom() < AmCharts.gBreakLevel ) {

	      // sync position
	      var center = gmap.getCenter();
	      chartMap2.zoomToLongLat(
	        AmCharts.amBreakLevelReturn,
	        center.lng(),
	        center.lat(),
	        true
	      );

	      // switch to Google map
	      document.getElementById( "chartdiv_rcm" ).style.visibility = "visible";
	      document.getElementById( "gmap" ).style.visibility = "hidden";
	    }
	  } );
};

/**
 * Function which tries to convert between amCharts zoom level and Google's
 */
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
};

/**
 * Function which tries to convert between Google's zoom level and amCharts
 */
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
};


//ymmu ajax-------------------------------------------
// svg path for target icon
var targetSVG = "M9,0C4.029,0,0,4.029,0,9s4.029,9,9,9s9-4.029,9-9S13.971,0,9,0z M9,15.93 c-3.83,0-6.93-3.1-6.93-6.93S5.17,2.07,9,2.07s6.93,3.1,6.93,6.93S12.83,15.93,9,15.93 M12.5,9c0,1.933-1.567,3.5-3.5,3.5S5.5,10.933,5.5,9S7.067,5.5,9,5.5 S12.5,7.067,12.5,9z";
// svg path for plane icon
var planeSVG = "M19.671,8.11l-2.777,2.777l-3.837-0.861c0.362-0.505,0.916-1.683,0.464-2.135c-0.518-0.517-1.979,0.278-2.305,0.604l-0.913,0.913L7.614,8.804l-2.021,2.021l2.232,1.061l-0.082,0.082l1.701,1.701l0.688-0.687l3.164,1.504L9.571,18.21H6.413l-1.137,1.138l3.6,0.948l1.83,1.83l0.947,3.598l1.137-1.137V21.43l3.725-3.725l1.504,3.164l-0.687,0.687l1.702,1.701l0.081-0.081l1.062,2.231l2.02-2.02l-0.604-2.689l0.912-0.912c0.326-0.326,1.121-1.789,0.604-2.306c-0.452-0.452-1.63,0.101-2.135,0.464l-0.861-3.838l2.777-2.777c0.947-0.947,3.599-4.862,2.62-5.839C24.533,4.512,20.618,7.163,19.671,8.11z";



