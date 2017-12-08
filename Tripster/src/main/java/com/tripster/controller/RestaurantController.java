package com.tripster.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tripster.domain.Criteria;
import com.tripster.domain.PageMaker;
import com.tripster.domain.RestaurantReviewVO;
import com.tripster.domain.RestaurantVO;
import com.tripster.service.RestaurantReviewService;
import com.tripster.service.RestaurantService;

@RestController
//@RequestMapping("/restaurants")
@RequestMapping("/restaurants/*")
public class RestaurantController {
//	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	@Inject
	private RestaurantService restaurantService;
	@Inject
	private RestaurantReviewService restaurantReviewService;
	
	//맛집 상세 정보 조회
//	@RequestMapping(value = "/restaurantDetail", method = RequestMethod.GET)
//	public void restaurantDetail(@RequestParam("restaurantID") int restaurantID, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
////		logger.info(cri.toString());
//		
//		//View로 맛집 상세 정보 전달
//		model.addAttribute(service.getRestaurantDetail(restaurantID));
//	}
	
	//맛집 상세 정보 조회 - REST 방식
	//ResponseEntity : JSON + HTTP 응답상태까지 전달, @Pathvariable로 변수를 받아서 사용 
	@RequestMapping(value = "/restaurantDetail/{restaurantID}", method = RequestMethod.GET)
	public ResponseEntity<RestaurantVO> restaurantDetail(@PathVariable("restaurantID") Integer restaurantID) {
		ResponseEntity<RestaurantVO> vo = null;
		
		try {
			//해당 restaurantID를 가진 객체를 vo에 저장
			vo = new ResponseEntity<>(restaurantService.getRestaurantDetail(restaurantID), HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			vo = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return vo;
	}
	
	//맛집 리스트 조회
//	@RequestMapping(value = "/restaurantList", method = RequestMethod.GET)
//	public void restaurantList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
////		logger.info(cri.toString());
//
//		//View에 맛집 리스트 전달
//		model.addAttribute("list", service.getRestaurantList(cri));
//		//페이징 처리 객체 생성
//		PageMaker pageMaker = new PageMaker();
//		//페이징 처리를 위한 Criteria 객체 전달
//		pageMaker.setCri(cri);
//		//페이징 처리를 위한 총 맛집 개수 전달 
//		pageMaker.setTotalCount(service.getTotalRestaurantNum(cri));
//		//View에 페이징 처리 객체 전달
//		model.addAttribute("pageMaker", pageMaker);
//	}
	
	//맛집 리스트 조회 - REST 방식
	//ResponseEntity : JSON 객체  + HTTP 응답상태 전달, @Pathvariable로 변수를 받아서 사용
	@RequestMapping(value = "/restaurantList/{curPage}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> restaurantList(@PathVariable("curPage") Integer curPage) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			//맛집 리스트 정보를 전달하기 위해, Criteria 객체 생성
			Criteria cri = new Criteria();
			cri.setCurPage(curPage);
			//페이지 정보를 전달하기 위해, PageMaker 객체 생성
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			//Map 객체 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			//ResponseEntity 객체에 담을 맛집 객체 리스트 저장  
			List<RestaurantVO> list = restaurantService.getRestaurantList(cri);
			map.put("list", list);
			//ResponseEntity 객체에 담을 PageMaker 객체 저장
			pageMaker.setTotalCount(restaurantService.getTotalRestaurantNum(cri));
			map.put("pageMaker", pageMaker);
			
			//View로 전달할 ResponsEntity 객체 생성 + 정보 전달 
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
	//특정 맛집의 리뷰 조회
	//@PathVariable로 변수를 받아서 사용
	@RequestMapping(value = "/restaurantDetail/{restaurantID}/{curPage}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> restaurantReviewList(
			@PathVariable("restaurantID") Integer restaurantID,
			@PathVariable("curPage") Integer curPage) {
		ResponseEntity<Map<String, Object>> entity = null;
			
		try {
			Criteria cri = new Criteria();
			cri.setCurPage(curPage);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<RestaurantReviewVO> list = restaurantReviewService.getRestaurantReviewList(restaurantID, cri);
			map.put("list", list);
			
			int reviewCount = restaurantReviewService.getTotalRestaurantReviewNum(restaurantID);
			pageMaker.setTotalCount(reviewCount);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//맛집 리뷰 작성
	//@RequestBody : View에서 JSON 객체를 전달 받아 사용
//	@RequestMapping(value="/restaurantDetail/{restaurantID}", method = RequestMethod.POST)
//	public ResponseEntity<String> writeReview(@PathVariable RestaurantID id, @RequestBody RestaurantReviewVO vo) {
//		//ResponseEntity : View로 JSON + HTTP 상태 전달
//		ResponseEntity<String> entity = null;
//		
//		try {
//			//리뷰 작성 메서드 호출
//			restaurantReviewService.writeReview(vo);
//			entity = new ResponseEntity<String>("success", HttpStatus.OK);
//		} catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
	
	
	
}