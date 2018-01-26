<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- FILTERS -->
<div class="col-md-3 filters offset-0">
							
	<!-- TOP TIP -->
	<div class="offset-2">	
		<div class="tab">
			<form:form commandName="cri" action="result" method="GET">	
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="totalCnt" value="${cri.totalCnt}"/>
				<input type="hidden" name="contentsCnt" value="${cri.contentsCnt}"/>
				<input type="hidden" name="planCnt" value="${cri.planCnt}"/>
				<input type="hidden" name="memberCnt" value="${cri.memberCnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'total' }">active</c:if>" name="tab" value ="total" type="submit">
					<span class="hidetext">통합검색</span>&nbsp; <span class="badge indent0" >${cri.totalCnt}</span>
				</button>
			</form:form>	
			<form:form commandName="cri" action="contents" method="GET">
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="totalCnt" value="${cri.totalCnt}"/>
				<input type="hidden" name="contentsCnt" value="${cri.contentsCnt}"/>
				<input type="hidden" name="planCnt" value="${cri.planCnt}"/>
				<input type="hidden" name="memberCnt" value="${cri.memberCnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'contents' }">active</c:if>" name="tab" value ="contents" type="submit">
					<span class="hidetext">컨텐츠</span>&nbsp; <span class="badge indent0">${cri.contentsCnt}</span>
				</button>
			</form:form>	
			<form:form commandName="cri" action="plan" method="GET">
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="totalCnt" value="${cri.totalCnt}"/>
				<input type="hidden" name="contentsCnt" value="${cri.contentsCnt}"/>
				<input type="hidden" name="planCnt" value="${cri.planCnt}"/>
				<input type="hidden" name="memberCnt" value="${cri.memberCnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'plan' }">active</c:if>" name="tab" value ="plan" type="submit">
					<span class="hidetext">일정</span>&nbsp; <span class="badge indent0">${cri.planCnt}</span>
				</button>			
			</form:form>	
			<form:form commandName="cri" action="member" method="GET">
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="totalCnt" value="${cri.totalCnt}"/>
				<input type="hidden" name="contentsCnt" value="${cri.contentsCnt}"/>
				<input type="hidden" name="planCnt" value="${cri.planCnt}"/>
				<input type="hidden" name="memberCnt" value="${cri.memberCnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'member' }">active</c:if>" name="tab" value ="member" type="submit">
					<span class="hidetext">회원</span>&nbsp; <span class="badge indent0">${cri.memberCnt}</span>
				</button>
			</form:form>	
		</div>		
	</div>	

	
	
	
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
