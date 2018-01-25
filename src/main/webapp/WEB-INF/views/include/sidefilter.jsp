<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- FILTERS -->
<div class="col-md-3 filters offset-0">
									
	<!-- TOP TIP -->
	<div class="offset-2">	
		<div class="tab">	
			<button class="tablinks totalList active" onclick="more(event,'totalList')">
				<span class="hidetext">통합검색</span>&nbsp; 
				<span class="badge indent0" >${getNum.get("totalNum")}</span>
			</button>
			<button class="tablinks contentsList" onclick="more(event,'contentsList')">
				<span class="hidetext">컨텐츠</span>&nbsp;
				<span class="badge indent0">${getNum.get("contentsNum")}</span>
			</button>
			<button class="tablinks planList" onclick="more(event,'planList')">
				<span class="hidetext">일정</span>&nbsp; 
				<span class="badge indent0">${getNum.get("planNum")}</span>
			</button>
			<button class="tablinks memberList" onclick="more(event,'memberList')">
				<span class="hidetext">회원</span>&nbsp; 
				<span class="badge indent0">${getNum.get("memberNum")}</span>
			</button>
		</div>	
	</div>

	<script>
	
		function more(evt, tabName) {
		    // Declare all variables
		    var i, tabcontent, tablinks;
	
		    // Get all elements with class="tabcontent" and hide them
		    tabcontent = document.getElementsByClassName("tabcontent");
		    for (i = 0; i < tabcontent.length; i++) {
		    		tabcontent[i].className = tabcontent[i].className.replace(" active", "");
		    }
	
		    // Get all elements with class="tablinks" and remove the class "active"
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }
	
		    // Show the current tab, and add an "active" class to the link that opened the tab
		    document.getElementsByClassName(tabName)[0].className +=  " active";
		    document.getElementsByClassName(tabName)[1].className +=  " active";
		}
	</script>
		
	<c:if test="${tab =='contentsList'}"> ${tab} <script> more(event,'contentsList'); </script> </c:if>
	<c:if test="${tab =='planList'}"> ${tab}<script> more(event,'planList'); </script> </c:if>
	<c:if test="${tab =='memberList'}"> ${tab}<script> more(event,'memberList'); </script> </c:if>
	<c:if test="${tab =='totalList'}"> ${tab}<script> more(event,'totalList'); </script> </c:if>
		
	
	<div class="padding20title"><h3 class="opensans dark">Filter by</h3></div>
	<div class="line2"></div>
	
	<!-- Star ratings -->	
	<button type="button" class="collapsebtn" data-toggle="collapse" data-target="#collapse1">
	  Star rating <span class="collapsearrow"></span>
	</button>

	<div id="collapse1" class="collapse in">
		<div class="hpadding20">
<!-- 			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="images/filter-rating-5.png" class="imgpos1" alt=""/> 5 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="images/filter-rating-4.png" class="imgpos1" alt=""/> 4 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="images/filter-rating-3.png" class="imgpos1" alt=""/> 3 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="images/filter-rating-2.png" class="imgpos1" alt=""/> 2 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="images/filter-rating-1.png" class="imgpos1" alt=""/> 1 Star
				</label>
			</div>	 -->
		</div>
		<div class="clearfix"></div>
	</div><!-- End of Star ratings -->	
		
		
		<div class="line2"></div>
		
		<!-- Price range -->					
		<button type="button" class="collapsebtn" data-toggle="collapse" data-target="#collapse2">
		  Price range <span class="collapsearrow"></span>
		</button>
			
		<div id="collapse2" class="collapse in">
			<div class="padding20">
				<div class="layout-slider wh100percent">
					<span class="cstyle09"><input id="Slider1" type="slider" name="price" value="400;700" /></span>
				</div>
				<script type="text/javascript" >
				  jQuery("#Slider1").slider({ from: 100, to: 1000, step: 5, smooth: true, round: 0, dimension: "&nbsp;$", skin: "round" });
				</script>
			</div>
		</div>
		<!-- End of Price range -->	
		
		<div class="line2"></div>
		
		<!-- Acomodations -->		
		<button type="button" class="collapsebtn" data-toggle="collapse" data-target="#collapse3">
		  Acomodation type <span class="collapsearrow"></span>
		</button>				
		
		<div id="collapse3" class="collapse in">
			<div class="hpadding20">
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios2" id="Acomodation1" value="option1" checked>
					All
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios2" id="Acomodation2" value="option2">
					Hotel
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios2" id="Acomodation3" value="option3">
					Bed & Breakfast
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios2" id="Acomodation4" value="option4">
					Apartment
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios2" id="Acomodation5" value="option5">
					Condo
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios2" id="Acomodation6" value="option6">
					All-Inclusive Resort 
				  </label>
				</div>
			</div>	
			<div class="clearfix"></div>					
		</div>
		<!-- End of Acomodations -->
		
		<div class="line2"></div>
		
		<!-- Hotel Preferences -->
		<button type="button" class="collapsebtn last" data-toggle="collapse" data-target="#collapse4">
		  Hotel Preferences <span class="collapsearrow"></span>
		</button>	
		<div id="collapse4" class="collapse">
			<div class="hpadding20">
				<div class="checkbox">
					<label>
					  <input type="checkbox">High-speed Internet (41)
					</label>
				</div>
				<div class="checkbox">
					<label>
					  <input type="checkbox">Air conditioning (52)
					</label>
				</div>
				<div class="checkbox">
					<label>
					  <input type="checkbox">Swimming pool (55)
					</label>
				</div>
				<div class="checkbox">
					<label>
					  <input type="checkbox">Childcare (12)
					</label>
				</div>
				<div class="checkbox">
					<label>
					  <input type="checkbox">Fitness equipment (49)
					</label>
				</div>	
				<div class="checkbox">
					<label>
					  <input type="checkbox">Free breakfast (14)
					</label>
				</div>	
				<div class="checkbox">
					<label>
					  <input type="checkbox">Free parking (11)
					</label>
				</div>	
				<div class="checkbox">
					<label>
					  <input type="checkbox">Hair dryer (48)
					</label>
				</div>	
				<div class="checkbox">
					<label>
					  <input type="checkbox">Pets allowed (16)
					</label>
				</div>	
				<div class="checkbox">
					<label>
					  <input type="checkbox">Restaurant in hotel (47)
					</label>
				</div>	
				<div class="checkbox">
					<label>
					  <input type="checkbox">Room service (38)
					</label>
				</div>	
				<div class="checkbox">
					<label>
					  <input type="checkbox">Spa services on site (57) 
					</label>
				</div>	

			</div>
			<div class="clearfix"></div>						
		</div>	
		<!-- End of Hotel Preferences -->
		
		<div class="line2"></div>
		<div class="clearfix"></div>
		<br/>


</div>
	<!-- END OF FILTERS -->
