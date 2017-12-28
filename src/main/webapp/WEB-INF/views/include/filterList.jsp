<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>

<!-- Top wrapper -->
<div class="col-md-3 filters offset-0">

	
	<!-- TOP TIP -->
	<div class="filtertip">
		<div class="padding20">
			<p class="size13"><span class="size18 bold counthotel">53</span> Hotels starting at</p>
			<p class="size30 bold">$<span class="countprice"></span></p>
			<p class="size13">Narrow results or <a href="#">view all</a></p>
		</div>
		<div class="tip-arrow"></div>
	</div>

	<div class="bookfilters hpadding20">
			<div class="w50percent">
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
					<span class="hotel-ico"></span> Hotels
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					<span class="flight-ico"></span> Flights
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">
					<span class="suitcase-ico"></span> Vacations
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios4" value="option4">
					<span class="car-ico"></span> Cars
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios5" value="option5">
					<span class="cruise-ico"></span>Cruises
				  </label>
				</div>
			</div>
			
			<div class="w50percentlast">
				<p class="cstyle08">Packages:</p>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios6" value="option6">
					Flight+Hotel+Car
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios7" value="option7">
					Flight+Hotel
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios8" value="option8">
					Flight+Car
				  </label>
				</div>
				<div class="radio">
				  <label>
					<input type="radio" name="optionsRadios" id="optionsRadios9" value="option9">
					Hotel+Car
				  </label>
				</div>
			</div>	
			
			<div class="clearfix"></div><br/>
			
			<!-- HOTELS TAB -->
			<div class="hotelstab2 none">
				<span class="opensans size13">Where do you want to go?</span>
				<input type="text" class="form-control" placeholder="Greece">
				
				<div class="clearfix pbottom15"></div>
				
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Check in date</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Check in date</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker2" placeholder="mm/dd/yyyy"/>
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="room1" >
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 1</b></span><br/>
							
							<div class="addroom1 block"><a onclick="addroom2()" class="grey cpointer">+ Add room</a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right ohidden">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option selected>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right ohidden">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option>0</option>
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="room2 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 2</b></span><br/>
							<div class="addroom2 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom2()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option>2</option>
									  <option selected>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>		

				<div class="room3 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 3</b></span><br/>
							<div class="addroom3 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom3()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div><div class="clearfix"></div>
				<button type="submit" class="btn-search3">Search</button>
			</div>
			<!-- END OF HOTELS TAB -->
			
			<!-- FLIGHTS TAB -->
			<div class="flightstab2 none">
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Flying from</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">To</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>
				
				
				<div class="clearfix pbottom15"></div>
				
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Departing</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker3" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Returning</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker4" placeholder="mm/dd/yyyy"/>
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="room1" >
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13">Adult</span>
							<select class="form-control mySelectBoxClass">
							  <option>1</option>
							  <option selected>2</option>
							  <option>3</option>
							  <option>4</option>
							  <option>5</option>
							</select>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<span class="opensans size13">Child</span>
							<select class="form-control mySelectBoxClass">
							  <option>0</option>
							  <option selected>1</option>
							  <option>2</option>
							  <option>3</option>
							  <option>4</option>
							  <option>5</option>
							</select>
						</div>
					</div>
				</div><div class="clearfix"></div>
				<button type="submit" class="btn-search3">Search</button>
			</div>
			<!-- END OF FLIGHTS TAB -->
			
			<!-- VACATIONS TAB -->
			<div class="vacationstab2 none">
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Flying from</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13"><b>To</b></span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Check in date</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker7" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Check in date</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker8" placeholder="mm/dd/yyyy"/>
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="room1" >
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 1</b></span><br/>
							
							<div class="addroom1 block"><a onclick="addroom2()" class="grey cpointer">+ Add room</a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option selected>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option>0</option>
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="room2 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 2</b></span><br/>
							<div class="addroom2 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom2()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option>2</option>
									  <option selected>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>		

				<div class="room3 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 3</b></span><br/>
							<div class="addroom3 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom3()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div><div class="clearfix"></div>
				<button type="submit" class="btn-search3">Search</button>
			</div>
			<!-- END OF VACATIONS TAB -->
			
			<!-- CARS TAB -->
			<div class="carstab2 none">
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Picking up</span>
						<input type="text" class="form-control" placeholder="Airport, address">
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Dropping off</span>
						<input type="text" class="form-control" placeholder="Airport, address">
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Pick up date</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker5" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Hour</span>
						<select class="form-control mySelectBoxClass">
						  <option>12:00 AM</option>
						  <option>12:30 AM</option>
						  <option>01:00 AM</option>
						  <option>01:30 AM</option>
						  <option>02:00 AM</option>
						  <option>02:30 AM</option>
						  <option>03:00 AM</option>
						  <option>03:30 AM</option>
						  <option>04:00 AM</option>
						  <option>04:30 AM</option>
						  <option>05:00 AM</option>
						  <option>05:30 AM</option>
						  <option>06:00 AM</option>
						  <option>06:30 AM</option>
						  <option>07:00 AM</option>
						  <option>07:30 AM</option>
						  <option>08:00 AM</option>
						  <option>08:30 AM</option>
						  <option>09:00 AM</option>
						  <option>09:30 AM</option>
						  <option>10:00 AM</option>
						  <option selected>10:30 AM</option>
						  <option>11:00 AM</option>
						  <option>11:30 AM</option>
						  <option>12:00 PM</option>
						  <option>12:30 PM</option>								  
						  <option>01:00 PM</option>
						  <option>01:30 PM</option>
						  <option>02:00 PM</option>
						  <option>02:30 PM</option>
						  <option>03:00 PM</option>
						  <option>03:30 PM</option>
						  <option>04:00 PM</option>
						  <option>04:30 PM</option>
						  <option>05:00 PM</option>
						  <option>05:30 PM</option>
						  <option>06:00 PM</option>
						  <option>06:30 PM</option>
						  <option>07:00 PM</option>
						  <option>07:30 PM</option>
						  <option>08:00 PM</option>
						  <option>08:30 PM</option>
						  <option>09:00 PM</option>
						  <option>09:30 PM</option>
						  <option>10:00 PM</option>
						  <option>10:30 PM</option>
						  <option>11:00 PM</option>
						  <option>11:30 PM</option>								  
						</select>
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="room1" >
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13">Drop off date</span>
							<input type="text" class="form-control mySelectCalendar" id="datepicker6" placeholder="mm/dd/yyyy"/>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<span class="opensans size13">Hour</span>
							<select class="form-control mySelectBoxClass">
							  <option>12:00 AM</option>
							  <option>12:30 AM</option>
							  <option>01:00 AM</option>
							  <option>01:30 AM</option>
							  <option>02:00 AM</option>
							  <option>02:30 AM</option>
							  <option>03:00 AM</option>
							  <option>03:30 AM</option>
							  <option>04:00 AM</option>
							  <option>04:30 AM</option>
							  <option>05:00 AM</option>
							  <option>05:30 AM</option>
							  <option>06:00 AM</option>
							  <option>06:30 AM</option>
							  <option>07:00 AM</option>
							  <option>07:30 AM</option>
							  <option>08:00 AM</option>
							  <option>08:30 AM</option>
							  <option>09:00 AM</option>
							  <option>09:30 AM</option>
							  <option>10:00 AM</option>
							  <option selected>10:30 AM</option>
							  <option>11:00 AM</option>
							  <option>11:30 AM</option>
							  <option>12:00 PM</option>
							  <option>12:30 PM</option>								  
							  <option>01:00 PM</option>
							  <option>01:30 PM</option>
							  <option>02:00 PM</option>
							  <option>02:30 PM</option>
							  <option>03:00 PM</option>
							  <option>03:30 PM</option>
							  <option>04:00 PM</option>
							  <option>04:30 PM</option>
							  <option>05:00 PM</option>
							  <option>05:30 PM</option>
							  <option>06:00 PM</option>
							  <option>06:30 PM</option>
							  <option>07:00 PM</option>
							  <option>07:30 PM</option>
							  <option>08:00 PM</option>
							  <option>08:30 PM</option>
							  <option>09:00 PM</option>
							  <option>09:30 PM</option>
							  <option>10:00 PM</option>
							  <option>10:30 PM</option>
							  <option>11:00 PM</option>
							  <option>11:30 PM</option>		
							</select>
						</div>
					</div>
				</div><div class="clearfix"></div>
				<button type="submit" class="btn-search3">Search</button>
			</div>
			<!-- END OF CARS TAB -->
			
			<!-- CRUISE TAB -->
			<div class="cruisestab2 none">
				<div class="fullwidth">
					<span class="opensans size13">Going to</span>
					<select class="form-control mySelectBoxClass">
					  <option selected>Show all</option>
					  <optgroup label="Most Popular">
						  <option>Caribbean</option>
						  <option>Bahamas</option>
						  <option>Mexico</option>
						  <option>Alaska</option>
						  <option>Europe</option>
						  <option>Bermuda</option>
						  <option>Hawaii</option>
					  </optgroup>
					  <optgroup label="Other Destinations">
						  <option>Africa</option>
						  <option>Arctic/Antartctic</option>
						  <option>Asia</option>
						  <option>Australia/New Zealand</option>
						  <option>Central America</option>
						  <option>Cruise to Nowhere</option>
						  <option>Galapagos</option>
						  <option>Greenland/Iceland</option>
						  <option>Middle East</option>
						  <option>Pacific Coastal</option>
						  <option>Panama Canal</option>
						  <option>South Africa</option>
						  <option>South Pacific</option>
						  <option>Tahiti</option>
						  <option>Transatlantic</option>
						  <option>World Cruises</option>
					  </optgroup>
					</select>

					<div class="clearfix pbottom15"></div>
					
					<span class="opensans size13">Departure</span>
					<select class="form-control mySelectBoxClass">
					  <option selected>Show all</option>
					  <option>October 2013</option>
					  <option>November 2013</option>
					  <option>December 2013</option>
					  <option>January 2014</option>
					  <option>February 2014</option>
					  <option>March 2014</option>
					  <option>April 2014</option>
					  <option>May 2014</option>
					  <option>June 2014</option>
					  <option>July 2014</option>
					  <option>August 2014</option>
					  <option>September 2014</option>
					  <option>October 2014</option>
					  <option>November 2014</option>
					  <option>December 2014</option>
					</select>
				</div><div class="clearfix"></div>
				<button type="submit" class="btn-search3">Search</button>
			</div>
			<!-- END OF CRUISE TAB -->					
			
			
			<!-- FLIGHT+HOTEL+CAR TAB -->					
			<div class="flighthotelcartab2 none">
					
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Flying from</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">To</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>
					
				<div class="clearfix pbottom15"></div>
					
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Departing</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker13" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Returning</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker14" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="clearfix pbottom15"></div>
				
				<div class="room1" >
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 1</b></span><br/>
							
							<div class="addroom1 block"><a onclick="addroom2()" class="grey cpointer">+ Add room</a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right ohidden">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option selected>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right ohidden">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option>0</option>
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="room2 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 2</b></span><br/>
							<div class="addroom2 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom2()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option>2</option>
									  <option selected>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>		

				<div class="room3 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 3</b></span><br/>
							<div class="addroom3 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom3()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div><div class="clearfix"></div>
				<div class="center size10 ca03">! An economy car will be added to your search. (You may change your car options later.)</div>							
				<button type="submit" class="btn-search3">Search</button>
			</div>
			<!-- END OF FLIGHT+HOTE+CAR TAB -->
			
			
			<!-- FLIGHT+HOTEL TAB -->					
			<div class="flighthoteltab2 none">
			
				
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Flying from</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">To</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				

				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Departing</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker10" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Returning</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker9" placeholder="mm/dd/yyyy"/>
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="room1" >
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 1</b></span><br/>
							
							<div class="addroom1 block"><a onclick="addroom2()" class="grey cpointer">+ Add room</a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right ohidden">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option selected>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right ohidden">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option>0</option>
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="room2 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 2</b></span><br/>
							<div class="addroom2 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom2()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option>2</option>
									  <option selected>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>		

				<div class="room3 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 3</b></span><br/>
							<div class="addroom3 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom3()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>
				<button type="submit" class="btn-search3">Search</button>					
			</div>
			<!-- END OF FLIGHT+HOTE TAB -->					
			
			<!-- FLIGHT+CAR TAB -->					
			<div class="flightcartab2 none">
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Flying from</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">To</span>
						<input type="text" class="form-control" placeholder="City or airport">
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				

				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Departing</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker11" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Returning</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker12" placeholder="mm/dd/yyyy"/>
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="center size10 ca03">! An economy car will be added to your search. (You may change your car options later.)</div>
				<div class="clearfix"></div>
				<button type="submit" class="btn-search3">Search</button>										
			</div>
			<!-- END OF FLIGHT+CAR TAB -->		
			
			<!-- HOTEL+CAR TAB -->					
			<div class="hotelcartab2 none">
				
				<span class="opensans size13">Where do you want to go?</span>
				<input type="text" class="form-control" placeholder="Greece">
				
				<div class="clearfix pbottom15"></div>
				
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13">Check in date</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker15" placeholder="mm/dd/yyyy"/>
					</div>
				</div>

				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13">Check in date</span>
						<input type="text" class="form-control mySelectCalendar" id="datepicker16" placeholder="mm/dd/yyyy"/>
					</div>
				</div>
				
				<div class="clearfix pbottom15"></div>
				
				<div class="room1" >
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 1</b></span><br/>
							
							<div class="addroom1 block"><a onclick="addroom2()" class="grey cpointer">+ Add room</a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right ohidden">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option selected>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right ohidden">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option>0</option>
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="room2 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 2</b></span><br/>
							<div class="addroom2 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom2()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option>1</option>
									  <option>2</option>
									  <option selected>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>		

				<div class="room3 none">
					<div class="clearfix"></div><div class="line1"></div>
					<div class="w50percent">
						<div class="wh90percent textleft">
							<span class="opensans size13"><b>ROOM 3</b></span><br/>
							<div class="addroom3 block grey"><a onclick="addroom3()" class="grey cpointer">+ Add room</a> | <a onclick="removeroom3()" class="orange cpointer"><img src="/resources/images/delete.png" alt="delete"/></a></div>
						</div>
					</div>

					<div class="w50percentlast">	
						<div class="wh90percent textleft right">
							<div class="w50percent">
								<div class="wh90percent textleft left">
									<span class="opensans size13">Adult</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>							
							<div class="w50percentlast">
								<div class="wh90percent textleft right">
								<span class="opensans size13">Child</span>
									<select class="form-control mySelectBoxClass">
									  <option selected>0</option>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div><div class="clearfix"></div><br/>
				<div class="center size10 ca03">! An economy car will be added to your search. (You may change your car options later.)</div>
				<button type="submit" class="btn-search3">Search</button>						
			</div>
			<!-- END OF HOTEL+CAR TAB -->	

			
			
	</div>
	<!-- END OF BOOK FILTERS -->	
	
	<div class="line2"></div>
	
	<div class="padding20title"><h3 class="opensans dark">Filter by</h3></div>
	<div class="line2"></div>
	
	<!-- Star ratings -->	
	<button type="button" class="collapsebtn" data-toggle="collapse" data-target="#collapse1">
	  Star rating <span class="collapsearrow"></span>
	</button>

	<div id="collapse1" class="collapse in">
		<div class="hpadding20">
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="/resources/images/filter-rating-5.png" class="imgpos1" alt=""/> 5 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="/resources/images/filter-rating-4.png" class="imgpos1" alt=""/> 4 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="/resources/images/filter-rating-3.png" class="imgpos1" alt=""/> 3 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="/resources/images/filter-rating-2.png" class="imgpos1" alt=""/> 2 Stars
				</label>
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox"><img src="/resources/images/filter-rating-1.png" class="imgpos1" alt=""/> 1 Star
				</label>
			</div>	
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- End of Star ratings -->	
	
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
	<div id="collapse4" class="collapse in">
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
	<br/>
	<br/>
	
	
</div>
<!-- END OF FILTERS -->
<!-- /Top wrapper -->
