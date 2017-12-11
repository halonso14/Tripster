package com.tripster.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.PlanVO;
import com.tripster.service.PlanDetailService;
import com.tripster.service.PlanService;

@Controller
@RequestMapping("/plan/*")
public class PlanController {
	
	@Inject
	private PlanService planService;
	@Inject
	private PlanDetailService planDetailService;
	
	//plan 등록 form 페이지 요청.
	@RequestMapping(value="/planRegister", method=RequestMethod.GET)
	public void registerPlanGET(PlanVO planVO, Model model) throws Exception{
		
	}
		
	//plan 등록.
	@RequestMapping(value="/planRegister",method=RequestMethod.POST)
	public String registerPlanPOST(PlanVO planVO, RedirectAttributes rttr)throws Exception{
		
		planVO.setPlanID(0);
		planService.registerPlan(planVO);
		
		Date from =planVO.getPlanStartDate();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String to = "'"+transFormat.format(from)+"'";
		
		rttr.addFlashAttribute("date",to);
		rttr.addFlashAttribute("planVO", planVO);
		//return "/plan/planDetailRegister";
		return "redirect:/plan/planDetailRegister";
	}
	
	//planDetail Form 페이지 요청.
	@RequestMapping(value="/planDetailRegister", method=RequestMethod.GET)
	public String registerPlanDetailGET(HttpServletRequest request, Model model) throws Exception {
		
		if(RequestContextUtils.getInputFlashMap(request) == null)	return "/plan/planRegister";
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
       
		PlanVO planVO = (PlanVO) flashMap.get("planVO");
		
		planVO.setPlanID(planService.readPlanID());
	
		model.addAttribute("planVO",planVO);
		
		return "/plan/planDetailRegister";
	}
	
	//상세 일정 등록.
	@RequestMapping(value="/detailRegister", method=RequestMethod.POST)
	public @ResponseBody int registerPlanDetailPOST(@RequestBody Map<String,Object> modelMap, Model model) throws Exception {
		PlanDetailVO vo = new PlanDetailVO();
		
		//한번에 받아 온 날짜와 시간을 분리하여 저장.
		String dateAndTime = (String)modelMap.get("dateAndTime");
		String date[] = dateAndTime.split("T",0);
	
		//받아온 파라미터 값을 detailVO에 저장.
		vo.setPlanDetailID(0);
		vo.setPlanID((int)modelMap.get("planID")); //planID는 Integer
		if(null!=modelMap.get("contentsID")) {
			vo.setContentsID(Integer.parseInt((String)modelMap.get("contentsID")));
		}
		vo.setCodeID(Integer.parseInt((String)modelMap.get("codeID")));
		vo.setTitle((String)modelMap.get("title"));
		vo.setPlanDetailDate(date[0]);
		vo.setPlanDetailStartTime(date[1]);
				
		planDetailService.registerPlanDetail(vo);
		
		//db저장 후 할당된 planDetailID 값 조회 후 응답.
		int planDetailID = planDetailService.readPlanDetailID();
		System.out.println(planDetailID);
		
		return planDetailID;
	}

	//상세 일정 시간 수정.
	@RequestMapping(value="/updatePlanDetail", method=RequestMethod.POST)
	public @ResponseBody void updatePlanDetail(@RequestBody Map<String,Object> modelMap) throws Exception {
		Map<String, Object> map = new HashMap();
		
		System.out.println(modelMap.get("dateAndTime"));
		
		String dateAndTime = (String)modelMap.get("dateAndTime");
		String date[] = dateAndTime.split("T",0);
		
		map.put("planDetailStartTime", date[1]);
		map.put("planDetailID", Integer.parseInt((String)modelMap.get("planDetailID")));
		
		
		planDetailService.modifyPlanDetail(map);
	}
	
	//상세 일정 삭제 .
	@RequestMapping(value="/deletePlanDetail", method=RequestMethod.POST)
	public @ResponseBody void deletePlanDetail(@RequestBody Map<String,Object> modelMap ) throws NumberFormatException, Exception {
		System.out.println(modelMap.get("planDetailID"));
		int planDetailID = Integer.parseInt((String)modelMap.get("planDetailID"));
		planDetailService.deletePlanDetail(planDetailID);
	}
	
}
