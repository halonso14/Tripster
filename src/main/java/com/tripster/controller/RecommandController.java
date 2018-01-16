package com.tripster.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpRequest;
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
import com.tripster.domain.PlanVO;
import com.tripster.domain.RcmPlanVO;
import com.tripster.service.ContentsReviewService;
import com.tripster.service.ContentsService;
import com.tripster.service.DashboardService;
import com.tripster.service.RecommandService;

import net.sf.json.JSONArray;

//@RestController
@RequestMapping("/rcm/*")
@Controller
public class RecommandController {
//	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@Inject
	private RecommandService recommandService;
	
	//
	@RequestMapping(value = "{countryISO2}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> planList(@PathVariable("countryISO2") String countryISO2) throws Exception {
		
		ResponseEntity<Map<String, Object>> entity = null;
		//ModelAndView modelAndView = null;
		
		try {
			//Map 객체 생성
			Map<String, Object> map = new HashMap<String, Object>();
			
			// 화면에 전달한 데이터를 받아옴. 대쉬브리프, 대쉬디테일, 대쉬라이크 현재 세 가지
			List<PlanVO> planList = recommandService.getPlanList(countryISO2);
			map.put("planList", planList);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
			
		} catch(Exception e) {
			//오류 발생 시, BAD_REQUEST 상태 입력
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		//return modelAndView;
	}
	
}