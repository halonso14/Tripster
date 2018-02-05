<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- TAB 5 -->		
		  
<div class="tab-pane" id="scrapList" style="padding: 20px 50px;">
	<div class="padding40 dark">
		<ul class="nav nav-tabs myTab2pos" id="myTab">
				<li onclick="restaurantList()" class="active"><a data-toggle="tab" href="#restaurant"><span class="reviews"></span><span class="hidetext">맛집</span>&nbsp;</a></li>
				<li onclick="placeList()" class=""><a data-toggle="tab" href="#place"><span class="maps"></span><span class="hidetext">관광지</span>&nbsp;</a></li>
		</ul>
		<div class="tab-content6">
			<!-- TAB 1 -->				
				<div id="restaurant" class="tab-pane fade active in">
					<span class="lblue size18">${memberVO.memberName}</span> <span class="dark size18">님이 스크랩한 맛집</span>
					<div class="line4"></div>
					<div id="scrap1" class=" offset-2"></div>		
				</div>
				
				<!-- TAB 2 -->
				<div id="place" class="tab-pane fade ">
					<span class="lblue size18">${memberVO.memberName}</span> <span class="dark size18">님이 스크랩한 관광지</span>
					<div class="line4"></div>
				    <div  id="scrap2" class=" offset-2"></div>
				</div>
		   </div>

   </div>
</div>
		  
		  
		  			  
		  <div class="tab-pane" id="scrapList">
	
			<div class="scrapList padding40">
			
				<ul class="nav nav-tabs" id="myTab">
					<li onclick="restaurantList()" class="active"><a data-toggle="tab" href="#restaurant"><span class="reviews"></span><span class="hidetext">Restaurant</span>&nbsp;</a></li>
					<li onclick="placeList()" class=""><a data-toggle="tab" href="#place"><span class="maps"></span><span class="hidetext">Place</span>&nbsp;</a></li>
					

				</ul>			
				
				<div class="line4" ></div>
				
				<div class="col-md-12 offset-0" >
				
					<!-- TAB 1 -->				
					<div id="restaurant" class="tab-pane fade active in">
					
						<div class="col-md-5 offset-0" id="scrap1">
						</div>		
						
						
						
						
					</div>
					
					<!-- TAB 2 -->
					<div id="place" class="tab-pane fade ">
					    <div class="col-md-5 offset-0" id="scrap2">
						</div>
					</div>
				
					
					
			
					<!-- 맛집 스크랩 리스트 -->
					<script id="restaurantTemplate" type="text/x-handlebars-template">
								
						<div class="scrapListBox ">
							<div class="scrapBox">
								<input type="hidden" id="scrapID" value="{{scrapID}}">
									
								<p class="scrapTumbnail col-md-5" style="background-image:url({{thumbnail}})"></p>	
								
								<p class="scrapInfo col-md-7">
									<span class="size14 label label-warning">{{category}}</span><br>
									<a class="scrapTitle dark" href="/contents/1/{{contentsID}}"><b>{{title}}</b></a>

									<button class="scrapBtn" value="{{scrapID}}" onclick="scrapDelete(this)">스크랩취소</button>
								</p>
								<div class="clearfix"></div>	
							</div>
						</div>
						
					</script>	
				
					
					<script>
						
						
						//맛집 리스트 불러오기
						function restaurantList(){
							
							$.getJSON('/scraplist/1',function(data){
								var random = 0;
								var str = "";
								function getData(list){
									if(list.contentsPhoto==""){
										random = list.categoryID % 10 +10;
										list.contentsPhoto ="/resources/images/contents/"+ random + ".jpg";
									}
									var scrapData = {
											scrapID : list.scrapID,
										    category : "맛집",
										    title : list.contentsTitle,
										    thumbnail : list.contentsPhoto,
										    contentsID : list.contentsID,
										   	created : list.created
									}
									return scrapData;
								}
								
								$(data).each(function(i,list){
									var source = $("#restaurantTemplate").html();
									var template = Handlebars.compile(source);
									
									str += template(getData(list));
								 });
								 
								 $("#scrap1").html(str);
								
							});
							
						}

						// 관광지 리스트 불러오기
						function placeList(){
							
							$.getJSON('/scraplist/2',function(data){
								var str = "";
								function getData(list){
									if(list.contentsPhoto==""){
										random = list.categoryID % 10 +20;
										list.contentsPhoto ="/resources/images/contents/"+ random + ".jpg";
									}
									var scrapData = {
											scrapID : list.scrapID,
										    category : "관광지",
										    title : list.contentsTitle,
										    thumbnail : list.contentsPhoto,
										    contentsID : list.contentsID,
										   	created : list.created
									}
									return scrapData;
								}
								
								$(data).each(function(i,list){
									var source = $("#restaurantTemplate").html();
									var template = Handlebars.compile(source);
									
									str += template(getData(list));
								 });
								 
								 $("#scrap2").html(str);
								
							});
							
						}

						// 스크랩 삭제
						function scrapDelete(data){
							var scrapID = data.value;
							$.post("/scrapIDremove/"+scrapID,function(data){
								alert(data);
								restaurantList();
							})
						}
						
					</script>
					
						
				</div>
			</div>

		  </div>
		  <!-- END OF TAB 5 -->	
	