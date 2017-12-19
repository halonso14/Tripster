package com.tripster.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.tripster.domain.MemoVO;
import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.PlanVO;
import com.tripster.service.MemoService;
import com.tripster.service.PlanDetailService;
import com.tripster.service.PlanService;

@Controller
@RequestMapping("/plan/*")
public class PlanController {
	
	@Inject
	private PlanService planService;
	@Inject
	private PlanDetailService planDetailService;
	@Inject
	private MemoService memoService;
	
	//plan 등록 form 페이지 요청.
	@RequestMapping(value="/planRegister", method=RequestMethod.GET)
	public void registerPlanGET() throws Exception{
		
	}
		
	//plan 등록.
	@RequestMapping(value="/planRegister",method=RequestMethod.POST)
	public String registerPlanPOST(PlanVO planVO, RedirectAttributes rttr)throws Exception{
		
		planVO.setPlanID(0);
		planVO.setPlanEndChk(0);
		planService.registerPlan(planVO);
		
		Date from =planVO.getPlanStartDate();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String to = "'"+transFormat.format(from)+"'";
		
		rttr.addFlashAttribute("date",to);
		rttr.addFlashAttribute("planVO", planVO);
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
	public @ResponseBody int registerPlanDetailPOST(@RequestBody Map<String,Object> modelMap) throws Exception {
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
		vo.setCategoryID((Integer.parseInt((String)modelMap.get("categoryID"))));
		vo.setTitle((String)modelMap.get("title"));
		vo.setPlanDetailDate(date[0]);
		vo.setPlanDetailStartTime(date[1]);
				
		planDetailService.registerPlanDetail(vo);
		
		//db저장 후 할당된 planDetailID 값 조회 후 응답.
		int planDetailID = planDetailService.readPlanDetailID();
		
		return planDetailID;
	}

	//상세 일정 시간 수정.
	@RequestMapping(value="/updatePlanDetail", method=RequestMethod.POST)
	public @ResponseBody void updatePlanDetail(@RequestBody PlanDetailVO vo) throws Exception {
		
		System.out.println(vo);
		Map<String, Object> map = new HashMap();
				
		//한번에 받아 온 날짜와 시간을 분리하여 저장.
		String planDetailStartTime = vo.getPlanDetailStartTime();
		String dateStart[] = planDetailStartTime.split("T",0);
		
		String planDetailEndTime = vo.getPlanDetailEndTime();
		if(planDetailEndTime != null) {
			String dateEnd[] = planDetailEndTime.split("T",0);
			map.put("planDetailEndTime", dateEnd[1]);
		}
		System.out.println(planDetailStartTime+","+ planDetailEndTime);
		
	
		//업데이트 시, 필요한 시간과, planDetailID 값을 map에 저장.
		map.put("planDetailStartTime", dateStart[1]);
		
		map.put("planDetailID", vo.getPlanDetailID());
		
		//업데이트 작업.
		planDetailService.modifyPlanDetail(map);
	}
	
	//상세 일정 삭제 .
	@RequestMapping(value="/deletePlanDetail", method=RequestMethod.POST)
	public @ResponseBody void deletePlanDetail(@RequestBody PlanDetailVO vo ) throws  Exception {
		planDetailService.deletePlanDetail(vo.getPlanDetailID());
	}
	
	//사용자 지정 상세 일정 등록.
	@RequestMapping(value="/UserPlanDetail", method=RequestMethod.POST)
	public @ResponseBody int registerUserPlanDetail(@RequestBody PlanDetailVO vo)throws Exception{
		
		String planDetailStartTime = vo.getPlanDetailStartTime();
		String planDetailEndTime = vo.getPlanDetailEndTime();
		
		String dateStart[] = planDetailStartTime.split("T",0);
		String dateEnd[] = planDetailEndTime.split("T",0);
		
		
		vo.setPlanDetailID(0);
		vo.setPlanDetailDate(dateStart[0]);
		vo.setPlanDetailStartTime(dateStart[1]);
		vo.setPlanDetailEndTime(dateEnd[1]);
		
		//등록 작업 수행.
		planDetailService.registerPlanDetail(vo);
		
		//db저장 후 할당된 planDetailID 값 조회 후 응답.
		int planDetailID = planDetailService.readPlanDetailID();
		
		return planDetailID;
	}
	
	//메모 등록
	@RequestMapping(value="/registerMemo", method= RequestMethod.POST)
	public @ResponseBody void registerMemo(@RequestBody MemoVO vo )throws Exception{
		memoService.registerMemo(vo);

	}
	
	//메모 조회
	@RequestMapping(value="/selectMemo", produces = "application/json; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> selectMemo(@RequestBody MemoVO  vo)throws Exception{
		return memoService.selectMemo(vo.getPlanDetailID());
	}
	
	//메모 수정
	@RequestMapping(value="/modifyMemo", produces = "application/json; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody void modifyMemo(@RequestBody MemoVO vo)throws Exception{
		memoService.updateMemo(vo);
	}
	
	//메모 삭제
	@RequestMapping(value="/removeMemo", method=RequestMethod.POST)
	public @ResponseBody void removeMemo(@RequestBody MemoVO vo) throws Exception{
		int planDetailID = vo.getPlanDetailID();
		
		memoService.deleteMemo(planDetailID);
		
	}
	
	//내가 등록한 plan 전체 조회
	@RequestMapping(value="/myPlan", method=RequestMethod.GET)
	public void myPlan(@RequestParam("memberID") int memberID, ModelMap model) throws Exception {
		model.addAttribute("myPlanList",planService.myPlan(memberID));
	}
	
	
	//plan 조회
	@RequestMapping(value="/planDetail", method=RequestMethod.GET)
	public void planDetail(@RequestParam("planID") int planID, ModelMap model) throws Exception{
		model.addAttribute("plan",planService.readPlan(planID));
	}
	
	//plan 수정
	@RequestMapping(value="/planModifyForm", method=RequestMethod.GET)
	public void modifyPlan(@RequestParam("planID") int planID, ModelMap model)throws Exception{
		PlanVO  vo = planService.readPlan(planID);
		Date from =vo.getPlanStartDate();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String to = "'"+transFormat.format(from)+"'";
		model.addAttribute("plan",vo);
		model.addAttribute("date",to);
	}
	
	// plan form detailVO 조회.
	@RequestMapping(value="/planModifyForm", produces = "application/json; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody List<PlanDetailVO> planModifyForm(@RequestBody PlanVO planVO) throws Exception{	
		 return planDetailService.readAllPlanDetail(planVO.getPlanID());
		 
	}
	
	//plan 전체 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deletePlan(@RequestParam int planID)throws Exception{
		planService.removePlan(planID);
		
		 return "redirect:/";
	}
	
	
}
