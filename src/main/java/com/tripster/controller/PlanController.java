package com.tripster.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
	
	//plan 조회
	@RequestMapping(value="/planDetail", method=RequestMethod.GET)
	public void planDetail(@RequestParam("planID") int planID, ModelMap model) throws Exception{
		System.out.println(planID);
		model.addAttribute("plan",planService.readPlan(planID));
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
		vo.setCodeID(Integer.parseInt((String)modelMap.get("codeID")));
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
	public @ResponseBody void updatePlanDetail(@RequestBody Map<String,Object> modelMap) throws Exception {
		Map<String, Object> map = new HashMap();
				
		//한번에 받아 온 날짜와 시간을 분리하여 저장.
		String dateAndTime = (String)modelMap.get("dateAndTime");
		String date[] = dateAndTime.split("T",0);
		
		//업데이트 시, 필요한 시간과, planDetailID 값을 map에 저장.
		map.put("planDetailStartTime", date[1]);
		map.put("planDetailID", Integer.parseInt((String)modelMap.get("planDetailID")));
		
		//업데이트 작업.
		planDetailService.modifyPlanDetail(map);
	}
	
	//상세 일정 삭제 .
	@RequestMapping(value="/deletePlanDetail", method=RequestMethod.POST)
	public @ResponseBody void deletePlanDetail(@RequestBody Map<String,Object> modelMap ) throws  Exception {
		//브라우저에서 넘어온 파라미터 읽기.
		int planDetailID = Integer.parseInt((String)modelMap.get("planDetailID"));
		//삭제 작업.
		planDetailService.deletePlanDetail(planDetailID);
	}
	
	//사용자 지정 상세 일정 등록.
	@RequestMapping(value="/UserPlanDetail", method=RequestMethod.POST)
	public @ResponseBody int registerUserPlanDetail(@RequestBody PlanDetailVO vo)throws Exception{
		
		String dateAndTime = (String) vo.getPlanDetailDate();
		String date[] = dateAndTime.split("T",0);
		
		vo.setPlanDetailID(0);
		vo.setPlanDetailDate(date[0]);
		vo.setPlanDetailStartTime(date[1]);
		
		//등록 작업 수행.
		planDetailService.registerPlanDetail(vo);
		
		//db저장 후 할당된 planDetailID 값 조회 후 응답.
		int planDetailID = planDetailService.readPlanDetailID();
		
		return planDetailID;
	}
	
	//메모 등록
	@RequestMapping(value="/registerMemo", method= RequestMethod.POST)
	public @ResponseBody void registerMemo(@RequestBody MemoVO vo )throws Exception{
		System.out.println("등록. : "+vo);
		memoService.registerMemo(vo);

	}
	
	//메모 조회
	@RequestMapping(value="/selectMemo", produces = "application/json; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> selectMemo(@RequestBody MemoVO  vo)throws Exception{
		System.out.println(vo.getPlanDetailID());	
		//Map<String,Object> map = new HashMap<>();
		System.out.println(memoService.selectMemo(vo.getPlanDetailID()));
		return memoService.selectMemo(vo.getPlanDetailID());
	}
	
	//메모 수정
	@RequestMapping(value="/modifyMemo", produces = "application/json; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody void modifyMemo(@RequestBody MemoVO vo)throws Exception{
		System.out.println("수정 : "+vo);
		memoService.updateMemo(vo);
	}
	
	//메모 삭제
	@RequestMapping(value="/removeMemo", method=RequestMethod.POST)
	public @ResponseBody void removeMemo(@RequestBody MemoVO vo) throws Exception{
		System.out.println(vo);
		int planDetailID = vo.getPlanDetailID();
		
		memoService.deleteMemo(planDetailID);
		
	}
	
	//내가 등록한 plan 전체 조회
	@RequestMapping(value="/myPlan", method=RequestMethod.GET)
	public void myPlan(@RequestParam("memberID") int memberID, ModelMap model) throws Exception {
		model.addAttribute("myPlanList",planService.myPlan(memberID));
	}
}
