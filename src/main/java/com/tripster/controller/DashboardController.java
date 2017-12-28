package com.tripster.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;
import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashCountryVO;
import com.tripster.domain.DashDetailVO;
import com.tripster.domain.DashLikeVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PageMaker;
import com.tripster.service.ContentsReviewService;
import com.tripster.service.ContentsService;
import com.tripster.service.DashboardService;

import net.sf.json.JSONArray;

//@RestController
@RequestMapping("/dashboard/*")
@Controller
public class DashboardController {
//	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@Inject
	private DashboardService dashboardService;

	@RequestMapping(value = "stat", method = RequestMethod.GET)
	public String dashboardMain(Model model) throws Exception {
		return "dashboard/dashboard";
	}
	
	
	//맛집 리스트 조회 - REST 방식
	//ResponseEntity : JSON 객체  + HTTP 응답상태 전달, @Pathvariable로 변수를 받아서 사용
	@RequestMapping(value = "stat/{memberID}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> restaurantList(@PathVariable("memberID") Integer memberID) throws Exception {
		
		ResponseEntity<Map<String, Object>> entity = null;
		//ModelAndView modelAndView = null;
		
		try {
			//Map 객체 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			// 화면에 전달한 데이터를 받아옴. 대쉬브리프, 대쉬디테일, 대쉬라이크 현재 세 가지
			DashBriefVO dashBrief = dashboardService.getPlanBriefInfo(memberID);
			List<DashDetailVO> detailList = dashboardService.getPlanDetailInfo(memberID);
			List<DashLikeVO> likeList = dashboardService.getPlanLikeInfo(memberID);
			List<DashCountryVO> countryList = dashboardService.getPlanCountryInfo(memberID);
			
			map.put("dashBrief", dashBrief);
			map.put("detailList", detailList);
			map.put("likeList", likeList);
			map.put("countryList", countryList);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
			//modelAndView = new ModelAndView();
			//JSONArray json = new JSONArray(); 
			//modelAndView.addObject("dashBrief", JSONArray.fromObject(dashBrief));
			//modelAndView.setViewName("/dashboard/dashboard");
			/*				
			//Map 객체 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			//ResponseEntity 객체에 담을 컨텐츠 객체 리스트 저장  
			List<ContentsVO> list = contentsService.getRestaurantList(cri);
			map.put("list", list);
			//ResponseEntity 객체에 담을 PageMaker 객체 저장
			pageMaker.setTotalCount(contentsService.getTotalRestaurantNum(cri));
			map.put("pageMaker", pageMaker);
			
			//View로 전달할 ResponsEntity 객체 생성 + 정보 전달 
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			*/
		} catch(Exception e) {
			//오류 발생 시, BAD_REQUEST 상태 입력
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		//return modelAndView;
	}
	
	//맛집 리스트 조회 - REST 방식
	//ResponseEntity : JSON 객체  + HTTP 응답상태 전달, @Pathvariable로 변수를 받아서 사용
	
	@RequestMapping(value = "/rcm", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> placeList(@PathVariable("curPage") Integer curPage) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			
			//Map 객체 생성
			Map<String, Object> map = new HashMap<String, Object>();
			/*
			//컨텐츠 리스트 정보를 전달하기 위해, Criteria 객체 생성
			Criteria cri = new Criteria();
			cri.setCurPage(curPage);
			//페이지 정보를 전달하기 위해, PageMaker 객체 생성
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			

			
			//ResponseEntity 객체에 담을 컨텐츠 객체 리스트 저장  
			List<ContentsVO> list = contentsService.getPlaceList(cri);
			map.put("list", list);
			//ResponseEntity 객체에 담을 PageMaker 객체 저장
			pageMaker.setTotalCount(contentsService.getTotalPlaceNum(cri));
			map.put("pageMaker", pageMaker);
			
			//View로 전달할 ResponsEntity 객체 생성 + 정보 전달 
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			*/
		} catch(Exception e) {
			//오류 발생 시, BAD_REQUEST 상태 입력
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
}