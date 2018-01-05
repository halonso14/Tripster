package com.tripster.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.tripster.domain.Criteria;
import com.tripster.domain.MemberVO;
import com.tripster.domain.MemoVO;
import com.tripster.domain.PageMaker;
import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.PlanReplyVO;
import com.tripster.domain.PlanVO;
import com.tripster.service.MemoService;
import com.tripster.service.PlanDetailService;
import com.tripster.service.PlanReplyService;
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
	@Inject
	private PlanReplyService planReplyService;
	
	//**************************plan 관련 ********************************/
	
//	plan 등록 form 페이지 요청.
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() throws Exception{
		
	}
		
	//plan 등록.
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(PlanVO planVO, RedirectAttributes rttr,HttpSession session)throws Exception{
		//session읽어들이기
		MemberVO memberVO = (MemberVO)session.getAttribute("login");
		
		//planID & planEndChk default값 설정.
		planVO.setPlanID(0);
		planVO.setPlanEndChk(0);
		planVO.setMemberID(memberVO.getMemberID());
		
		//등록 작업 수행.
		planService.registerPlan(planVO);
		
		//등록 후 부여받은 planID값 조회.
		planVO.setPlanID(planService.readPlanID());
		
		//plan 등록 폼에서 일정표의 default값으로 시작일정 설정해 주기 위해서 'yyy-MM-dd'와 같은 형식으로 만들어줌.
		Date from =planVO.getPlanStartDate();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = "'"+transFormat.format(from)+"'";
		
		from = planVO.getPlanEndDate();
		String endDate =  "'"+transFormat.format(from)+"'";
		
		//date , planVO값을 파라미터로 넘겨줌.
		rttr.addFlashAttribute("startDate",startDate);
		rttr.addFlashAttribute("endDate",endDate);
		rttr.addFlashAttribute("planVO", planVO);
		
		//새로 고침 시, 다시 db에 insert되는 것을 막기 위해 redirect함.
		return "redirect:/plan/detail?planID="+planVO.getPlanID();
	}
	
	//plan 조회
		@RequestMapping(value="/read", method=RequestMethod.GET)
		public void readPlan(@RequestParam("planID") int planID, ModelMap model) throws Exception{
			PlanVO plan = planService.readPlan(planID);
			Date from =plan.getPlanStartDate();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String startDate = "'"+transFormat.format(from)+"'";
			
			from = plan.getPlanEndDate();
			String endDate = "'"+transFormat.format(from)+"'";
			
			//작성자 명 조회.
			String memberName = planService.memberName(plan.getMemberID());
			System.out.println("작성자:"+memberName);
			
			model.addAttribute("startDate",startDate);
			model.addAttribute("endDate",endDate);
			model.addAttribute("plan",plan);
			model.addAttribute("memberName", memberName);
		}
		
		//plan 수정
		@RequestMapping(value="/update", method=RequestMethod.GET)
		public void updatePlanGET(@RequestParam("planID") int planID, ModelMap model)throws Exception{
			PlanVO  vo = planService.readOnlyPlan(planID);
		
			//plan 수정 폼에서 default date를 지정해주기 위해서.
			Date from =vo.getPlanStartDate();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String startDate = "'"+transFormat.format(from)+"'";
			
			from = vo.getPlanEndDate();
			String endDate = "'"+transFormat.format(from)+"'";
			

			model.addAttribute("plan",vo);
			model.addAttribute("startDate",startDate);
			model.addAttribute("endDate",endDate);
		}
		
		// plan 수정 폼에서 detailVO 조회.
		@RequestMapping(value="/update", produces = "application/json; charset=utf8",method=RequestMethod.POST)
		public @ResponseBody List<PlanDetailVO> updatePlanPOST(@RequestBody PlanVO planVO) throws Exception{	
			 return planDetailService.readAllPlanDetail(planVO.getPlanID());
			 
		}
		
		//plan 전체 삭제
		@RequestMapping(value="/delete", method=RequestMethod.POST)
		public String deletePlan(@RequestParam int planID)throws Exception{
			//삭제 작업 수행.
			planService.removePlan(planID);
			
			//삭제 후, redirect로 홈으로 보냄.
			 return "redirect:/";
		}
		
		//내가 등록한 plan 전체 조회
		@RequestMapping(value="/myplan", method=RequestMethod.GET)
		public void myplan(@RequestParam("memberID") int memberID, ModelMap model) throws Exception {
			model.addAttribute("myPlanList",planService.myPlan(memberID));
		}
		
//**************************plan Detail 관련 ********************************/
		
		
	//planDetail Form 페이지 요청.
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detailForm(HttpServletRequest request, Model model) throws Exception {
		int planID = Integer.parseInt(request.getParameter("planID"));
		//redirect로 넘어온 요청이 아니라, 사용자가 임의로 새로고침 요청할 경우 update페이지로 이동.
		if(null == RequestContextUtils.getInputFlashMap(request) )	return "redirect:/plan/update?planID="+planID;
		
		//redirect로 넘어온경우 파라미터를 읽음.
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		PlanVO planVO = (PlanVO) flashMap.get("planVO");
		
		//planVO를 그대로 응답으로 보냄.
		model.addAttribute("planVO",planVO);
		
		return "/plan/detail";
	}
	
	//상세 일정 등록.
	@RequestMapping(value="/detail/register", method=RequestMethod.POST)
	public @ResponseBody int detailRegister(@RequestBody PlanDetailVO vo) throws Exception {
		
		//한번에 받아 온 날짜와 시간을 분리하여 저장.
		String startTime = vo.getPlanDetailStartTime();
		String date[] = startTime.split("T",0);
		//받아온 파라미터 값중 planDetailID의 default 값 셋팅.
		vo.setPlanDetailID(0);
		//date & startTime을 지정된 형식으로 vo에 값 셋팅.
		vo.setPlanDetailDate(date[0]);
		vo.setPlanDetailStartTime(date[1]);
				
		//일정 상세 등록 수행.
		planDetailService.registerPlanDetail(vo);
		
		//db저장 후 할당된 planDetailID 값 조회 후 응답.
		int planDetailID = planDetailService.readPlanDetailID();
		
		//등록 후 할당된 detailID를 event에 부여하기 위해 planDetailID값 리턴.
		return planDetailID;
	}

	//상세 일정 시간 수정.
	@RequestMapping(value="/detail/update", method=RequestMethod.POST)
	public  ResponseEntity<String> updateDetail(@RequestBody PlanDetailVO vo) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			Map<String, Object> map = new HashMap();
					
			//한번에 받아 온 날짜와 시간을 분리하여 저장.
			String planDetailStartTime = vo.getPlanDetailStartTime();
			String dateStart[] = planDetailStartTime.split("T",0);		
			String planDetailEndTime = vo.getPlanDetailEndTime();
			
			//EndTime이 존재하면, endTime도 지정된 포맷으로 저장.
			if(planDetailEndTime != null) {
				String dateEnd[] = planDetailEndTime.split("T",0);
				map.put("planDetailEndTime", dateEnd[1]);
			}		
		
			//업데이트 시, 필요한 시간과, planDetailID 값을 map에 저장.
			map.put("planDetailStartTime", dateStart[1]);	
			map.put("planDetailID", vo.getPlanDetailID());
			
			//업데이트 작업.
			planDetailService.modifyPlanDetail(map);
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//상세 일정 삭제 .
	@RequestMapping(value="/detail/delete/{planDetailID}", method=RequestMethod.POST)
	public ResponseEntity<String> deleteDetail(@PathVariable("planDetailID") int planDetailID ) throws  Exception {
		ResponseEntity<String> entity = null;
		
		try {
			planDetailService.deletePlanDetail(planDetailID);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	//사용자 지정 상세 일정 등록.
	@RequestMapping(value="/user/register", method=RequestMethod.POST)
	public @ResponseBody int registerUserDetail(@RequestBody PlanDetailVO vo)throws Exception{
		
		//startTime 과 endTime을 읽어들인 후, 지정된 포맷으로 vo에 다시 셋팅.
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
		
		//사용자 지정 상세 일정 등록 후, 할당받은 planDetailID값을 evnet_id에 지정해 주기 위해 planDetailID값 리턴.
		return planDetailID;
	}
	
	//**************************메모 관련 ********************************/
	//메모 등록
	@RequestMapping(value="/memo/register",method= RequestMethod.POST)
	public ResponseEntity<String> registerMemo(MemoVO vo ,HttpServletRequest request)throws Exception{
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		try {
			memoService.registerMemo(vo);
			entity = new ResponseEntity<String>("R_SUCCESS",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//메모 조회
	@RequestMapping(value="/memo/{planDetailID}", produces = "application/json; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity <Map<String,Object>> readMemo(@PathVariable("planDetailID") int planDetailID)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			entity= new ResponseEntity<Map<String,Object>>(memoService.selectMemo(planDetailID),HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>( HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//메모 수정
	@RequestMapping(value="/memo/update",method=RequestMethod.POST)
	public  ResponseEntity<String>  updateMemo(MemoVO vo  )throws Exception{
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		try {
			memoService.updateMemo(vo);
			entity = new ResponseEntity<String>("U_SUCCESS",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//메모 삭제
	@RequestMapping(value="/memo/delete/{planDetailID}", method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> deleteMemo(@PathVariable("planDetailID") int planDetailID) throws Exception{
		System.out.println("삭제!!!!!!!!!!!!!!!!");
		ResponseEntity<String> entity =null;
		try {
			memoService.deleteMemo(planDetailID);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	//**************************댓글 관련 ********************************/

	//댓글 등록.
	@RequestMapping(value="/reply/register", produces = "application/text; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> registerReply(@RequestBody PlanReplyVO vo, HttpSession session){
		ResponseEntity<String> entity = null;
		
		//memberID값 받기.
		MemberVO memberVO = (MemberVO)session.getAttribute("login");
		vo.setMemberID(memberVO.getMemberID());
		try {
			planReplyService.register(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK	);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//댓글 조회
	@RequestMapping(value="/reply/read/{planID}/{page}", produces = "application/json; charset=utf8",method=RequestMethod.GET	)
	public @ResponseBody ResponseEntity<Map<String,Object>> readReply(@PathVariable("planID") int planID, @PathVariable("page") int page){
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setCurPage(page);
			
			PageMaker pageMaker = new PageMaker()	;
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<PlanReplyVO> list = planReplyService.read(planID, cri);
			
			map.put("reply", list);
			
			int replyCount = planReplyService.count(planID);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			map.put("replyCount", replyCount);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//댓글 수정
	@RequestMapping(value="/reply/update", produces = "application/text; charset=utf8",method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> updateReply(@RequestBody PlanReplyVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			planReplyService.update(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//삭제
	@RequestMapping(value="/reply/delete/{planReplyID}",produces = "application/text; charset=utf8", method=RequestMethod.POST)
	public ResponseEntity<String> deleteReply(@PathVariable("planReplyID") int planReplyID){
		ResponseEntity<String> entity = null;
		
		try {
			planReplyService.delete(planReplyID);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
