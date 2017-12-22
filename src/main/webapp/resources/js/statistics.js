//지도데이터 초기데이터
var mapData={
	    "map": "worldLow",
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
//일정별 통계(detail) 그래프 설정
var graphConfig = [{
	    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
	    "fillAlphas": 0.5,
	    "labelText": "[[value]]",
	    "lineAlpha": 0.3,
	    "title": "Man",
	    "type": "column",
	    "newStack": true,
	    "color": "#000000",
	    "valueField": "Man"
	  }, {
	    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
	    "fillAlphas": 0.8,
	    "labelText": "[[value]]",
	    "lineAlpha": 0.3,
	    "title": "Woman",
	    "type": "column",
	    "color": "#000000",
	    "valueField": "Woman"
	  }];
//일정관련 간단정보(brief) 그래프 초기데이
var chartData=[{
	        "plan": "Min",
	        "how_many":1,
	        "color": "#00c3ff"
	    }, 
	    {
	        "plan": "Max",
	        "how_many": 1,
	        "color": "#2A0CD0"
	    }, 
	    {
	        "plan": "Avg",
	        "how_many": 1,
	        "color": "#8A0CCF"
	}];
//일정별 성비, 나이 통계 초기데이터.
var chartDetailData=[	{
    "Ages": '10s',
    "Man": 0,
    "Woman": 0,
  }, {
    "Ages": '20s',
    "Man": 0,
    "Woman": 0,
  }, {
    "Ages": '30s',
    "Man": 0,
    "Woman": 0,
  }, {
    "Ages": 'over 40s',
    "Man": 0,
    "Woman": 0,
	  }];


var categoryAxis={
  "gridPosition": "start",
  "axisAlpha": 0,
  "gridAlpha": 0,
  "position": "left"
};

//차트관련
var chart;
var chartDetail;
var chartMap;

//서버 데이터 관련
var likeList;
var detailList;
var dashBrief;
var countryList;

AmCharts.ready( function() {
	 
	// 일정일수 통계------------------------------
	chart = new AmCharts.AmSerialChart();
	chart.dataProvider = chartData;
	chart.categoryField = "plan";
	var graph = new AmCharts.AmGraph();
	graph.valueField = "how_many";
	//graph.type = "line";
	graph.type = "column";
	//graph.fillAlphas = 0; // or delete this line, as 0 is default
	graph.fillAlphas=0.5,
	graph.bullet = "round";
	graph.lineColor = "#8d1cc6";
	graph.fillColorsField = "color",
	//console.log(graph);
	chart.addGraph(graph);
	chart.write( "chartdiv4" );
	console.log('차트만드는 안쪽');
	console.log(typeof(graph));
	/*
	var str = '';
	for(key in graph) {
		str += key+"="+graph[key]+"\n";
	}
	console.log(str);
	 */

	//detail charts------------------------------
	chartDetail = new AmCharts.AmSerialChart();
	chartDetail.dataProvider = chartDetailData;
	chartDetail.categoryField = "Ages";
	chartDetail.categoryAxis = categoryAxis;
	var graph2 = new AmCharts.AmGraph();
	graph2 = graphConfig[0];
	var graph3 = new AmCharts.AmGraph();
	graph3 = graphConfig[1];
	chartDetail.addGraph(graph2);
	chartDetail.addGraph(graph3);
	
	chartDetail.write( "chartdiv5" );
	console.log('차트만드는 안쪽2');
	
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

	
});

//ajax로 화면 데이터세팅
$(document).ready(function(){   
    //console.log(window.location.pathname);
    ajaxController('http://localhost:8080/dashboard/stat/1');
});

//ymmu ajax-------------------------------------------
var ajaxController= function(url){
    
    $.ajax({
        method: "GET",
        url: url,
        crossDomain: true,
        dataType: 'json',
        success: function(data){
            
            //data for stat page 
            if(url.match("/stat")){
            
            	var dashBrief = data.dashBrief;
                $('#numPlans').text(dashBrief.numOfPlans);
                $('#totalDays').text(dashBrief.totalDays);
                
                //console.log($('#numPlans').val());
                //console.log($('#totalDays').val());
                
                //plan days info--------------------------------
                chartData[0].how_many=dashBrief.minPlanDays;
                chartData[1].how_many=dashBrief.maxPlanDays;
                chartData[2].how_many=dashBrief.avgDays;
                chart.validateData();
                console.log(chartData[2].how_many);
            	/* DATA OBJECT 출력하기
	            	var str = '';
	            	for(key in data.dashBrief) {
	            		str += key+"="+data.dashBrief[key]+"\n";
	            	}
	            	console.log(str);
            	*/
                
                //data likeList-------------------------
                likeList = data.likeList;
                console.log(likeList);
                makeTable(likeList);
                
              //data detailList-------------------------
                detailList = data.detailList;
                console.log(detailList);
                //makeTable(detailList);
                

				//data countryList-------------------------
				countryList = data.countryList;
				console.log(countryList);
				var key=0;
				var count=0;
				while(key < countryList.length) {
					var str = '';
					var i= key;
					count++;
					console.log(countryList[i].visitedCountryISO);
					console.log(countryList[key].visitedCountryISO);

					while(i!=countryList.length && countryList[key].visitedCountryISO == (countryList[i].visitedCountryISO) ){
						str += countryList[i].plan_title+"</br>";
						i++;
					}
				      mapData.areas.push({
				          "id": countryList[key].visitedCountryISO,
				          "color": "#FACC2E",
				          "description": "<b>이 국가를 다녀온 일정:</b></br></br>" + str
				      }); 
				      key = i;
				  }
				  //console.log(countryList);
				  chartMap.validateData();
				  $('#numCountries').text(count); //방문국가수 업데이트
            }
        }
    }); 
} //ajaxfunction

//
$(function () {
	var $table = $('#table');

	$table.on('click-row.bs.table', function (field, value, row, $el) {
		console.log(value);
		//
		$('#likeAnalysis').text("일정 "+ value.plan_title+" 분석");
        
		var ages='';
		//이전에 들어가 있던 데이터 초기화

		(function(chartDetailData){
			
			console.log('전: '+chartDetailData);
			var limit = 0; // 필요한 데이터는 총 나이대별로 2개씩 최대 8개이므로 타이틀일치로 최대 8번을 돌면 for문을 멈춘다
			for(key in detailList){
				if(limit>8) break;
				if(detailList[key].plan_title == value.plan_title){
					limit++;
					switch(detailList[key].numAges_who_chose_plan_id){
						case '10s':
							saveDate(0, key,chartDetailData);
							break;
						case '20s':
							saveDate(1, key,chartDetailData);
							break;
						case '30s':
							saveDate(2, key,chartDetailData);
							break;
						case 'over 40s':
							saveDate(3, key,chartDetailData);
							break;
						default:
							break;
					}
				}//if 바깥
			}//for
				//window.open('https://github.com/wenzhixin/bootstrap-table/issues/1808', '_blank');
			//console.log(chartDetailData);
			chartDetail.dataProvider = chartDetailData; 
			chartDetail.validateData();
		})(chartDetailData=[{
		    "Ages": '10s',
		    "Man": 0,
		    "Woman": 0,
		  }, {
		    "Ages": '20s',
		    "Man": 0,
		    "Woman": 0,
		  }, {
		    "Ages": '30s',
		    "Man": 0,
		    "Woman": 0,
		  }, {
		    "Ages": 'over 40s',
		    "Man": 0,
		    "Woman": 0,
			  }]);
		
		
		chartDetail.validateData();
		//console.log(chartDetailData);
	});
});

var saveDate = function(num, key, chartDetailData){
	if(detailList[key].sex=="남")
		chartDetailData[num].Man = detailList[key].num;
	else
		chartDetailData[num].Woman = detailList[key].num;
	
};
//create plan Table---------------------
var makeTable = function(list){
    
	console.log('makeTable 안쪽');
	 $('#table').bootstrapTable({
	    columns: [{
	        field: 'plan_title',
	        title: 'Your plan title'
	    }, {
	        field: 'num',
	        title: 'Like'
	    }],
	    data: list
	 });     
}


//ymmu ajax-------------------------------------------
// svg path for target icon
var targetSVG = "M9,0C4.029,0,0,4.029,0,9s4.029,9,9,9s9-4.029,9-9S13.971,0,9,0z M9,15.93 c-3.83,0-6.93-3.1-6.93-6.93S5.17,2.07,9,2.07s6.93,3.1,6.93,6.93S12.83,15.93,9,15.93 M12.5,9c0,1.933-1.567,3.5-3.5,3.5S5.5,10.933,5.5,9S7.067,5.5,9,5.5 S12.5,7.067,12.5,9z";
// svg path for plane icon
var planeSVG = "M19.671,8.11l-2.777,2.777l-3.837-0.861c0.362-0.505,0.916-1.683,0.464-2.135c-0.518-0.517-1.979,0.278-2.305,0.604l-0.913,0.913L7.614,8.804l-2.021,2.021l2.232,1.061l-0.082,0.082l1.701,1.701l0.688-0.687l3.164,1.504L9.571,18.21H6.413l-1.137,1.138l3.6,0.948l1.83,1.83l0.947,3.598l1.137-1.137V21.43l3.725-3.725l1.504,3.164l-0.687,0.687l1.702,1.701l0.081-0.081l1.062,2.231l2.02-2.02l-0.604-2.689l0.912-0.912c0.326-0.326,1.121-1.789,0.604-2.306c-0.452-0.452-1.63,0.101-2.135,0.464l-0.861-3.838l2.777-2.777c0.947-0.947,3.599-4.862,2.62-5.839C24.533,4.512,20.618,7.163,19.671,8.11z";
/*
var map = AmCharts.makeChart( "chartdiv", {
  "type": "map",
  "theme": "none",
  "dataProvider": {
    "map": "worldLow",
    "zoomLevel": 3.5,
    "zoomLongitude": -20.1341,
    "zoomLatitude": 49.1712,

    "lines": [ {
      "latitudes": [ 51.5002, 50.4422 ],
      "longitudes": [ -0.1262, 30.5367 ]
    }, {
      "latitudes": [ 51.5002, 46.9480 ],
      "longitudes": [ -0.1262, 7.4481 ]
    }, {
      "latitudes": [ 51.5002, 59.3328 ],
      "longitudes": [ -0.1262, 18.0645 ]
    }, {
      "latitudes": [ 51.5002, 40.4167 ],
      "longitudes": [ -0.1262, -3.7033 ]
    }, {
      "latitudes": [ 51.5002, 46.0514 ],
      "longitudes": [ -0.1262, 14.5060 ]
    }, {
      "latitudes": [ 51.5002, 48.2116 ],
      "longitudes": [ -0.1262, 17.1547 ]
    }, {
      "latitudes": [ 51.5002, 44.8048 ],
      "longitudes": [ -0.1262, 20.4781 ]
    }, {
      "latitudes": [ 51.5002, 55.7558 ],
      "longitudes": [ -0.1262, 37.6176 ]
    }, {
      "latitudes": [ 51.5002, 38.7072 ],
      "longitudes": [ -0.1262, -9.1355 ]
    }, {
      "latitudes": [ 51.5002, 54.6896 ],
      "longitudes": [ -0.1262, 25.2799 ]
    }, {
      "latitudes": [ 51.5002, 64.1353 ],
      "longitudes": [ -0.1262, -21.8952 ]
    }, {
      "latitudes": [ 51.5002, 40.4300 ],
      "longitudes": [ -0.1262, -74.0000 ]
    } ],
    "images": [ {
      "id": "london",
      "svgPath": targetSVG,
      "title": "London",
      "latitude": 51.5002,
      "longitude": -0.1262,
      "scale": 1
    }, {
      "svgPath": targetSVG,
      "title": "Brussels",
      "latitude": 50.8371,
      "longitude": 4.3676,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Prague",
      "latitude": 50.0878,
      "longitude": 14.4205,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Athens",
      "latitude": 37.9792,
      "longitude": 23.7166,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Reykjavik",
      "latitude": 64.1353,
      "longitude": -21.8952,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Dublin",
      "latitude": 53.3441,
      "longitude": -6.2675,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Oslo",
      "latitude": 59.9138,
      "longitude": 10.7387,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Lisbon",
      "latitude": 38.7072,
      "longitude": -9.1355,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Moscow",
      "latitude": 55.7558,
      "longitude": 37.6176,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Belgrade",
      "latitude": 44.8048,
      "longitude": 20.4781,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Bratislava",
      "latitude": 48.2116,
      "longitude": 17.1547,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Ljubljana",
      "latitude": 46.0514,
      "longitude": 14.5060,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Madrid",
      "latitude": 40.4167,
      "longitude": -3.7033,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Stockholm",
      "latitude": 59.3328,
      "longitude": 18.0645,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Bern",
      "latitude": 46.9480,
      "longitude": 7.4481,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Kiev",
      "latitude": 50.4422,
      "longitude": 30.5367,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "Paris",
      "latitude": 48.8567,
      "longitude": 2.3510,
      "scale": 0.5
    }, {
      "svgPath": targetSVG,
      "title": "New York",
      "latitude": 40.43,
      "longitude": -74,
      "scale": 0.5
    } ]
  },

  "areasSettings": {
    "unlistedAreasColor": "#FFCC00",
    "unlistedAreasAlpha": 0.9
  },

  "imagesSettings": {
    "color": "#CC0000",
    "rollOverColor": "#CC0000",
    "selectedColor": "#000000"
  },

  "linesSettings": {
    "arc": -0.7, // this makes lines curved. Use value from -1 to 1
    "arrow": "middle",
    "color": "#CC0000",
    "alpha": 0.4,
    "arrowAlpha": 1,
    "arrowSize": 4
  },
  "zoomControl": {
    "gridHeight": 100,
    "draggerAlpha": 1,
    "gridAlpha": 0.2
  },

  "backgroundZoomsToTop": true,
  "linesAboveImages": true,
  
  "export": {
    "enabled": true
  }
} );
*/
var chart2 = AmCharts.makeChart( "chartdiv2", {
  "type": "pie",
  "theme": "light",
  "titles": [ {
    "text": "Visitors countries",
    "size": 17
  } ],
  "dataProvider": [ {
    "country": "United States",
    "visits": 7252
  }, {
    "country": "China",
    "visits": 3882
  }, {
    "country": "Japan",
    "visits": 1809
  }, {
    "country": "Germany",
    "visits": 1322
  }, {
    "country": "United Kingdom",
    "visits": 1122
  }, {
    "country": "France",
    "visits": 414
  }, {
    "country": "India",
    "visits": 384
  }, {
    "country": "Spain",
    "visits": 211
  } ],
  "valueField": "visits",
  "titleField": "country",
  "startEffect": "elastic",
  "startDuration": 2,
  "labelRadius": 15,
  "innerRadius": "50%",
  "depth3D": 10,
  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
  "angle": 15,
  "export": {
    "enabled": true
  }
} );
//-- rador -->
var chart3 = AmCharts.makeChart( "chartdiv3", {
  "type": "radar",
  "theme": "light",
  "dataProvider": [ {
    "country": "Czech Republic",
    "litres": 156.9
  }, {
    "country": "Ireland",
    "litres": 131.1
  }, {
    "country": "Germany",
    "litres": 115.8
  }, {
    "country": "Australia",
    "litres": 109.9
  }, {
    "country": "Austria",
    "litres": 108.3
  }, {
    "country": "UK",
    "litres": 99
  } ],
  "valueAxes": [ {
    "axisTitleOffset": 20,
    "minimum": 0,
    "axisAlpha": 0.15
  } ],
  "startDuration": 2,
  "graphs": [ {
    "balloonText": "[[value]] litres of beer per year",
    "bullet": "round",
    "lineThickness": 2,
    "valueField": "litres"
  } ],
  "categoryField": "country",
  "export": {
    "enabled": true
  }
} );

/*
var chart5 = AmCharts.makeChart( "chartdiv5", {
	  "type": "serial",
	  "theme": "dark",
	  "depth3D": 0,
	  "angle": 0,
	  "legend": {
	    "horizontalGap": 10,
	    "useGraphSettings": true,
	    "markerSize": 5
	  },
	  "dataProvider": [ {
	    "year": 2003,
	    "europe": 2.5,
	    "namerica": 2.5,
	  }, {
	    "year": 2004,
	    "europe": 2.6,
	    "namerica": 2.7,
	  }, {
	    "year": 2005,
	    "europe": 2.8,
	    "namerica": 2.9,
	  } ],
	  "valueAxes": [ {
	    "stackType": "regular",
	    "axisAlpha": 0,
	    "gridAlpha": 0
	  } ],
	  "graphs": [ {
	    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
	    "fillAlphas": 0.8,
	    "labelText": "[[value]]",
	    "lineAlpha": 0.3,
	    "title": "Europe",
	    "type": "column",
	    "color": "#000000",
	    "valueField": "europe"
	  }, {
	    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
	    "fillAlphas": 0.8,
	    "labelText": "[[value]]",
	    "lineAlpha": 0.3,
	    "title": "North America",
	    "type": "column",
	    "newStack": true,
	    "color": "#000000",
	    "valueField": "namerica"
	  } ],
	  "categoryField": "year",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "axisAlpha": 0,
	    "gridAlpha": 0,
	    "position": "left"
	  },
	  "export": {
	    "enabled": true
	  }

	} );
	
	var chartData_old={
    
    "type": "serial",
    "theme": "light",
    "marginRight": 70,
    
    "dataProvider": [{
        "plan": "on going",
        "how_many": 4,
        "color": "#00c3ff"
    }, 
    {
        "plan": "done",
        "how_many": 3,
        "color": "#2A0CD0"
    }, 
    {
        "plan": "?",
        "how_many": 2,
        "color": "#8A0CCF"
    }],
    
    "valueAxes": [{
        "axisAlpha": 0,
        "position": "left",
        "title": ""
    }],
    
    "startDuration": 1,
    "graphs": [{
        "balloonText": "<b>[[category]]: [[value]]</b>",
        "fillColorsField": "color",
        "fillAlphas": 0.9,
        "lineAlpha": 0.2,
        "type": "column",
        "valueField": "visits"
    }],
    
    "chartCursor": {
        "categoryBalloonEnabled": false,
        "cursorAlpha": 0,
        "zoomable": false
    },
    
    "categoryField": "plan",
    "categoryAxis": {
        "gridPosition": "start",
        "labelRotation": 45
    },
    
    "export": {
        "enabled": true
    }
};
*/
