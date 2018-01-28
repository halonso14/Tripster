package com.tripster.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.tripster.domain.Criteria;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PageMaker;
import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.PlanVO;
import com.tripster.dto.LoginDTO;
import com.tripster.service.LikeService;
import com.tripster.service.MemberService;
import com.tripster.service.PlanService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;
	@Inject
	private PlanService planservice;
	@Inject
	private LikeService likeservice;

	// 로그인 화면 접근
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		MemberVO vo = service.login(dto);
		
		try {
			if (vo == null) {
				
				return;
			}
			model.addAttribute("memberVO", vo);
		} catch(Exception e) {
			return;
		}

		if (dto.isUseCookie()) {
			int amount = 60 * 60 * 24;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getMemberID(), session.getId(), sessionLimit);

		}

	}

	// 회원가입 화면 접근
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(MemberVO vo, Model model) throws Exception {

	}

	// 회원가입 처리
	@RequestMapping(value = "/registerPost", method = RequestMethod.POST)
	public String registerPost(MemberVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("회원 등록");
		logger.info(vo.toString());

		service.register(vo);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/";
	}

	// 이메일 인증
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String memberEmail, Model model) throws Exception {
		service.authMember(memberEmail);
		model.addAttribute("memberEmail", memberEmail);

		return "/member/emailConfirm";
	}

	// 이메일 중복확인(j-query validation)
	@RequestMapping(value = "/repeatChk", method = RequestMethod.GET)
	public @ResponseBody String repeatChk(@RequestParam("memberEmail") String memberEmail) throws Exception {

		if (service.repeatChk(memberEmail) == true) {
			return "true";
		} else {
			return "false";
		}
	}

	// 비밀번호 찾기 화면 접근
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public void findPasswordGET(MemberVO vo, Model model) throws Exception {

	}

	// 비밀번호 찾기 메일 전송
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPasswordPost(MemberVO vo, RedirectAttributes rttr) throws Exception {
		
		//가입된 메일이 아닐경우
		if(service.repeatChk(vo.getMemberEmail())) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/member/findPassword";
			
		//가입된 메일인경우 메일 전송
		} else {
			service.findPassword(vo);
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/member/findPassword";
		}
		
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			MemberVO vo = (MemberVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);

				service.keepLogin(vo.getMemberID(), session.getId(), new Date());
			}
		}
		return "member/logout";
	}

	   // 마이페이지 조회
	   @RequestMapping(value = "/mypage", method = RequestMethod.GET)
	   public void mypage(MemberVO vo, HttpSession session, Model model) throws Exception {

	      Object obj = session.getAttribute("login");
	      MemberVO memVO = (MemberVO) obj;
	      int memberID = memVO.getMemberID();
	      
	      Criteria cri = new Criteria();
	      List<String> picList = new ArrayList<String>();
	      List<Integer> likeChkList = new ArrayList<Integer>();
	      List<PlanVO> planVO = planservice.myPlan(memberID, cri);
	      int planCount = service.planCount(memberID);
	      
	      for(int i=0;i<planVO.size();i++) {
	         String picName = "false";
	         //planDetailVO가 한개라도 있을 경우
	         if(planVO.get(i).getPlanDetailVO() != null ) {
	            for(int j=0; j<planVO.get(i).getPlanDetailVO().size(); j++) {
	               PlanDetailVO pd = planVO.get(i).getPlanDetailVO().get(j);
	               if(pd.getMemoVO() != null) {
	                  if(pd.getMemoVO().getMemoPictureVO().get(0).getMemoPictureName() != null) {
	                     picList.add( "'"+ pd.getMemoVO().getMemoPictureVO().get(0).getMemoPictureName() + "'");
	                     picName = "true";
	                     break;
	                  } 
	               }
	            }
	            if(picName.equals("false")) {
	               picList.add("''");
	               picName = "true";
	            }
	         }
	         if(picName.equals("false")) picList.add("");
	      }
	      
	      for(int i=0;i<planVO.size();i++) {
	         likeChkList.add(likeservice.likeCheck(planVO.get(i).getPlanID(), memberID));
	      }
	            
	      model.addAttribute("likeChkList", likeChkList);
	            
	      model.addAttribute("planCount", planCount);
	      model.addAttribute("pictureID", picList);
	      model.addAttribute("planVO", planVO);

	      model.addAttribute(service.mypage(memberID));
	   }
	   
	   @RequestMapping(value = "/mypage/{memberID}/{page}", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	   public ResponseEntity<Map<String, Object>> myPlan(@PathVariable("memberID") Integer memberID,
	                                           @PathVariable("page") Integer page, HttpSession session){
	      ResponseEntity<Map<String, Object>> entity = null;
	      
	      try {
	         Criteria cri = new Criteria();
	         cri.setCurPage(page);
	         
	         PageMaker pageMaker = new PageMaker();
	         pageMaker.setCri(cri);
	         
	         Map<String, Object> map = new HashMap<String, Object>();
	         List<PlanVO> list = planservice.myPlan(memberID, cri);
	         
	         map.put("list", list);
	         
	         int planCount = service.planCount(memberID);
	         pageMaker.setPlanCount(planCount);
	         
	         map.put("pageMaker", pageMaker);
	         
	         List<Integer> likeChkList = new ArrayList<Integer>();
	         Object obj = session.getAttribute("login");
	         try {
	            if(obj != null) {
	               MemberVO memVO = (MemberVO) obj;
	               // 현재 접속중인 회원(memberID 사용중, userID로 대체)
	               Integer userID = memVO.getMemberID();
	               
	               for(int i=0;i<list.size();i++) {
	                  likeChkList.add(likeservice.likeCheck(list.get(i).getPlanID(), userID));
	               }
	               
	            } else {
	               for(int i=0; i<list.size();i++) {
	                  likeChkList.add(0);
	               }
	            }
	            map.put("likeChkList", likeChkList);
	            
	         } catch(Exception e) {
	            
	         }
	         
	         entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	         
	      } catch(Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	   }
	
	// 기본정보 변경
	@RequestMapping(value = "/changeProfile", method = RequestMethod.POST)
	public String changeProfile(MemberVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;
		vo.setMemberID(memVO.getMemberID());
		
		String newNick = vo.getMemberName();
		memVO.setMemberName(newNick);

		service.changeProfile(vo);

		rttr.addFlashAttribute("msg", "profile");

		return "redirect:/member/mypage";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(MemberVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;
		vo.setMemberID(memVO.getMemberID());

		System.out.println(vo);

		service.changePassword(vo);

		rttr.addFlashAttribute("msg", "password");

		return "redirect:/member/mypage";
	}

	// 기존 비밀번호 확인(j-query validation)
	@RequestMapping(value = "/passwordChk", method = RequestMethod.GET)
	public @ResponseBody String passwordChk(MemberVO vo, HttpSession session, String curMemberPassword) throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;
		memVO.setMemberPassword(curMemberPassword);
		
		System.out.println(curMemberPassword);
		System.out.println(memVO);
		
		if (service.passwordChk(memVO) == true) {
			return "true";
		} else {
			return "false";
		}
	}

	// 회원 탈퇴
	@RequestMapping(value = "/dropMember", method = RequestMethod.POST)
	public String remove(MemberVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session,
			RedirectAttributes rttr) throws Exception {

		Object obj = session.getAttribute("login");
		MemberVO memVo = (MemberVO) obj;

		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
		}

		service.dropMember(memVo.getMemberID());

		rttr.addFlashAttribute("msg", "delete");

		return "redirect:/";
	}
	
	// 다른 회원 정보 조회 페이지
	@RequestMapping(value = "/viewMember", method = RequestMethod.GET)
	public void viewMember(@RequestParam("memberID") int memberID, HttpSession session, Model model)throws Exception{
		
		Criteria cri = new Criteria();
		List<String> picList = new ArrayList<String>();
		List<Integer> likeChkList = new ArrayList<Integer>();
		List<Integer> followChkList = new ArrayList<Integer>();
		List<PlanVO> vo = planservice.myPlan(memberID, cri);
		int planCount = service.planCount(memberID);
		
		for(int i=0;i<vo.size();i++) {
			String picName = "false";
			//planDetailVO가 한개라도 있을 경우
			if(vo.get(i).getPlanDetailVO() != null ) {
				for(int j=0; j<vo.get(i).getPlanDetailVO().size(); j++) {
					PlanDetailVO pd = vo.get(i).getPlanDetailVO().get(j);
					if(pd.getMemoVO() != null) {
						if(pd.getMemoVO().getMemoPictureVO().get(0).getMemoPictureName() != null) {
							picList.add( "'"+ pd.getMemoVO().getMemoPictureVO().get(0).getMemoPictureName() + "'");
							picName = "true";
							break;
						} 
					}
				}
				if(picName.equals("false")) {
					picList.add("''");
					picName = "true";
				}
			}
			if(picName.equals("false")) picList.add("");
		}
		
		
		Object obj = session.getAttribute("login");
		//회원 로그인 한 경우 likeChkList, followChkList를 뷰단에 전송
		try {
			if(obj != null) {
				MemberVO memVO = (MemberVO) obj;
				// 현재 접속중인 회원(memberID 사용중, userID로 대체)
				Integer userID = memVO.getMemberID();
				
				for(int i=0;i<vo.size();i++) {
					likeChkList.add(likeservice.likeCheck(vo.get(i).getPlanID(), userID));
				}
				
				model.addAttribute("likeChkList", likeChkList);
				
				followChkList.add(likeservice.followCheck(userID, memberID));
				
				model.addAttribute("followChkList", followChkList);
				
			}
			
		} catch(Exception e) {
			
		}
		
		model.addAttribute("planCount", planCount);
		model.addAttribute("pictureID", picList);
		model.addAttribute("planVO", vo);
		model.addAttribute(service.mypage(memberID));
		
	}
	
	@RequestMapping(value = "/viewMember/{memberID}/{page}", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("memberID") Integer memberID,
														 @PathVariable("page") Integer page){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setCurPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<PlanVO> list = planservice.myPlan(memberID, cri);
			
			map.put("list", list);
			
			int planCount = service.planCount(memberID);
			pageMaker.setPlanCount(planCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 유저 추천페이지 위한 설문(수정도 됨)페이지 제공
	@RequestMapping(value = "/register/detail", method = RequestMethod.GET)
	public String userDetail(MemberVO vo, Model model) throws Exception {

		return "member/userDetail";
	}

}